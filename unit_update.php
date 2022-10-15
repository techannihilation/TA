<?php

require('./senses/luaparser.php');

function str_replace_first($search, $replace, $subject)
{
    $search = '/'.preg_quote($search, '/').'/';
    return preg_replace($search, $replace, $subject, 1);
}


$db = new SQLite3('test.db');
$version = $db->querySingle('SELECT SQLITE_VERSION()');
$db->exec("CREATE TABLE units (
    id INTEGER PRIMARY KEY, 
    name TEXT, 
    faction TEXT,
    buildcostEnergy REAL,
    buildCostMetal REAL,
    productionEnergy REAL,
    productionMetal REAL,
    type TEXT,
    techLevel TEXT,
    unitFile TEXT
    )");

$parser = new LUAParser();

$files = scandir('./units/');
foreach($files as $file)
{
    if($file == '.' || $file == '..' )
    {
        continue;
    }

    if(!strpos($file, '.lua'))
    {
        continue;
    }

    try {
        $parser->parseFile('./units/'.$file);
        $unit = $parser->data;
        foreach($unit as $key => $value)
        {
            $unitKey = $key;
        }
        
        $name = preg_replace("/[^a-zA-Z0-9\s]/", "", $unit[$unitKey]['name']);
        $faction = strtoupper($unit[$unitKey]['customparams']['faction']);
        $type = 'Unknown';
        $icon = 'Unset';
        $canBuild = 'No';
        $buildEnergy = $unit[$unitKey]['buildcostenergy'];
        $buildMetal = $unit[$unitKey]['buildcostmetal'];
        $productionEnergy = 0;
        $productionMetal = 0;
        $techLevel = 0;
        $labTechLevel = '';

        $labExpectedMetal = [];
        $labExpectedMetal[0] = 0;
        $labExpectedMetal[1] = 1000;
        $labExpectedMetal[2] = 5000;
        $labExpectedMetal[3] = 20000;
        $labExpectedMetal[4] = 100000;
        $labExpectedMetal[5] = 200000;


        if(isset($unit[$unitKey]['energymake']))
        {
            $productionEnergy = $unit[$unitKey]['energymake'];
        }
        
        if(isset($unit[$unitKey]['extractsmetal']))
        {
            $productionMetal = $unit[$unitKey]['extractsmetal'];
        }

        if(isset($unit[$unitKey]['buildoptions']))
        {
            $canBuild = 'Yes';
            $type = 'Constructor';
        }

        if(isset($unit[$unitKey]['icontype']))
        {
            $icon = $unit[$unitKey]['icontype'];

            if($unit[$unitKey]['icontype'] == 'building' && $canBuild == 'Yes')
            {
                $type = 'Lab';
                $labTechLevel = 'Unknown';

                if(isset($unit[$unitKey]['customparams']['labTechLevel']))
                {
                    $labTechLevel = $unit[$unitKey]['customparams']['labTechLevel'];
                }
            }

            if($unit[$unitKey]['icontype'] == 'building' && $canBuild == 'No')
            {
                $type = 'Building';
            }

            if($unit[$unitKey]['icontype'] == 'air' && $canBuild == 'No')
            {
                $type = 'Plane';
            }
        }

        if(isset($unit[$unitKey]['canhover']))
        {
            if($unit[$unitKey]['canhover'] == 'true' && $type == 'Unknown')
            {
                $type = 'Hovercraft';
            }
        }

        if(str_contains($name, 'Kbot') && $type =='Unknown')
        {
            $type = 'Unit (KBot)';
        }

        if(str_contains($name, 'Vehicle') && $type =='Unknown')
        {
            $type = 'Unit (Vehicle)';
        }

        if(str_contains($name, 'Ship') && $type =='Unknown')
        {
            $type = 'Unit (Ship)';
        }

        

        if(($productionEnergy > 0 || $productionMetal > 0) && $type == 'Building')
        {
            $type = 'Eco Building';
        }

        if(isset($unit[$unitKey]['tidalgenerator']))
        {
            if($unit[$unitKey]['tidalgenerator'] == 1)
            {
                $type = 'Eco Building (Tidal)';
            }
        }

        if(isset($unit[$unitKey]['windgenerator']))
        {
            if($unit[$unitKey]['windgenerator'] > 0)
            {
                $type = 'Eco Building (Wind)';
            }
        }

        if(str_contains($name, 'Geothermal'))
        {
            $type = 'Geothermal Plant';
        }

            echo '<br>';
            echo '<br>';
            echo '<h2>'.$name.'</h2>';
            echo '<ul>';
            echo '<li>Unit file: '.$file.'</li>';
            echo '<li>Faction: '.$faction.'</li>';
            echo '<li>Build Cost E: '.$buildEnergy.'</li>';
            echo '<li>Build Cost M: '.$buildMetal.'</li>';
            echo '<li>Produce E: '.$productionEnergy.'</li>';
            echo '<li>Produce M: '.$productionMetal.'</li>';
            echo '<li>Can Build: '.$canBuild.'</li>';
            echo '<li>Type: '.$type.'</li>'; 
            if($type == 'Lab')
            {
                echo '<li>Lab Tech Level: '.$labTechLevel.'</li>'; 
                echo '<li>Provide Tech: '.$unit[$unitKey]['customparams']['providetech'].'</li>'; 
                $techLevelLab = (int) substr($unit[$unitKey]['customparams']['providetech'], 1, 1);
                echo '<li>Gathered Tech Level : '.$techLevelLab .'</li>'; 

                if($techLevelLab > 0)
                {
                    $techLevel = $techLevelLab;

                    // if($buildMetal > $labExpectedMetal[$techLevelLab])
                    // {
                    //     echo 'SEEMS TOO HIGH';
                    // }

                    // if($buildMetal < $labExpectedMetal[($techLevelLab-1)])
                    // {
                    //     echo 'SEEMS TOO LOW';
                    // }
                }
            }
            else
            {
                // tech level may have been set in the database
                // by a lab previously
                $sql = "SELECT * FROM units WHERE unitFile = '".$file."'";
                $unit = $db->querySingle($sql, true);
                $techLevel = $unit['techLevel'];
            }
            echo '<li>Tech Level: '.$techLevel.'</li>'; 
            echo '</ul>';


        // is it already in?
        $sql = "SELECT COUNT(*) FROM units WHERE unitFile = '".$file."'";
        $count = $db->querySingle($sql);

        if(!$count)
        {
            $db->exec("INSERT INTO units (
                name, 
                faction, 
                buildcostEnergy, 
                buildcostMetal, 
                productionEnergy, 
                productionMetal, 
                type,
                techLevel,
                unitFile
            ) 
            VALUES(
                '".$name."', 
                '".$faction."',
                '".$buildEnergy."',
                '".$buildMetal."',
                '".$productionEnergy."',
                '".$productionMetal."',
                '".$type."',
                '".$techLevel."',
                '".$file."'
                )");
        }




        // so if im a lab and i can build stuff, we know that those items i can build
        // at my tech level , or lower
        if(isset($unit[$unitKey]['buildoptions']) )
        {

            
            echo 'Build options for '.$name .' present';
            echo '<ul>';
            foreach($unit[$unitKey]['buildoptions'] as $unit)
            {
                echo '<li>Can build: '.$unit.'</li>';     
                $sql = "SELECT COUNT(*) FROM units WHERE unitFile = '".$unit.".lua'";
                $count = $db->querySingle($sql);

                if($count > 0)
                {
                    $sql = "SELECT * FROM units WHERE unitFile = '".$unit.".lua'";
                    $result = $db->querySingle($sql, true);
                    
                    // if this unit has no tech level, set it to this
                    // if it does, and this one is lower, update to lower value

                    $currentUnitTec = $result['techLevel'];
                    echo '<ul><li>Curernt tech level of unit in DB: '.$currentUnitTec.'</li></ul>';     

                    if(($currentUnitTec == 0) || ($currentUnitTec >= $techLevel))
                    {
                        echo '<ul><li>Adding tech level for  '.$unit .' to '.$techLevel.'</li></ul>';
                            $sql = "UPDATE units
                            SET techLevel = '".$techLevel."'
                            WHERE unitFile = '".$unit.".lua'";

                            $db->exec($sql);
                    }
                   

                       
                    
                }
            }

            echo '</ul>';
        }






















        // is new indenticificaion area in?
        if($file == 'aach.lua')
        {
            if(!isset($unit[$unitKey]['identification']))
            {
                $id = " = {
        identification = {
            name = \"".$name."\",
            faction = \"".$faction."\",
            type = \"".$type."\",
            techLevel = \"".$techLevel."\",
        },";

                // open file
                $file_contents = file_get_contents('./units/'.$file);

                // update 
                $file_contents = str_replace_first(' = {', $id, $file_contents);

                // save
                file_put_contents('./units/'.$file, $file_contents);
            }
        }
    }
    catch(Exception $e) {
        echo 'Exception: ',  $e->getMessage(), PHP_EOL;
    }
}








echo '<br>';
echo $unit[$unitKey]['customparams']['faction'];
echo '<br>';
echo 'Build Cost E: '. $unit[$unitKey]['buildcostenergy'];
echo '<br>';
echo 'Build Cost M: '. $unit[$unitKey]['buildcostmetal'];
echo '<br>';
echo 'Build Cost M: '. $unit[$unitKey]['buildoptions'];



// foreach file in the units directory

// after first '{'

// insert 
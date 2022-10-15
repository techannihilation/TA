<?php
/**
 * A class to parse LUA files to an PHP array.
 *
 * @version	1.0.3
 */
class LUAParser {

	/**
	 * Contains the lines of the LUA file.
	 */
	private $_lua;

	/**
	 * Contains the current position of the LUA array.
	 */
	private $_pos;

	/**
	 * Contains the nuber of array elements.
	 */
	private $_lines;

	/**
	 * Contains a list of keys that have to be present one or more times in the LUA file.
	 */
	private $_syntax_tokens = array();

	/**
	 * Contains the parsed LUA data from file.
	 */
	public $data;

	/**
	 * parseFile - Read and parse the given file.
	 *
	 * @param	string	$path	A valid LUA file path.
	 */
	public function parseFile($path) {

		// Check for file
		if(is_file($path) === false) {
			throw new Exception('Invalid input file (' . $path . ')');
		}

		// Initialise/reset vars
		$this->_lua = array();
		$this->data = array();
		$this->_pos = 0;
		$this->_lines = 0;

		// Read the file
		if(($lua = file_get_contents($path)) !== false) {

			// Check syntax if one or more keys has been added
			if($this->checkSyntax($lua) === true) {

				// Split by new line and count lines
				$this->_lua = explode("\n", $lua);
				$this->_lines = count($this->_lua);

				// Free resources
				unset($lua);

				// Very small array, something is wrong
				if($this->_lines < 2) {
					throw new Exception('Could not parse LUA file');
				}

				// Parse the LUA data
				$this->data = $this->parseLUA();

				// Free resources
				unset($this->_lua);
			}

			// One or more keys are missing in LUA file
			else {

				// Free resources
				unset($lua);

				// Throw an syntax error exception
				throw new Exception('Syntax error in lua file (' . $path . ')');
			}
		}

		// Could not read file
		else {
			throw new Exception('Could not read input file (' . $path . ')');
		}
	}

	/**
	 * addSyntaxKey - Adds a LUA Key to the syntax checklist, all defined keys must be present one or more times in the LUA file.
	 *
	 * @param	string	$key	An key that must be present one or more times in the LUA file.
	 */
	public function addSyntaxKey($key) {
		if(in_array($key, $this->_syntax_tokens) === false) {
			array_push($this->_syntax_tokens, $key);
		}
	}

	/**
	 * removeSyntaxKey - Removes the given key from the syntax checklist.
	 *
	 * @param	string	$key	An key that must be present one or more times in the LUA file.
	 */
	public function removeSyntaxKey($key) {
		if(in_array($key, $this->_syntax_tokens) === true) {
			unset($this->_syntax_tokens[$key]);
		}
	}

	/**
	 * resetSyntaxKeys - Removes all keys from the syntax checklist.
	 */
	public function resetSyntaxKeys() {
		if(isset($this->_syntax_tokens[0]) === true) {
			$this->_syntax_tokens = array();
		}
	}

	/**
	 * checkSyntax - Checks if the list of defined tokens available in the LUA file.
	 *
	 * @param	ref string	$lua The content of the LUA file.
	 * @return	bool		Return True ist the syntax is ok or no tokens were specified, otherwise the function will return False.
	 */
	private function checkSyntax(&$lua) {

		// Check if some data available
		if(isset($this->_syntax_tokens[0]) === true) {
			foreach($this->_syntax_tokens as $token) {
				if(mb_strpos($lua, $token) === false) {
					return false;
				}
			}

			// Return true if we have no early return in case of missing token
			return true;
		}

		// No syntax checking, validate data
		else {
			return true;
		}
	}

	/**
	 * parseLUA - Parses the contents of the LUA file.
	 */
	private function &parseLUA() {

		// Initialise vars
		$data = array();
		$end = false;

		// The end of array has not been reached
		if($this->_pos < $this->_lines) {

			// Loop through LUA array
			while($end === false) {

				// End reached
				if($this->_pos >= $this->_lines) {
					break;
				}

				// Explode by assignment character
				$parts = explode('=', $this->_lua[$this->_pos]);

				// Trim values
				$parts[0] = trim($parts[0]);

				// Trim if part exists
				if(isset($parts[1]) === true) {
					$parts[1] = trim($parts[1]);
				}

				// Start of table
				if(isset($parts[1]) === true && ($parts[1] === '{' || (empty($parts[1]) === true && $parts[1] != 0))) {

					// When Bracket is in next line, skip the next line
					$this->_pos += (empty($parts[1]) === true) ? 2 : 1;

					// Parse content
					$data[$this->getValue($parts[0], true)] = $this->parseLUA();
				}

				// End of table
				else if($parts[0] === '}' || $parts[0] === '},') {
					$end = true;
					$this->_pos++;
				}

				// { }, case
				else if(isset($parts[1]) == true && $parts[1][0] == '{' &&  mb_strlen($parts[1]) > 1 && ($subpart = trim(substr($parts[1], 1))) && ($subpart == '},' || $subpart == '}')) {
					$data[$this->getValue($parts[0], true)] = array();
					$this->_pos++;
				}

				// Get value
				else {
					// Data has been found
					if (isset($parts[1])) {
						// There's a key, so save key to avoid multiply function execution
						$key = $this->getValue($parts[0], true);

						if(mb_strlen($key) > 0 && mb_strlen($parts[1]) > 0) {
							$data[$key] = $this->getValue($parts[1], false);
						}
					} else {
						// There isn't a key, so just add to the end of the array
						if (mb_strlen($parts[0]) > 0) {
							$data[] = $this->getValue($parts[0], false);
						}
					}

					// Increase position
					$this->_pos++;
				}
			}
		}

		// Return fetched data by reference
		return $data;
	}

	/**
	 * getValue - Removes control characters from the given string.
	 *
	 * @param	string	$str	A string.
	 * @return	mixed	Return the string without control characters.
	 */
	private function &getValue(&$str, $is_id) {

		// Remove spaces at start and end
		$str = trim($str);

		// Remove controls characters from ID
		if($is_id === true) {
			$str = str_replace(array('"', '[', ']'), '', $str);
		}

		// Remove control characters from value
		else {

			// Remove ending control characters
			if(mb_substr($str, -2) === '",') {
				$str = mb_substr($str, 0, -2);
			}
			else if(mb_substr($str, -1) === '"' || mb_substr($str, -1) === ',') {
				$str = mb_substr($str, 0, -1);
			}

			// Remove starting control character
			if(mb_substr($str, 0, 1) === '"') {
				$str = mb_substr($str, 1);
			}
		}

		// Remove spaces at start and end
		$str = trim($str);

		// Return fetched data by reference
		return $str;
	}
}
?>
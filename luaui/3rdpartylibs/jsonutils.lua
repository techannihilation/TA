function string:split(sep)
        local sep, fields = sep or ":", {}
        local pattern = string.format("([^%s]+)", sep)
        self:gsub(pattern, function(c) fields[#fields+1] = c end)
        return fields
end

function getLiteral(value)
	local k = nil
	if not k and type(value) == "string" then
		k = '"' .. value:gsub('"','\"') .. '"';
	end
	if not k and type(value) == "nil" then
		k = "null";
	end
	if not k then
		k = tostring(value)
	end
	return k;
end

function simpleLuaObjectToJSON(tab)
	local json = "{"
	local run = false
	 for key, value in pairs(tab) do
		json = json .. '"' .. key .. '":' .. getLiteral(value) .. ","
		run = true
	 end
	 return   run and (string.sub(json, 1, -2) or json).. "}"
end

function dumbLua2JSON(tab)
	local json = "{"
	 for key, value in pairs(tab) do
		local k = nil
		if not k and type(value) == "string" then
			fchar = string.sub(value, 1, 1)
			if not (fchar == "{" or fchar == "[") then
				k = '"' .. value .. '"';
			end
		end
		if not k and type(value) == "table" then
			k = nil;
			for tempK, _ in pairs(value) do
				local jsonIn
				if type(tempK) == "number" then
					jsonIn = "["
					local run = false
					for _, val2 in pairs(value) do
						run = true
						x = nil
						if type(val2) == "table" then
							x = simpleLuaObjectToJSON(val2) 
						else
							x = getLiteral(val2)
						end
						jsonIn = jsonIn .. x .. ","
					end
					jsonIn = (not run and jsonIn or string.sub(jsonIn, 1, -2))
					jsonIn = jsonIn .. "]"
				end
				k = jsonIn
				break;
			end
			if not k then
				k = simpleLuaObjectToJSON(value)
			end
			--
		end

		if not k and type(value) == "nil" then
			k = "null";
		end
		if not k then
			k = tostring(value)
		end
		json = json .. '"' .. key .. '":' .. k .. ","
	 end
	 return string.sub(json, 1, -2) .. "}"
end

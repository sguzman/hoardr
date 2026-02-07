-- strip_junk.lua
-- Removes script/style/noscript raw HTML and drops giant minified-looking blocks.

local function lower(s)
	return string.lower(s or "")
end

local function looks_like_minified_blob(s)
	if not s then
		return false
	end
	if #s < 20000 then
		return false
	end
	if s:match("\n") then
		return false
	end -- minified is often one mega-line
	local punct = 0
	for i = 1, #s do
		local ch = s:sub(i, i)
		if
			ch == "{"
			or ch == "}"
			or ch == "["
			or ch == "]"
			or ch == "("
			or ch == ")"
			or ch == ";"
			or ch == ","
			or ch == ":"
		then
			punct = punct + 1
		end
	end
	return punct > 2000
end

function RawBlock(el)
	if el.format == "html" then
		local t = lower(el.text)
		if t:match("<script") or t:match("<style") or t:match("<noscript") then
			return {}
		end
	end
	return nil
end

function RawInline(el)
	if el.format == "html" then
		local t = lower(el.text)
		if t:match("<script") or t:match("<style") or t:match("<noscript") then
			return {}
		end
	end
	return nil
end

function CodeBlock(el)
	if looks_like_minified_blob(el.text) then
		return {}
	end
	return nil
end

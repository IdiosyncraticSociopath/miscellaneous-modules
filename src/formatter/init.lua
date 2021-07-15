local suffixes = require(script.suffixes)
local formatter = {}

-- will loosely base this on how excel formats

local function get_power(n)
    return math.floor(math.log(math.abs(n) + 1)/math.log(10))
end

function formatter:format_currency()
end

function formatter:format_currency_with_suffix(n, include_symbol)
    local power = math.floor(get_power(n)/3)
    local s = tostring(n/10^(power*3))
    local truncated_s = s:match("%.") and s:sub(1, 4) or s:sub(1, 3)
    return (include_symbol and "$" or "")..truncated_s:gsub("%.?0+$", "")..(suffixes[power] or "")
end

return formatter

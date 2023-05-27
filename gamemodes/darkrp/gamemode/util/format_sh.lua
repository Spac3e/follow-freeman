local string_comma = string.Comma

function rp.FormatMoney(n)
	return  string_comma(n)..'c'
end

function rp.formatNumber(n)
	return string_comma(n)
end
nw.Register('EventsRunning', {
	Read = function()
		local ret = {}

		for i = 1, net.ReadUInt(8) do
			ret[net.ReadString()] = true
		end

		return ret
	end,
	Write = function(v)
		net.WriteUInt(table.Count(v), 8)

		for k, v in pairs(v) do -- TODO: FIX
			net.WriteString(k)
		end
	end,
	GlobalVar = true
})

function rp.EventIsRunning(name)
	return ((nw.GetGlobal('EventsRunning') or {})[name:lower()] == true)
end
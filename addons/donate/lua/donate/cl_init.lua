net.Receive("donations.sync", function()
	local t = net.ReadTable()
	hook.Add("Think", "donations.sync", function()
		if IsValid(LocalPlayer()) then
			LocalPlayer().donations = t
			hook.Remove("Think", "donations.sync")
		end
	end)
end)

net.Receive("donations.url", function()

	local url = net.ReadString()

	gui.OpenURL(url)
	
/*
	local frame = vgui.Create( "DFrame" ) -- Create a container for everything
	frame:SetSize( 800, 600 )
	frame:SetTitle( "" )
	frame:Center()
	frame:MakePopup()

	local window = vgui.Create( "DHTML", frame ) -- Our DHTML window
	window:SetSize( 750, 500 )
	window:Center()

	window:OpenURL( url )
*/
end)

net.Receive("donations.purchased", function()
	sound.PlayURL("http://urf.im/gta_sa.mp3", "", function(station)
		if IsValid(station:Play()) then
			station:Play()
		end
	end)
end)
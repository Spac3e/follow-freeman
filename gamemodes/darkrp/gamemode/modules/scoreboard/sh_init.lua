
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("player_infocard.lua")
	AddCSLuaFile("player_row.lua")
	AddCSLuaFile("scoreboard.lua")
else
	include("scoreboard.lua")

	CreateScoreboard = function()
		if IsValid(SuiScoreBoard) then
			SuiScoreBoard:SetVisible(false)
		end

		SuiScoreBoard = ui.Create("suiscoreboard")

		return true
	end

	function GM:ScoreboardShow()
		if (not IsValid(SuiScoreBoard)) then
			CreateScoreboard()
		end
		gui.EnableScreenClicker(true)
		SuiScoreBoard:SetVisible(true)
		SuiScoreBoard:UpdateScoreboard(true)
		SuiScoreBoard:OpenAnimation()
		SuiScoreBoard:MoveToFront()
	end

	function GM:ScoreboardHide()
		gui.EnableScreenClicker(false)

		if (SuiScoreBoard and SuiScoreBoard:IsValid()) then
			SuiScoreBoard:CloseAnimation()
		end
	end
end
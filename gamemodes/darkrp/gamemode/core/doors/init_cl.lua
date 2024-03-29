local IsValid = IsValid
local ipairs = ipairs
local LocalPlayer = LocalPlayer
local Angle = Angle
local Vector = Vector
local ents_FindInSphere = ents.FindInSphere
local util_TraceLine = util.TraceLine
local draw_SimpleTextOutlined = draw.SimpleTextOutlined
local team_GetColor = team.GetColor
local team_GetName = team.GetName
local cam_Start3D2D = cam.Start3D2D
local cam_End3D2D = cam.End3D2D
local color_white = Color(255, 255, 245)
local color_black = Color(0, 0, 0)
local color_green = table.Copy(rp.col.Green)
local off_vec = Vector(0, 0, 17.5)
local off_ang = Angle(0, 90, 90)
local count
local DoorText = {}
local DoorCache = {}

local function AddText(tbl)
	DoorText[count + 1] = tbl
	count = count + 1
end

surface.CreateFont('DoorFont', {
	font = 'Open Sans Light',
	size = 130,
	weight = 300,
	antialias = true,
	extended = true,
})

timer.Create('RefreshDoorCache', 0.4, 0, function()
	if IsValid(LocalPlayer()) then
		local count = 0
		DoorCache = {}

		for k, ent in ipairs(ents_FindInSphere(LocalPlayer():GetPos(), 350)) do
			if IsValid(ent) and !ent:IsVehicle() && ent:IsDoor() then
				count = count + 1
				DoorCache[count] = ent
			end
		end
	end
end)

hook('PostDrawOpaqueRenderables', function()
	for _, ent in ipairs(DoorCache) do
		if IsValid(ent) then
			count = 0
			DoorText = {}
			local dist = ent:GetPos():DistToSqr(LocalPlayer():GetPos())

			if ent:DoorIsOwnable() then
				AddText({color_white, 'F2 -арендовать'})
				AddText({color_green, rp.FormatMoney(LocalPlayer():Wealth(rp.cfg.DoorCostMin, rp.cfg.DoorCostMax))})
			elseif not ent:DoorIsOwnable() then
				-- Title
				if (ent:DoorGetTitle() ~= nil) then
					AddText({color_white, ent:DoorGetTitle()})
				end

				-- Group Own
				if (ent:DoorGetGroup() ~= nil) then
					AddText({color_white, ent:DoorGetGroup()})
				end

				-- Team Own
				if (ent:DoorGetTeam() ~= nil) then
					AddText({team_GetColor(ent:DoorGetTeam()), team_GetName(ent:DoorGetTeam())})
				end

				-- Org own
				local owner = ent:DoorGetOwner()

				if ent:DoorOrgOwned() and IsValid(owner) then
					AddText({owner:GetOrgColor(), owner:GetOrg()})
				end

				-- Owner
				if IsValid(owner) then
					AddText({owner:GetJobColor(), owner:Name()})
				end

				-- Co-Owners
				if (ent:DoorGetCoOwners() ~= nil) then
					for k, co in ipairs(ent:DoorGetCoOwners()) do
						if IsValid(co) then
							AddText({co:GetJobColor(), co:Name()}) -- TODO: FIX
						end

						if (k >= 4) then
							AddText({color_white, 'and ' .. (#ent:DoorGetCoOwners() - 4) .. ' co-owners.'}) -- TODO: FIX
							break
						end
					end
				end
			end

			-- Draw it
			local lw = ent:LocalToWorld(ent:OBBCenter()) + off_vec

			local tr = util_TraceLine({
				start = LocalPlayer():GetPos() + LocalPlayer():OBBCenter(),
				endpos = lw,
				filter = LocalPlayer()
			})

			if (tr.Entity == ent) and (lw:DistToSqr(tr.HitPos) < 65) then
				cam_Start3D2D(tr.HitPos + tr.HitNormal, tr.HitNormal:Angle() + off_ang, .050)
				local h = 0

				for k, v in ipairs(DoorText) do
					local a = (122500 - dist) / 350
					v[1].a = a
					color_black.a = a
					local _, th = draw_SimpleTextOutlined(v[2], 'DoorFont', 0, h, v[1], 1, 1, 3, color_black)
					h = h + th
				end

				cam_End3D2D()
			end
		end
	end
end)
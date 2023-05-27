rp.orgs = rp.orgs or {}
local sdr = surface.DrawRect
local ssdc = surface.SetDrawColor
local sdor = surface.DrawOutlinedRect
local sdtr = surface.DrawTexturedRect
local sdl = surface.DrawLine
local mf = math.floor
local iimd = input.IsMouseDown
local colg = Color(150, 150, 150, 200)
local coldg = Color(100, 100, 100, 200)
local colTrans = Color(0, 0, 0, 0)
local padding = 0
local dim = 64
local outline = 512 / dim
local cursorSize = 1
local cursorShape = "Square"
local fr

function rp.orgs.SaveOrgBanner(name, data)
	if (not file.IsDir("sup", "DATA")) then
		file.CreateDir("sup")
	end

	if (not file.IsDir("sup/banners", "DATA")) then
		file.CreateDir("sup/banners")
	end

	local data = table.Copy(data)

	for i = 0, dim - 1 do
		for k = 0, dim - 1 do
			local v = data[i][k]

			if (v.trans) then
				data[i][k] = 0
			else
				data[i][k] = pcolor.EncodeRGB(v.col)
			end
		end
	end

	file.Write("sup/banners/" .. name .. ".txt", util.TableToJSON(data))
end

function rp.orgs.LoadOrgBanner(name)
	if (fr and fr:IsValid()) then
		local data = util.JSONToTable(file.Read('sup/banners/' .. name .. '.txt'))

		for i = 0, dim - 1 do
			for k = 0, dim - 1 do
				local px = data[i][k]

				if (px == 0) then
					data[i][k] = {
						trans = true
					}
				else
					data[i][k] = {
						col = pcolor.DecodeRGB(px)
					}
				end
			end
		end

		fr.pnlPaintArea.pixels = data
		fr.pnlPaintArea.invalidated = true
	end
end

function rp.orgs.OpenOrgBannerEditor(perms)
	if (fr and fr:IsValid()) then
		fr:Remove()
	end

	local parent = ui.Create('ui_frame')
	parent:Focus()
	parent.pnlPaintArea = ui.Create("Panel", parent)
	parent.clrCombo = ui.Create("DColorMixer", parent)
	parent.numCursorSize = ui.Create("DComboBox", parent)

	function parent.numCursorSize:OpenMenu(pControlOpener)
		if (pControlOpener) then
			if (pControlOpener == self.TextEntry) then return end
		end

		if (#self.Choices == 0) then return end

		if (IsValid(self.Menu)) then
			self.Menu:Remove()
			self.Menu = nil
		end

		self.Menu = ui.DermaMenu()

		for k, v in pairs(self.Choices) do
			self.Menu:AddOption(v, function()
				self:ChooseOption(v, k)
			end)
		end

		local x, y = self:LocalToScreen(0, self:GetTall())
		self.Menu:SetMinimumWidth(self:GetWide())
		self.Menu:Open(x, y, false, self)
	end

	-- We must have an ordered list
	parent.comboCursorShape = ui.Create("DComboBox", parent)
	parent.lblCursorSize = ui.Create("DLabel", parent)
	parent.lblCursorShape = ui.Create("DLabel", parent)
	parent.lblSubdivision = ui.Create("DLabel", parent)
	parent.btnSubdivisionUp = ui.Create("DButton", parent)
	parent.btnSubdivisionDown = ui.Create("DButton", parent)
	parent.pnlPreview = ui.Create("Panel", parent)
	parent.btnSubmit = ui.Create("DButton", parent)
	parent.btnLoad = ui.Create("DButton", parent)
	parent.btnSave = ui.Create("DButton", parent)
	parent.btnReset = ui.Create("DButton", parent)
	parent.iSubdivide = 1
	local x, y = parent:GetDockPos()
	parent.pnlPaintArea:SetPos(x, y)
	parent.pnlPaintArea:SetSize(512 + padding * 2, 512 + padding * 2)
	parent:SetSize(768, y + parent.pnlPaintArea:GetTall() + 5)
	parent:SetTitle("Organization Flag")
	parent.clrCombo:SetPalette(false)
	parent.clrCombo:SetAlphaBar(false)
	parent.clrCombo:SetWangs(true)
	parent.clrCombo:SetPos(5 + parent.pnlPaintArea:GetWide() + 5, y)
	parent.clrCombo:SetSize(parent:GetWide() - parent.pnlPaintArea:GetWide() - 15, 160)
	parent.clrCombo:SetColor(Color(255, 255, 255))
	local halfrem = (parent:GetWide() - parent.pnlPaintArea:GetWide() - 20) / 2
	parent.lblCursorSize:SetText("Cursor Size")
	parent.lblCursorSize:SetPos(parent.clrCombo.x, parent.clrCombo:GetTall() + 32)
	parent.lblCursorSize:SizeToContents()
	parent.numCursorSize:SetPos(parent.clrCombo.x - 1, parent.lblCursorSize.y + parent.lblCursorSize:GetTall() + 3)
	parent.numCursorSize:SetWide(halfrem)
	parent.numCursorSize:SetValue("1 px")

	for i = 1, 15 do
		parent.numCursorSize:AddChoice(i .. " px")
	end

	parent.numCursorSize.OnSelect = function(self, idx, val)
		cursorSize = idx
	end

	parent.lblCursorShape:SetText("Cursor Shape")
	parent.lblCursorShape:SetPos(parent.numCursorSize.x + parent.numCursorSize:GetWide() + 6, parent.clrCombo:GetTall() + 32)
	parent.lblCursorShape:SizeToContents()
	parent.comboCursorShape:SetPos(parent.numCursorSize.x + parent.numCursorSize:GetWide() + 6, parent.lblCursorSize.y + parent.lblCursorSize:GetTall() + 3)
	parent.comboCursorShape:SetWide(halfrem)
	parent.comboCursorShape:SetValue("Square")
	parent.comboCursorShape:AddChoice("Square")
	parent.comboCursorShape:AddChoice("Circle")
	parent.comboCursorShape:AddChoice("Horizontal")
	parent.comboCursorShape:AddChoice("Vertical")
	parent.comboCursorShape:AddChoice("Diagonal Up")
	parent.comboCursorShape:AddChoice("Diagonal Down")
	parent.comboCursorShape:AddChoice("Outlined Square")

	parent.comboCursorShape.OnSelect = function(self, idx, val)
		cursorShape = val
	end

	parent.lblSubdivision:SetText("Guidelines")
	parent.lblSubdivision:SetPos(parent.clrCombo.x, parent.comboCursorShape.y + parent.comboCursorShape:GetTall() + 2)
	parent.lblSubdivision:SizeToContents()
	parent.btnSubdivisionDown:SetPos(parent.lblSubdivision.x, parent.lblSubdivision.y + parent.lblSubdivision:GetTall() + 3)
	parent.btnSubdivisionDown:SetText("-")
	parent.btnSubdivisionDown:SetSize(halfrem, 15)

	parent.btnSubdivisionDown.DoClick = function(self)
		self:GetParent().iSubdivide = math.Clamp(self:GetParent().iSubdivide - 1, 1, 10)
	end

	parent.btnSubdivisionUp:SetPos(parent.lblSubdivision.x + halfrem + 5, parent.lblSubdivision.y + parent.lblSubdivision:GetTall() + 3)
	parent.btnSubdivisionUp:SetText("+")
	parent.btnSubdivisionUp:SetSize(halfrem, 15)

	parent.btnSubdivisionUp.DoClick = function(self)
		self:GetParent().iSubdivide = math.Clamp(self:GetParent().iSubdivide + 1, 1, 10)
	end

	parent.pnlPreview:SetPos(parent.clrCombo.x, parent.btnSubdivisionDown.y + parent.btnSubdivisionDown:GetTall() + 5)
	parent.pnlPreview:SetSize(94, 94)
	parent.btnSubmit:SetFont("ui.22")
	parent.btnSubmit:SetText("Submit")
	parent.btnSubmit:SetPos(parent.clrCombo.x, parent:GetTall() - 50)
	parent.btnSubmit:SetSize(halfrem * 2 + 5, 45)

	if (not perms.Owner or not LocalPlayer():HasUpgrade('org_prem')) then
		parent.btnSubmit:SetDisabled(true)
	end

	local str

	if (not perms.Owner) then
		str = "You do not own this Organization, so you cannot submit a new flag for it."
	elseif (not LocalPlayer():HasUpgrade('org_prem')) then
		str = "You do not have the Premium Orgs upgrade, so you cannot submit a flag. Visit the Credit Shop!"
	else
		str = "Your Organization's flag can be used in picture frames as well as our website!"
	end

	local lines = string.Wrap('ui.22', str, parent.btnSubmit:GetWide())
	local msgy = parent.pnlPreview.y + parent.pnlPreview:GetTall() + ((parent.btnSubmit.x - (parent.pnlPreview.y + parent.pnlPreview:GetTall())) - (#lines * 22)) / 2

	for k, v in ipairs(lines) do
		local lbl = ui.Create('DLabel')
		lbl:SetParent(parent)
		lbl:SetFont('ui.22')
		lbl:SetText(v)
		lbl:SizeToContents()
		lbl:SetPos(parent.btnSubmit.x + (parent.btnSubmit:GetWide() - lbl:GetWide()) / 2, msgy)
		msgy = msgy + 22
	end

	parent.btnLoad:SetText("Load")
	parent.btnLoad:SetFont("ui.22")
	parent.btnLoad:SetPos(parent.pnlPreview.x + parent.pnlPreview:GetWide() + 5, parent.pnlPreview.y)
	parent.btnLoad:SetSize((halfrem * 2) - parent.pnlPreview:GetWide(), math.floor((parent.pnlPreview:GetTall() - 10) / 3))

	parent.btnLoad.DoClick = function(self)
		local designs, dirs = file.Find("sup/banners/*.txt", "DATA")
		local menu = ui.DermaMenu()

		for k, v in pairs(designs) do
			menu.hasOptions = true

			menu:AddOption(string.sub(v, 1, -5), function()
				rp.orgs.LoadOrgBanner(string.sub(v, 1, -5))
			end)
		end

		if (not menu.hasOptions) then
			menu:AddOption("No designs found", function() end)
		end

		menu:Open()
	end

	parent.btnSave:SetText("Save")
	parent.btnSave:SetFont("ui.22")
	parent.btnSave:SetPos(parent.pnlPreview.x + parent.pnlPreview:GetWide() + 5, parent.btnLoad.y + parent.btnLoad:GetTall() + 5)
	parent.btnSave:SetSize(parent.btnLoad:GetWide(), parent.btnLoad:GetTall())

	parent.btnSave.DoClick = function(self)
		local designs, dirs = file.Find("sup/banners/*.txt", "DATA") -- TODO: FIX
		local menu = ui.DermaMenu()

		menu:AddOption("New..", function()
			local function askForName(taken)
				ui.StringRequest("New Design", ((taken and "That save already exists.\n\n") or "") .. "Please enter a name for your design.", "Untitled 1", function(resp)
					if (file.Exists("sup/banners/" .. resp .. ".txt", "DATA")) then
						askForName(true)

						return
					end

					rp.orgs.SaveOrgBanner(resp, fr.pnlPaintArea.pixels)
				end)
			end

			askForName()
		end)

		for k, v in pairs(designs) do
			menu:AddOption(string.sub(v, 1, -5), function()
				rp.orgs.SaveOrgBanner(string.sub(v, 1, -5), fr.pnlPaintArea.pixels)
			end)
		end

		menu:Open()
	end

	parent.btnReset:SetText("Reset")
	parent.btnReset:SetFont("ui.22")
	parent.btnReset:SetPos(parent.pnlPreview.x + parent.pnlPreview:GetWide() + 5, parent.btnSave.y + parent.btnSave:GetTall() + 5)
	parent.btnReset:SetSize(parent.btnLoad:GetWide(), parent.btnLoad:GetTall())

	parent.btnReset.DoClick = function(self)
		self:GetParent().pnlPaintArea:Reset(true)
	end

	parent.pnlPaintArea.cursors = {}

	parent.pnlPaintArea.Reset = function(self, force)
		if (force) then
			self.pixels = {}
		else
			self.pixels = table.Copy(cvar.GetValue('OrgBanner') or {})
		end

		if (not self.pixels[1]) then
			for x = 1, dim do -- TODO: FIX
				self.pixels[x - 1] = {}

				for y = 1, dim do
					self.pixels[x - 1][y - 1] = {
						col = colg,
						trans = true
					}
				end
			end
		end

		self:RenderBanner(w, h)
	end

	parent.SendImage = function(self)
		self.btnSubmit:SetMouseInputEnabled(false)
		self.btnSubmit:SetText("Sending..")

		net("rp.OrgBannerReceived", function(len)
			if (self:IsValid() and self.btnSubmit:IsValid()) then
				self.btnSubmit:SetMouseInputEnabled(true)
				self.btnSubmit:SetText("Submit")
			end
		end)

		net.Start('rp.SetOrgBanner')
		net.WriteUInt(dim - 1, 7)

		for i = 0, dim - 1 do
			for k = 0, dim - 1 do
				local px = self.pnlPaintArea.pixels[i][k]
				local size = px.trans and 1 or 24
				net.WriteUInt(size, 5)

				if (px.trans) then
					net.WriteUInt(0, size)
				else
					net.WriteUInt(pcolor.EncodeRGB(px.col), size)
				end
			end
		end

		net.SendToServer()
	end

	parent.btnSubmit.DoClick = function(self)
		self:GetParent():SendImage()
		cvar.SetValue('OrgBanner', self:GetParent().pnlPaintArea.pixels)
	end

	local drawRT = GetRenderTarget("SUPBannerPreview2", 512, 512, true)

	local drawMaterial = CreateMaterial("SUPBannerPreview2", "UnlitGeneric", {
		["$ignorez"] = 1,
		["$vertexcolor"] = 1,
		["$vertexalpha"] = 1,
		["$nolod"] = 1,
		["$basetexture"] = drawRT:GetName()
	})

	parent.pnlPaintArea.Paint = function(self, w, h)
		if (self.invalidated) then
			self:RenderBanner(w, h)
			self.invalidated = false
		end

		surface.SetMaterial(drawMaterial)
		ssdc(255, 255, 255, 255)
		surface.DrawTexturedRect(1, 1, w - 2, h - 2)
	end

	parent.pnlPaintArea.RenderBanner = function(self, w, h)
		local oldRT = render.GetRenderTarget()
		local scrw = ScrW()
		local scrh = ScrH()
		render.SetRenderTarget(drawRT)
		render.Clear(0, 0, 0, 0)
		render.ClearDepth()
		render.SetViewPort(0, 0, 512, 512)
		cam.Start2D()

		for x, v in pairs(self.pixels) do
			for y, data in pairs(v) do
				local boxX = (x * outline)
				local boxY = (y * outline)

				if (not data.trans) then
					ssdc(data.col)
					sdr(boxX, boxY, outline, outline)
				else
					local col1 = colg
					local col2 = coldg
					local half = outline / 2
					ssdc(col1)
					sdr(boxX, boxY, half, half)
					sdr(boxX + half, boxY + half, half, half)
					ssdc(col2)
					sdr(boxX + half, boxY, half, half)
					sdr(boxX, boxY + half, half, half)
				end
			end
		end

		cam.End2D()
		render.SetViewPort(0, 0, scrw, scrh)
		render.SetRenderTarget(oldRT)
	end

	parent.pnlPaintArea.cursors["Square"] = function(self, x, y)
		local activePx = {}
		local toMinus = mf(cursorSize / 2)
		local altMinus = 0

		if (toMinus < 1) then
			toMinus = 0
		end

		if (cursorSize == 2) then
			toMinus = 0
			altMinus = outline / 2
		end

		local boxX = mf((x - padding - altMinus) / outline) - toMinus
		local boxY = mf((y - padding - altMinus) / outline) - toMinus

		for x = 0, cursorSize - 1 do
			if (self.pixels[boxX + x] and self.pixels[boxX + x][boxY]) then
				table.insert(activePx, {boxX + x, boxY})
			end

			for y = 0, cursorSize - 1 do
				if (self.pixels[boxX + x] and self.pixels[boxX + x][boxY + y]) then
					table.insert(activePx, {boxX + x, boxY + y})
				end
			end
		end

		return activePx
	end

	parent.pnlPaintArea.cursors["Circle"] = function(self, x, y)
		local activePx = {}
		local boxX = mf((x - padding) / outline)
		local boxY = mf((y - padding) / outline)
		local startX = boxX - mf(cursorSize / 2)
		local startY = boxY - mf(cursorSize / 2)

		for x = startX, (startX + cursorSize) do
			for y = startY, (startY + cursorSize) do
				if (self.pixels[x] and self.pixels[x][y]) then
					if ((x - boxX) ^ 2 + (y - boxY) ^ 2 <= (cursorSize / 2) ^ 2) then
						table.insert(activePx, {x, y})
					end
				end
			end
		end

		return activePx
	end

	parent.pnlPaintArea.cursors["Horizontal"] = function(self, x, y)
		local activePx = {}
		local toMinus = mf(cursorSize / 2)
		local altMinus = 0

		if (toMinus < 1) then
			toMinus = 0
		end

		if (cursorSize == 2) then
			toMinus = 0
			altMinus = outline / 2
		end

		local boxX = mf((x - padding - altMinus) / outline) - toMinus
		local boxY = mf((y - padding - altMinus) / outline)

		for x = 0, cursorSize - 1 do
			if (self.pixels[boxX + x] and self.pixels[boxX + x][boxY]) then
				table.insert(activePx, {boxX + x, boxY})
			end
		end

		return activePx
	end

	parent.pnlPaintArea.cursors["Vertical"] = function(self, x, y)
		local activePx = {}
		local toMinus = mf(cursorSize / 2)
		local altMinus = 0

		if (toMinus < 1) then
			toMinus = 0
		end

		if (cursorSize == 2) then
			toMinus = 0
			altMinus = outline / 2
		end

		local boxX = mf((x - padding - altMinus) / outline)
		local boxY = mf((y - padding - altMinus) / outline) - toMinus

		for y = 0, cursorSize - 1 do
			if (self.pixels[boxX] and self.pixels[boxX][boxY + y]) then
				table.insert(activePx, {boxX, boxY + y})
			end
		end

		return activePx
	end

	parent.pnlPaintArea.cursors["Diagonal Down"] = function(self, x, y)
		local activePx = {}
		local toMinus = mf(cursorSize / 2)
		local altMinus = 0

		if (toMinus < 1) then
			toMinus = 0
		end

		if (cursorSize == 2) then
			toMinus = 0
			altMinus = outline / 2
		end

		local boxX = mf((x - padding - altMinus) / outline) - toMinus
		local boxY = mf((y - padding - altMinus) / outline) - toMinus

		for i = 0, cursorSize - 1 do
			if (self.pixels[boxX + i] and self.pixels[boxX + i][boxY + i]) then
				table.insert(activePx, {boxX + i, boxY + i})
			end
		end

		return activePx
	end

	parent.pnlPaintArea.cursors["Diagonal Up"] = function(self, x, y)
		local activePx = {}
		local toMinus = mf(cursorSize / 2)
		local altMinus = 0

		if (toMinus < 1) then
			toMinus = 0
		end

		if (cursorSize == 2) then
			toMinus = 0
			altMinus = outline / 2
		end

		local boxX = mf((x - padding - altMinus) / outline) - toMinus
		local boxY = mf((y - padding - altMinus) / outline) + toMinus

		for i = 0, cursorSize - 1 do
			if (self.pixels[boxX + i] and self.pixels[boxX + i][boxY - i]) then
				table.insert(activePx, {boxX + i, boxY - i})
			end
		end

		return activePx
	end

	parent.pnlPaintArea.cursors["Outlined Square"] = function(self, x, y)
		local activePx = {}
		local toMinus = mf(cursorSize / 2)
		local altMinus = 0

		if (toMinus < 1) then
			toMinus = 0
		end

		if (cursorSize == 2) then
			toMinus = 0
			altMinus = outline / 2
		end

		local boxX = mf((x - padding - altMinus) / outline) - toMinus
		local boxY = mf((y - padding - altMinus) / outline) - toMinus

		for x = 0, cursorSize - 1 do
			if (self.pixels[boxX + x] and self.pixels[boxX + x][boxY]) then
				table.insert(activePx, {boxX + x, boxY})
			end

			if (self.pixels[boxX + x] and self.pixels[boxX + x][boxY + (cursorSize - 1)]) then
				table.insert(activePx, {boxX + x, boxY + (cursorSize - 1)})
			end
		end

		for y = 0, cursorSize - 1 do
			if (self.pixels[boxX] and self.pixels[boxX][boxY + y]) then
				table.insert(activePx, {boxX, boxY + y})
			end

			if (self.pixels[boxX + (cursorSize - 1)] and self.pixels[boxX + (cursorSize - 1)][boxY + y]) then
				table.insert(activePx, {boxX + (cursorSize - 1), boxY + y})
			end
		end

		return activePx
	end

	parent.pnlPaintArea.GetActivePixels = function(self)
		local x, y = self:CursorPos()
		if ((x < padding or x >= 512 + padding) or (y < padding or y >= 512 + padding)) then return {} end

		return self.cursors[cursorShape](self, x, y)
	end

	parent.pnlPaintArea.PaintOver = function(self, w, h)
		-- Draw active pixels
		for k, v in pairs(self:GetActivePixels()) do
			local x = v[1] * outline + padding
			local y = v[2] * outline + padding
			ssdc(255, 50, 50)
			sdor(x, y, outline, outline)
		end

		-- Draw picture outline
		ssdc(ui.col.Outline)
		sdor(0, 0, w, h)
		-- Alignment
		local subdivide = self:GetParent().iSubdivide

		if (subdivide > 1) then
			ssdc(50, 50, 50)

			for i = 1, subdivide - 1 do
				sdl(i * (w / subdivide), 0, i * (w / subdivide), h)
				sdl(0, i * (h / subdivide), w, i * (h / subdivide))
			end
		end
	end

	parent.pnlPaintArea.OnMousePressed = function(self, mb)
		if (mb == MOUSE_LEFT) then
			self.isClicked = true
		end

		if (mb == MOUSE_RIGHT) then
			self.isRightClicked = true
		end
	end

	parent.pnlPaintArea.OnMouseReleased = function(self, mb)
		if (mb == MOUSE_LEFT) then
			self.isClicked = false
		end

		if (mb == MOUSE_RIGHT) then
			self.isRightClicked = false
		end
	end

	parent.pnlPaintArea.OnCursorEntered = function(self)
		if (not system.IsOSX()) then
			self:SetCursor("blank")
		end
	end

	parent.pnlPaintArea.OnCursorExited = function(self)
		if (not system.IsOSX()) then
			self:SetCursor("arrow")
		end
	end

	parent.pnlPaintArea.Think = function(self)
		if (not self.isClicked and not self.isRightClicked) then return end
		local x, y = self:CursorPos()

		if ((x < padding or x >= 512 + padding) or (y < padding or y >= 512 + padding)) then
			if (self.isClicked and not iimd(MOUSE_LEFT)) then
				self.isClicked = false
			end

			if (self.isRightClicked and not iimd(MOUSE_RIGHT)) then
				self.isRightClicked = false
			end
		end

		local shouldInvalidate = false
		local newCol = self:GetParent().clrCombo:GetColor()

		-- Modify active pixels
		for k, v in pairs(self:GetActivePixels()) do
			local px = self.pixels[v[1]][v[2]]

			if (self.isClicked) then
				if (not px.col or px.col.r ~= newCol.r or px.col.g ~= newCol.g or px.col.b ~= newCol.b or px.trans) then
					px.col = table.Copy(newCol)
					px.trans = false
					shouldInvalidate = true
				end
			elseif (self.isRightClicked) then
				if (not px.trans) then
					px.trans = true
					shouldInvalidate = true
				end
			end
		end

		if (shouldInvalidate) then
			self.invalidated = true
		end
	end

	parent.pnlPreview.Paint = function(self, w, h)
		surface.SetMaterial(drawMaterial)
		ssdc(255, 255, 255)
		surface.DrawTexturedRect(0, 0, w, h)
	end

	parent:Center()
	parent:SetVisible(true)
	parent:MakePopup()
	parent.pnlPaintArea:Reset()
	fr = parent
end

concommand.Add('convd3banners', function()
	local files = file.Find('d3/banners/*.txt', "DATA")

	for k, v in pairs(files) do
		local data = util.JSONToTable(file.Read('d3/banners/' .. v))

		for i = 0, 63 do
			for k = 0, 63 do
				local px = data[i][k]

				if (px.trans) then
					data[i][k] = 0
				else
					data[i][k] = pcolor.EncodeRGB(px.col)
				end
			end
		end

		file.Write('sup/banners/' .. v, util.TableToJSON(data))
		print("Converted " .. v)
	end
end)
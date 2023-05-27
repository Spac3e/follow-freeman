include('shared.lua')

cigaParticleEmitter = cigaParticleEmitter or ParticleEmitter(Vector(0,0,0))
cigaParticleEmitter:SetParticleCullRadius(1.5)
cigaParticleEmitter:SetNoDraw(true)

hook.Add("PreDrawTranslucentRenderables", "cigaParticles", function(dd)
	if dd then return end
	cam.Start3D(EyePos(), EyeAngles(), nil, nil, nil, nil, nil, nil, 150)
	render.SuppressEngineLighting(true)
	cigaParticleEmitter:Draw()
	render.SuppressEngineLighting(false)
	cam.End3D()
end)

local sin, cos, rand, w, t = math.sin, math.cos, math.Rand, 0, 0
local ciga_do_pulse = {
	function(ply,amt)
		if w > RealTime() then return end
		w = RealTime() + 0.4
		if !IsValid(ply) then return end
		local self = ply:GetActiveWeapon()
		if !IsValid(self) then return end

		local attachid = ply:LookupAttachment("eyes")
		cigaParticleEmitter:SetPos(LocalPlayer():GetPos())
		
		local angpos = ply:GetAttachment(attachid) or Angle(0,0,0)
		local fwd
		local pos
		
		if ply ~= LocalPlayer() or ply:ShouldDrawLocalPlayer() then
			fwd = angpos.Ang:Forward()
			pos = angpos.Pos + fwd * 3 - angpos.Ang:Up() * 3
		else
			fwd = ply:GetAimVector()
			pos = ply:GetShootPos() + fwd * 3
		end
		ang = fwd:Angle()

		local color = self.Color or Color(255, 255, 255)
		for i = 1, 25 do
			local particle = cigaParticleEmitter:Add("particle/particle_smokegrenade", pos ) --Меньше текстур - меньше ротаций.
			if particle then
				t = (t + 15) % 360
				local dir = sin(t) * 5 * ang:Up() + cos(t) * 5 * ang:Right()
				ciga_do_particle(particle, (ply:GetVelocity()*0.25)+((fwd*5 * (amt + 1))+dir), color, 0.11)
			end
		end
	end,

	function(ply,amt)
		if !IsValid(ply) then return end
		local self = ply:GetActiveWeapon()
		if !IsValid(self) then return end

		local attachid = ply:LookupAttachment("eyes")
		cigaParticleEmitter:SetPos(LocalPlayer():GetPos())
		
		local angpos = ply:GetAttachment(attachid) or Angle(0,0,0)
		local fwd
		local pos
		
		if ply ~= LocalPlayer() or ply:ShouldDrawLocalPlayer() then
			fwd = angpos.Ang:Forward()
			pos = angpos.Pos + fwd * 3 - angpos.Ang:Up() * 3
		else
			fwd = ply:GetAimVector()
			pos = ply:GetShootPos() + fwd * 3
		end

		local color = self.Color or Color(255, 255, 255)
		for i = 1,amt do
			local particle = cigaParticleEmitter:Add("particle/particle_noisesphere", pos )
			if particle then
				local dir = VectorRand():GetNormalized() * ((amt+5)/10)
				ciga_do_particle(particle, (ply:GetVelocity()*0.25)+(((fwd*9)+dir):GetNormalized() * rand(50,80) * (amt + 1) * 0.2), color, 1)
			end
		end
	end,

	function(ply,amt)
		if !IsValid(ply) then return end
		local self = ply:GetActiveWeapon()
		if !IsValid(self) then return end

		local attachid = ply:LookupAttachment("eyes")
		cigaParticleEmitter:SetPos(LocalPlayer():GetPos())
		
		local angpos = ply:GetAttachment(attachid) or Angle(0,0,0)
		local fwd
		local pos
		
		if ply ~= LocalPlayer() or ply:ShouldDrawLocalPlayer() then
			fwd = angpos.Ang:Forward()
			pos = angpos.Pos + fwd * 3 - angpos.Ang:Up() * 3
		else
			fwd = ply:GetAimVector()
			pos = ply:GetShootPos() + fwd * 3
		end

		local color = self.Color or Color(255, 255, 255)
		for i = 1,amt do
			local particle = cigaParticleEmitter:Add("particle/particle_smokegrenade", pos )
			if particle then
				local dir = VectorRand():GetNormalized() * ((amt+5)/10)
				ciga_do_particle(particle, (ply:GetVelocity()*0.25)+(((fwd*9)+dir):GetNormalized() * rand(50,80) * (amt + 1) * 0.2), color, 1.5)
			end
		end
	end
}

function ciga_do_particle(particle, vel, color, scale)
	particle:SetColor(color.r, color.g, color.b)
	particle:SetVelocity(vel)
	particle:SetGravity( Vector(0,0,1.5) )
	particle:SetLifeTime(0)
	particle:SetDieTime(rand(3, 4))
	particle:SetStartSize(1)
	particle:SetEndSize(33 * scale)
	particle:SetStartAlpha(100)
	particle:SetEndAlpha(0)
	--particle:SetCollide(true) --Главная аксиома оптимизации: "А нахуя?"
	--particle:SetBounce(0.25)
	particle:SetRoll(rand(0,360))
	particle:SetRollDelta(rand(-0.66,0.66))
	particle:SetAirResistance(50)
end

function SWEP:DrawWorldModel()
	local ply = self:GetOwner()

	local cigaScale = self.cigaScale or 1
	self:SetModelScale(cigaScale, 0) 
	self:SetSubMaterial()

	if IsValid(ply) then

		local bn = "ValveBiped.Bip01_R_Hand"
		if ply.cigaArmFullyUp then bn ="ValveBiped.Bip01_Head1" end
		local bon = ply:LookupBone(bn) or 0

		local opos = self:GetPos()
		local oang = self:GetAngles()
		local bp,ba = ply:GetBonePosition(bon)
		if bp then opos = bp end
		if ba then oang = ba end

		if ply.cigaArmFullyUp then
			--head position
			opos = opos + (oang:Forward()*0.95) + (oang:Right()*7) + (oang:Up()*0.035)
			oang:RotateAroundAxis(oang:Forward(),-100)
			oang:RotateAroundAxis(oang:Up(),100)
			opos = opos + (oang:Up()*(cigaScale-1)*-10.25)
		else
			--hand position
				oang:RotateAroundAxis(oang:Forward(),50)
			oang:RotateAroundAxis(oang:Right(),90)
			opos = opos + (oang:Forward()*2) + (oang:Up()*-4.5) + (oang:Right()*-2)
			oang:RotateAroundAxis(oang:Forward(),90)
			oang:RotateAroundAxis(oang:Up(),10)
			opos = opos + (oang:Up()*(cigaScale-1)*-10.25)
			opos = opos + (oang:Up() * 2)
			opos = opos + (oang:Right() * 0.5)
			opos = opos + (oang:Forward() * -1.5)
		end
		self:SetupBones()

		local mrt = self:GetBoneMatrix(0)
		if mrt then
		mrt:SetTranslation(opos)
		mrt:SetAngles(oang)

		self:SetBoneMatrix(0, mrt)
		end
	end

	self:DrawModel()
end

function SWEP:GetViewModelPosition(pos, ang)
	--mouth pos
	local vmpos1=self.cigaVMPos1 or Vector(18.5,-3.4,-3.25)
	local vmang1=self.cigaVMAng1 or Vector(170,-180,20)
	--hand pos
	local vmpos2=self.cigaVMPos2 or Vector(24,-8,-11.2)
	local vmang2=self.cigaVMAng2 or Vector(120,-180,150)

	if not LocalPlayer().cigaArmTime then LocalPlayer().cigaArmTime=0 end
	local lerp = math.Clamp((os.clock()-LocalPlayer().cigaArmTime)*3,0,1)
	if LocalPlayer().cigaArm then lerp = 1-lerp end
	/*
	local newpos = LerpVector(lerp,vmpos1,vmpos2)
	local newang = LerpVector(lerp,vmang1,vmang2)
	--I have a good reason for doing it like this
	newang = Angle(newang.x,newang.y,newang.z) 
	
	pos,ang = LocalToWorld(newpos,newang,pos,ang)*/
	local difvec = Vector(-10,-3.5,-12)--vmpos1 - vmpos2
	local orig = Vector(0,0,0)
	local topos = orig+difvec
	
	local difang = Vector(-30,0,0)--vmang1 - vmang2
	local origang = Vector(0,0,0)
	local toang = origang+difang
	
	
	
	local newpos = LerpVector(lerp,topos,orig)
	local newang = LerpVector(lerp,toang,origang)
	
	newang = Angle(newang.x, newang.y, newang.z)
	
	
	pos,ang = LocalToWorld(newpos,newang,pos,ang)
	return pos, ang
end

sound.Add({
	name = "ciga_inhale",
	channel = CHAN_WEAPON,
	volume = 0.033,
	level = 60,
	pitch = { 66 },
	sound = "cigainhale.wav"
})

local modenames = {"Кольцами", "Нормальный", "Рак легких"}
net.Receive("cigaMode",function()
	local pl, mode = net.ReadEntity(), net.ReadUInt(2)
	local self = pl:GetActiveWeapon()
	self.Mode = mode

	if pl ~= LocalPlayer() then return end
	chat.AddText(Color(100, 100, 100), "Режим курения: ", modenames[mode])
end)

net.Receive("cigaStart", function()
	local ply = net.ReadEntity()
	if !IsValid(ply) then return end 

	timer.Simple(0.3, function() 
		if !IsValid(ply) then return end 
		ply:EmitSound("ciga_inhale")
	end)

	if ply == LocalPlayer() then
		ply.cigaArm = true
		ply.cigaArmTime = os.clock()
	end

	for i=0,9 do
		timer.Simple(i/30,function() ciga_interpolate_arm(ply, math.abs(1-((9-i)/10))) end)
	end
end)

net.Receive("cigaEnd", function()
	local ply = net.ReadEntity()
	local amt = net.ReadInt(8)
	local self = ply:GetActiveWeapon()

	if !IsValid(ply) then return end
	ply:StopSound("ciga_inhale")

	if ply == LocalPlayer() then
		ply.cigaArm = false
		ply.cigaArmTime = os.clock()
	end
	
	for i=0,9 do
		timer.Simple(i/30,function() ciga_interpolate_arm(ply, math.abs(0-((9-i)/10))) end)
	end

	if amt>=50 then
		ply:EmitSound("cigacough1.wav",90)

		for i=1,200 do
			local d=i+10
			if i>140 then d=d+150 end
			timer.Simple((d-1)*0.003,function() ciga_do_pulse[self.Mode](ply, 1) end)
		end

		return
	elseif amt>=35 then
		ply:EmitSound("cigabreath2.wav",75,100,0.7)
	elseif amt>=10 then
		ply:EmitSound("cigabreath1.wav",70,130-math.min(100,amt*2),0.4+(amt*0.005))
	end

	for i = 1, amt do
		timer.Simple((i - 1) * 0.04, function() if self.Mode and ciga_do_pulse[self.Mode] then ciga_do_pulse[self.Mode](ply, math.floor(((amt * 2) - i) / 10)) end end)
	end
end)
--[[
net.Receive("cigaArm",function()
	local ply = net.ReadEntity()
	local z = net.ReadBool()
	if !IsValid(ply) then return end
	if ply.cigaArm != z then
		if z then
			timer.Simple(0.3, function() 
				if !IsValid(ply) then return end 
				if ply.cigaArm then ply:EmitSound("ciga_inhale") end
			end)
		else
			ply:StopSound("ciga_inhale")
		end
		ply.cigaArm = z
		ply.cigaArmTime = os.clock()
		local m = 0
		if z then m = 1 end

		for i=0,9 do
			timer.Simple(i/30,function() ciga_interpolate_arm(ply,math.abs(m-((9-i)/10)),z and 0 or 0.2) end)
		end
	end
end)]]

function ciga_interpolate_arm(ply, mult)
	if !IsValid(ply) then return end

	local b1 = ply:LookupBone("ValveBiped.Bip01_R_Upperarm")
	local b2 = ply:LookupBone("ValveBiped.Bip01_R_Forearm")
	if (not b1) or (not b2) then return end
	ply:ManipulateBoneAngles(b1,Angle(20*mult,-62*mult,10*mult))
	ply:ManipulateBoneAngles(b2,Angle(-5*mult,-10*mult,0))
	if mult==1 then ply.cigaArmFullyUp=true else ply.cigaArmFullyUp=false end
end

matproxy.Add({
	name = "cigaTankColor",
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
	end,
	bind = function( self, mat, ent )
		if ( !IsValid( ent ) ) then return end
		if ent:GetClass()=="viewmodel" then 
			ent=ent:GetOwner()
			if ( !IsValid( ent ) or !ent:IsPlayer() ) then return end
			ent=ent:GetActiveWeapon()
			if ( !IsValid( ent ) ) then return end
		end
		local v = ent.cigaTankColor or Vector(0.3,0.3,0.3)
		if v==Vector(-1,-1,-1) then
			local c = HSVToColor((CurTime()*60)%360,0.9,0.9)
			v = Vector(c.r,c.g,c.b)/255.0
		end
		mat:SetVector(self.ResultTo, v)
	end
})

matproxy.Add({
	name = "cigaAccentColor",
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
	end,
	bind = function( self, mat, ent )
		if ( !IsValid( ent ) ) then return end
		local o = ent:GetOwner()
		if ent:GetClass()=="viewmodel" then 
			if (!IsValid(o)) or (!o:IsPlayer()) then return end
			ent=o:GetActiveWeapon()
			if ( !IsValid( ent ) ) then return end
		end
		local special = false
		local col = ent.cigaAccentColor or special and Vector(1,0.8,0) or Vector(1,1,1)
		if col==Vector(-1,-1,-1) then
			col=Vector(1,1,1)
			if IsValid(o) then col=o:GetWeaponColor() end
		end
		mat:SetVector(self.ResultTo, col)
	end
})

SWEP.vRenderOrder = nil
function SWEP:ViewModelDrawn()
	
	local vm = self.Owner:GetViewModel()
	if !IsValid(vm) then return end
	
	if (!self.VElements) then return end
	
	self:UpdateBonePositions(vm)

	if (!self.vRenderOrder) then
		
		// we build a render order because sprites need to be drawn after models
		self.vRenderOrder = {}

		for k, v in pairs( self.VElements ) do
			if (v.type == "Model") then
				table.insert(self.vRenderOrder, 1, k)
			elseif (v.type == "Sprite" or v.type == "Quad") then
				table.insert(self.vRenderOrder, k)
			end
		end
		
	end

	for k, name in ipairs( self.vRenderOrder ) do
	
		local v = self.VElements[name]
		if (!v) then self.vRenderOrder = nil break end
		if (v.hide) then continue end
		
		local model = v.modelEnt
		local sprite = v.spriteMaterial
		
		if (!v.bone) then continue end
		
		local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
		
		if (!pos) then continue end
		
		if (v.type == "Model" and IsValid(model)) then

			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)

			model:SetAngles(ang)
			local matrix = Matrix()
			matrix:Scale(v.size)
			model:EnableMatrix( "RenderMultiply", matrix )
			
			if (v.material == "") then
				model:SetMaterial("")
			elseif (model:GetMaterial() != v.material) then
				model:SetMaterial( v.material )
			end
			
			if (v.skin and v.skin != model:GetSkin()) then
				model:SetSkin(v.skin)
			end
			
			if (v.bodygroup) then
				for k, v in pairs( v.bodygroup ) do
					if (model:GetBodygroup(k) != v) then
						model:SetBodygroup(k, v)
					end
				end
			end
			
			if (v.surpresslightning) then
				render.SuppressEngineLighting(true)
			end
			
			render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
			render.SetBlend(v.color.a/255)
			model:DrawModel()
			render.SetBlend(1)
			render.SetColorModulation(1, 1, 1)
			
			if (v.surpresslightning) then
				render.SuppressEngineLighting(false)
			end
			
		elseif (v.type == "Sprite" and sprite) then
			
			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			render.SetMaterial(sprite)
			render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
			
		elseif (v.type == "Quad" and v.draw_func) then
			
			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			
			cam.Start3D2D(drawpos, ang, v.size)
				v.draw_func( self )
			cam.End3D2D()

		end
		
	end
	
end

function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
	
	local bone, pos, ang
	if (tab.rel and tab.rel != "") then
		
		local v = basetab[tab.rel]
		
		if (!v) then return end
		
		// Technically, if there exists an element with the same name as a bone
		// you can get in an infinite loop. Let's just hope nobody's that stupid.
		pos, ang = self:GetBoneOrientation( basetab, v, ent )
		
		if (!pos) then return end
		
		pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
		ang:RotateAroundAxis(ang:Up(), v.angle.y)
		ang:RotateAroundAxis(ang:Right(), v.angle.p)
		ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			
	else
	
		bone = ent:LookupBone(bone_override or tab.bone)

		if (!bone) then return end
		
		pos, ang = Vector(0,0,0), Angle(0,0,0)
		local m = ent:GetBoneMatrix(bone)
		if (m) then
			pos, ang = m:GetTranslation(), m:GetAngles()
		end
		
		if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
			ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
			ang.r = -ang.r // Fixes mirrored models
		end
	
	end
	
	return pos, ang
end

function SWEP:CreateModels( tab )

	if (!tab) then return end

	// Create the clientside models here because Garry says we can't do it in the render hook
	for k, v in pairs( tab ) do
		if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
				string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
			
			v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
			if (IsValid(v.modelEnt)) then
				v.modelEnt:SetPos(self:GetPos())
				v.modelEnt:SetAngles(self:GetAngles())
				v.modelEnt:SetParent(self)
				v.modelEnt:SetNoDraw(true)
				v.createdModel = v.model
			else
				v.modelEnt = nil
			end
			
		elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
			and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
			
			local name = v.sprite.."-"
			local params = { ["$basetexture"] = v.sprite }
			// make sure we create a unique name based on the selected options
			local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
			for i, j in pairs( tocheck ) do
				if (v[j]) then
					params["$"..j] = 1
					name = name.."1"
				else
					name = name.."0"
				end
			end

			v.createdSprite = v.sprite
			v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
			
		end
	end
	
end

local allbones
local hasGarryFixedBoneScalingYet = false

function SWEP:UpdateBonePositions(vm)
	
	if self.ViewModelBoneMods then
		
		if (!vm:GetBoneCount()) then return end
		
		// !! WORKAROUND !! //
		// We need to check all model names :/
		local loopthrough = self.ViewModelBoneMods
		if (!hasGarryFixedBoneScalingYet) then
			allbones = {}
			for i=0, vm:GetBoneCount() do
				local bonename = vm:GetBoneName(i)
				if (self.ViewModelBoneMods[bonename]) then 
					allbones[bonename] = self.ViewModelBoneMods[bonename]
				else
					allbones[bonename] = { 
						scale = Vector(1,1,1),
						pos = Vector(0,0,0),
						angle = Angle(0,0,0)
					}
				end
			end
			
			loopthrough = allbones
		end
		// !! ----------- !! //
		
		for k, v in pairs( loopthrough ) do
			local bone = vm:LookupBone(k)
			if (!bone) then continue end
			
			// !! WORKAROUND !! //
			local s = Vector(v.scale.x,v.scale.y,v.scale.z)
			local p = Vector(v.pos.x,v.pos.y,v.pos.z)
			local ms = Vector(1,1,1)
			if (!hasGarryFixedBoneScalingYet) then
				local cur = vm:GetBoneParent(bone)
				while(cur >= 0) do
					local pscale = loopthrough[vm:GetBoneName(cur)].scale
					ms = ms * pscale
					cur = vm:GetBoneParent(cur)
				end
			end
			
			s = s * ms
			// !! ----------- !! //
			
			if vm:GetManipulateBoneScale(bone) != s then
				vm:ManipulateBoneScale( bone, s )
			end
			if vm:GetManipulateBoneAngles(bone) != v.angle then
				vm:ManipulateBoneAngles( bone, v.angle )
			end
			if vm:GetManipulateBonePosition(bone) != p then
				vm:ManipulateBonePosition( bone, p )
			end
		end
	else
		self:ResetBonePositions(vm)
	end
	   
end
 
function SWEP:ResetBonePositions(vm)
	
	if (!vm:GetBoneCount()) then return end
	for i=0, vm:GetBoneCount() do
		vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
		vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
		vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
	end
	
end

/**************************
	Global utility code
**************************/

// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
// Does not copy entities of course, only copies their reference.
// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
function table.FullCopy( tab )

	if (!tab) then return nil end
	
	local res = {}
	for k, v in pairs( tab ) do
		if (type(v) == "table") then
			res[k] = table.FullCopy(v) // recursion ho!
		elseif (type(v) == "Vector") then
			res[k] = Vector(v.x, v.y, v.z)
		elseif (type(v) == "Angle") then
			res[k] = Angle(v.p, v.y, v.r)
		else
			res[k] = v
		end
	end
	
	return res
	
end
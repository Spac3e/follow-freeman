local bit = bit
local util = util
local math = math
local undo = undo
local halo = halo
local game = game
local ents = ents
local pairs = pairs 
local table = table
local Angle = Angle
local Color = Color
local Vector = Vector
local IsValid = IsValid
local language = language
local tonumber = tonumber
local constraint = constraint
local concommand = concommand
local LocalPlayer = LocalPlayer
local CreateConVar = CreateConVar
local GetConVarNumber = GetConVarNumber
local RunConsoleCommand = RunConsoleCommand

local MOVETYPE_NONE = MOVETYPE_NONE
local SOLID_VPHYSICS = SOLID_VPHYSICS
local RENDERMODE_TRANSALPHA = RENDERMODE_TRANSALPHA

--[[--------------------------------------------------------------------------
-- Tool Settings
--------------------------------------------------------------------------]]--

TOOL.Category   = "Construction"
TOOL.Name       = "#Tool.stacker.name"
TOOL.Command    = nil
TOOL.ConfigName = ""

TOOL.ClientConVar[ "mode" ]      = "1"
TOOL.ClientConVar[ "dir" ]       = "1"
TOOL.ClientConVar[ "count" ]     = "1"
TOOL.ClientConVar[ "freeze" ]    = "1"
TOOL.ClientConVar[ "weld" ]      = "1"
TOOL.ClientConVar[ "nocollide" ] = "1"
TOOL.ClientConVar[ "ghostall" ]  = "1"
TOOL.ClientConVar[ "material" ]  = "1"
TOOL.ClientConVar[ "physprop" ]  = "1"
TOOL.ClientConVar[ "color" ]     = "1"
TOOL.ClientConVar[ "model" ]     = ""
TOOL.ClientConVar[ "offsetx" ]   = "0"
TOOL.ClientConVar[ "offsety" ]   = "0"
TOOL.ClientConVar[ "offsetz" ]   = "0"
TOOL.ClientConVar[ "rotp" ]      = "0"
TOOL.ClientConVar[ "roty" ]      = "0"
TOOL.ClientConVar[ "rotr" ]      = "0"
TOOL.ClientConVar[ "recalc" ]    = "0"
TOOL.ClientConVar[ "halo" ]      = "0"
TOOL.ClientConVar[ "halo_r" ]    = "0"
TOOL.ClientConVar[ "halo_g" ]    = "200"
TOOL.ClientConVar[ "halo_b" ]    = "190"
TOOL.ClientConVar[ "halo_a" ]    = "255"

if ( CLIENT ) then

	language.Add( "Tool.stacker.name", "Stacker" )
	language.Add( "Tool.stacker.desc", "Allows you to easily stack props" )
	language.Add( "Tool.stacker.0",    "Click to stack the prop you're pointing at." )
	language.Add( "Undone_stacker",    "Undone stacked prop(s)" )
	
end

--[[--------------------------------------------------------------------------
-- Enumerations
--------------------------------------------------------------------------]]--

local MODE_WORLD = 1 -- stacking relative to the world
local MODE_PROP  = 2 -- stacking relative to the prop

local DIRECTION_UP     = 1
local DIRECTION_DOWN   = 2
local DIRECTION_FRONT  = 3
local DIRECTION_BEHIND = 4
local DIRECTION_RIGHT  = 5
local DIRECTION_LEFT   = 6

local VECTOR_ZERO = Vector( 0, 0, 0 )

local ANGLE_ZERO = Angle( 0, 0, 0 )
local ANGLE_FRONT      = ANGLE_ZERO:Forward()
local ANGLE_RIGHT      = ANGLE_ZERO:Right()
local ANGLE_UP         = ANGLE_ZERO:Up()
local ANGLE_BEHIND     = -ANGLE_FRONT
local ANGLE_LEFT       = -ANGLE_RIGHT
local ANGLE_DOWN       = -ANGLE_UP

local TRANSPARENT = Color( 255, 255, 255, 150 )

--[[--------------------------------------------------------------------------
-- Console Variables
--------------------------------------------------------------------------]]--

CreateConVar( "stacker_max_count",        5, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- defines the max amount of props that can be stacked at a time
CreateConVar( "stacker_max_offsetx",     500, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- defines the max distance on the x plane that stacked props can be offset (for individual control)
CreateConVar( "stacker_max_offsety",     500, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- defines the max distance on the y plane that stacked props can be offset (for individual control)
CreateConVar( "stacker_max_offsetz",     500, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- defines the max distance on the z plane that stacked props can be offset (for individual control)
CreateConVar( "stacker_stayinworld",       0, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- determines whether props should be restricted to spawning inside the world or not (addresses possible crashes)
CreateConVar( "stacker_force_freeze",      0, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- determines whether props should be forced to spawn frozen or not
CreateConVar( "stacker_force_weld",        0, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- determines whether props should be forced to spawn welded or not
CreateConVar( "stacker_force_nocollide",   0, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- determines whether props should be forced to spawn nocollided or not
CreateConVar( "stacker_delay",             0, bit.bor( FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE ) ) -- determines the amount of time that must pass before a player can use stacker again
--------------------------------------------------------------------]]--

if ( CLIENT ) then
	local function ResetOffsets( ply, command, arguments )
		-- Reset all of the offset options to 0 and adv options to 1
		LocalPlayer():ConCommand( "stacker_offsetx 0" )
		LocalPlayer():ConCommand( "stacker_offsety 0" )
		LocalPlayer():ConCommand( "stacker_offsetz 0" )
		LocalPlayer():ConCommand( "stacker_rotp 0" )
		LocalPlayer():ConCommand( "stacker_roty 0" )
		LocalPlayer():ConCommand( "stacker_rotr 0" )
		--LocalPlayer():ConCommand( "stacker_recalc 1" )
		--LocalPlayer():ConCommand( "stacker_ghostall 1" )
		--LocalPlayer():ConCommand( "stacker_material 1" )
		--LocalPlayer():ConCommand( "stacker_color 1" )
		--LocalPlayer():ConCommand( "stacker_physprop 1" )
		--LocalPlayer():ConCommand( "stacker_halo 1" )
	end
	concommand.Add( "stacker_resetoffsets", ResetOffsets )
end


--[[--------------------------------------------------------------------------
-- 	GetGhostStack(), SetGhostStack( table )
--
--	Gets and sets the table of ghosted props in the stack.
--]]--
local function GetGhostStack() return GhostStack       end
local function SetGhostStack( tbl )   GhostStack = tbl end

--[[--------------------------------------------------------------------------
-- 	TOOL:GetCount()
--
--	Gets the maximum amount of props that can be stacked at a time
--]]--
function TOOL:GetCount() 
	return math.Clamp( self:GetClientNumber( "count" ), 0, GetConVarNumber( "stacker_max_count" ) ) 
end

--[[--------------------------------------------------------------------------
-- 	TOOL:GetDirection()
--
--	Gets the direction to stack the props
--]]--
function TOOL:GetDirection() return self:GetClientNumber( "dir" ) end

--[[--------------------------------------------------------------------------
-- 	TOOL:GetStackerMode()
--
--	Gets the stacker mode (1 = MODE_WORLD, 2 = MODE_PROP)
--]]--
function TOOL:GetStackerMode() return self:GetClientNumber( "mode" ) end

--[[--------------------------------------------------------------------------
-- 	TOOL:GetOffsetX(), TOOL:GetOffsetY(), TOOL:GetOffsetZ(), TOOL:GetOffsetVector()
--
--	Gets the distance to offset the position of the stacked props.
--	These values are clamped to prevent server crashes from players
--	using very high offset values.
--]]--
function TOOL:GetOffsetX() return math.Clamp( self:GetClientNumber( "offsetx" ), - GetConVarNumber( "stacker_max_offsetx" ), GetConVarNumber( "stacker_max_offsetx" ) ) end
function TOOL:GetOffsetY() return math.Clamp( self:GetClientNumber( "offsety" ), - GetConVarNumber( "stacker_max_offsety" ), GetConVarNumber( "stacker_max_offsety" ) ) end
function TOOL:GetOffsetZ() return math.Clamp( self:GetClientNumber( "offsetz" ), - GetConVarNumber( "stacker_max_offsetz" ), GetConVarNumber( "stacker_max_offsetz" ) ) end

function TOOL:GetOffsetVector() return Vector( self:GetOffsetX(), self:GetOffsetY(), self:GetOffsetZ() ) end

--[[--------------------------------------------------------------------------
-- 	TOOL:GetRotateP(), TOOL:GetRotateY(), TOOL:GetRotateR(), TOOL:GetRotateAngle()
--
--	Gets the value to rotate the angle of the stacked props.
--	These values are clamped to prevent server crashes from players
--	using very high rotation values.
--]]--
function TOOL:GetRotateP() return math.Clamp( self:GetClientNumber( "rotp" ), -360, 360 ) end
function TOOL:GetRotateY() return math.Clamp( self:GetClientNumber( "roty" ), -360, 360 ) end
function TOOL:GetRotateR() return math.Clamp( self:GetClientNumber( "rotr" ), -360, 360 ) end

function TOOL:GetRotateAngle() return Angle( self:GetRotateP(), self:GetRotateY(), self:GetRotateR() ) end

--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldFreeze()
--
--	Returns true if the stacked props should be spawned frozen.
--]]--
function TOOL:ShouldApplyFreeze() return self:GetClientNumber( "freeze" ) == 1 end
function TOOL:ShouldForceFreeze() return GetConVarNumber( "stacker_force_freeze" ) == 1 end
--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldWeld()
--
--	Returns true if the stacked props should be welded together.
--]]--
function TOOL:ShouldApplyWeld() return self:GetClientNumber( "weld" ) == 1 end
function TOOL:ShouldForceWeld() return GetConVarNumber( "stacker_force_weld" ) == 1 end
--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldNoCollide()
--
--	Returns true if the stacked props should be nocollided with each other.
--]]--
function TOOL:ShouldApplyNoCollide() return self:GetClientNumber( "nocollide" ) == 1 end
function TOOL:ShouldForceNoCollide() return GetConVarNumber( "stacker_force_nocollide" ) == 1 end
--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldStackRelative()
--
--	Returns true if the stacked props should be stacked relative to the new rotation.
--	Using this setting will allow you to create curved structures out of props.
--]]--
function TOOL:ShouldStackRelative() return self:GetClientNumber( "recalc" ) == 1 end
--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldGhostAll()
--
--	Returns true if the stacked props should all be ghosted or if only the 
--	first stacked prop should be ghosted.
--]]--
function TOOL:ShouldGhostAll() return self:GetClientNumber( "ghostall" ) == 1 end

--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldAddHalos(), TOOL:GetHaloR(), TOOL:GetHaloG(), TOOL:GetHaloB() TOOL:GetHaloA() TOOL:GetHaloColor()
--
--	Returns true if the stacked props should have halos drawn on them for added visibility.
--	Gets the RGBA values of the halo color.
--]]--
function TOOL:ShouldAddHalos() return self:GetClientNumber( "halo" ) == 1 end

function TOOL:GetHaloR() return math.Clamp( self:GetClientNumber( "halo_r" ), 0, 255 ) end
function TOOL:GetHaloG() return math.Clamp( self:GetClientNumber( "halo_g" ), 0, 255 ) end
function TOOL:GetHaloB() return math.Clamp( self:GetClientNumber( "halo_b" ), 0, 255 ) end
function TOOL:GetHaloA() return math.Clamp( self:GetClientNumber( "halo_a" ), 0, 255 ) end

function TOOL:GetHaloColor()
	return Color( self:GetHaloR(), self:GetHaloG(), self:GetHaloB(), self:GetHaloA() )
end

--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldApplyMaterial()
--
--	Returns true if the stacked props should have the original prop's material applied.
--]]--
function TOOL:ShouldApplyMaterial() return self:GetClientNumber( "material" ) == 1 end

--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldApplyColor()
--
--	Returns true if the stacked props should have the original prop's color applied.
--]]--
function TOOL:ShouldApplyColor() return self:GetClientNumber( "color" ) == 1 end

--[[--------------------------------------------------------------------------
-- 	TOOL:ShouldApplyPhysicalProperties()
--
--	Returns true if the stacked props should have the original prop's physicsl properties
--	applied, including gravity, physics material, and weight.
--]]--
function TOOL:ShouldApplyPhysicalProperties() return self:GetClientNumber( "physprop" ) == 1 end

--[[--------------------------------------------------------------------------
-- 	TOOL:GetDelay()
--
--	Returns the time in seconds that must pass before a player can use stacker again.
--	For example, if stacker_delay is set to 3, a player must wait 3 seconds in between each
--	use of stacker's left click.
--]]--
function TOOL:GetDelay() return GetConVarNumber( "stacker_delay" ) end

--[[--------------------------------------------------------------------------
-- Tool Functions
--------------------------------------------------------------------------]]--

--[[--------------------------------------------------------------------------
--
-- 	 TOOL:Deploy()
--
--	Called when the player brings out this tool.
--]]--
function TOOL:Deploy()
	self:ReleaseGhostStack()
end

--[[--------------------------------------------------------------------------
--
-- 	 TOOL:Holster()
--
--	Called when the player switches to a different tool.
--]]--
function TOOL:Holster()
	self:ReleaseGhostStack()
end

--[[--------------------------------------------------------------------------
--
-- 	 TOOL:OnRemove()
--
--	Should be called when the toolgun is somehow removed, but more than likely
--	doesn't get called due to the way the gmod_tool was coded.
--]]--
function TOOL:OnRemove()
	self:ReleaseGhostStack()
end

--[[--------------------------------------------------------------------------
--
-- 	 TOOL:OnDrop()
--
--	Should be called when when the toolgun is dropped, but more than likely
--	doesn't get called due to the way to gmod_tool was coded.
--]]--
function TOOL:OnDrop()
	self:ReleaseGhostStack()
end



--[[--------------------------------------------------------------------------
--
-- 	TOOL:Init()
--
--	Called when a player initializes in the server (probably InitPostEntity).
--	This is called only once and only during that time, meaning reloading this
--	file will not call TOOL:Init() again.
--
--	Since using hooks in STools is rather awkward when the hook function must use
--	this tool's function, loading hooked functions here ensures that we can use
--	'self' to refer to this tool object even after the TOOL global table has been made nil.
--]]--
--[[if ( CLIENT ) then
	function TOOL:Init()
		self:AddHalos()
	end
end]]

--[[--------------------------------------------------------------------------
--
-- 	TOOL:AddHalos()
--
--	Loads the hook that draws halos on the ghosted entities in the stack. 
--
--	THIS is the appropriate hook to create halos, NOT TOOL:Think()! The latter 
--	will be called way more than it needs to be and causes horrible FPS drop in singleplayer.
--]]--
--[[function TOOL:AddHalos()
	hook.Add( "PreDrawHalos", "improvedstacker.predrawhalos", function()
		if ( !IsValid( LocalPlayer() ) )         then return end
		if ( !LocalPlayer():Alive() )            then return end
		if ( !IsValid( LocalPlayer():GetActiveWeapon() ) or LocalPlayer():GetActiveWeapon():GetClass() ~= "gmod_tool" ) then return end
		if ( !IsValid( self:GetSWEP() ) )        then return end
		if ( !self:ShouldAddHalos() )            then return end

		local ghoststack = GetGhostStack()
		if ( !ghoststack or #ghoststack <= 0 ) then return end

		halo.Add( ghoststack, self:GetHaloColor() )
	end )
	hook.Remove( "PreDrawHalos", "improvedstacker.predrawhalos" )
end]]

--[[--------------------------------------------------------------------------
--
-- 	TOOL:LeftClick( table )
--
--	Attempts to create a stack of props relative to the entity being left clicked.
--]]--
function TOOL:LeftClick( trace )
	if ( !IsValid( trace.Entity ) or trace.Entity:GetClass() ~= "prop_physics" ) then return false end
	if ( CLIENT ) then return true end

	local count = self:GetCount()
	if ( count <= 0 ) then return false end
	
	if ( self:GetOwner().LastStackTime and self:GetOwner().LastStackTime + self:GetDelay() > CurTime() ) then self:GetOwner():PrintMessage( HUD_PRINTTALK, "You are using stacker too quickly" ) return false end
	self:GetOwner().LastStackTime = CurTime()
	
	local dir    = self:GetDirection()
	local mode   = self:GetStackerMode()
	local offset = self:GetOffsetVector()
	local rotate = self:GetRotateAngle()

	local stackRelative = self:ShouldStackRelative()
	local stayInWorld   = GetConVarNumber( "stacker_stayinworld" ) == 1

	local ply = self:GetOwner()
	local ent = trace.Entity

	local entPos  = ent:GetPos()
	local entAng  = ent:GetAngles()
	local entMod  = ent:GetModel()
	local entSkin = ent:GetSkin()
	local entMat  = ent:GetMaterial()
	local entCol  = ent:GetColor()
	
	local physMat  = ent:GetPhysicsObject():GetMaterial()
	local physGrav = ent:GetPhysicsObject():IsGravityEnabled()
	local lastEnt  = ent
	local newEnts  = { ent }
	local newEnt
	
	undo.Create( "stacker" )
	
	for i = 1, count, 1 do
		if ( !self:GetSWEP():CheckLimit( "props" ) )                           then break end
		if ( hook.Call( "PlayerSpawnProp", GAMEMODE, self:GetOwner(), entMod ) == false ) then break end
		
		if ( i == 1 or ( mode == MODE_PROP and stackRelative ) ) then
			stackdir, height, thisoffset = self:StackerCalcPos( lastEnt, mode, dir, offset )
		end
		
		entPos = entPos + stackdir * height + thisoffset
		entAng = entAng + rotate
		
		if ( stayInWorld and !util.IsInWorld( entPos ) ) then ply:PrintMessage( HUD_PRINTTALK, "Stacked props must be spawned within the world" ) break end
		
		newEnt = ents.Create( "prop_physics" )
		newEnt:SetModel( entMod )
		newEnt:SetPos( entPos )
		newEnt:SetAngles( entAng )
		newEnt:SetSkin( entSkin )
		newEnt:Spawn()
		
		-- this hook is for external prop protections and anti-spam addons
		-- it is called before undo, ply:AddCount, and ply:AddCleanup to allow developers to
		-- remove or mark this entity so that those same functions (if overridden) can
		-- detect that the entity came from Stacker
		if ( !IsValid( newEnt ) or hook.Run( "StackerEntity", newEnt, self:GetOwner() ) ~= nil )             then continue end
		if ( !IsValid( newEnt ) or hook.Run( "PlayerSpawnedProp", self:GetOwner(), entMod, newEnt ) ~= nil ) then continue end

		self:ApplyMaterial( newEnt, entMat )
		self:ApplyColor( newEnt, entCol )
		self:ApplyFreeze( ply, newEnt )
		self:ApplyWeld( lastEnt, newEnt )
		
		self:ApplyPhysicalProperties( ent, newEnt, trace.PhysicsBone, { GravityToggle = physGrav, Material = physMat } )
		
		lastEnt = newEnt
		table.insert( newEnts, newEnt )
		
		undo.AddEntity( newEnt )
		ply:AddCleanup( "props", newEnt )
	end
	
	self:ApplyNoCollide( newEnts )
	newEnts = nil
	
	undo.SetPlayer( ply )
	undo.Finish()

	return true
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:ApplyMaterial( entity, string )
--
--	Attempts to apply the original entity's material onto the stacked props.
--]]--
function TOOL:ApplyMaterial( ent, material )
	if ( !self:ShouldApplyMaterial() ) then ent:SetMaterial( "" ) return end
	
	ent:SetMaterial( material )
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:ApplyColor( entity, color )
--
--	Attempts to apply the original entity's color onto the stacked props.
--]]--
function TOOL:ApplyColor( ent, color )
	if ( !self:ShouldApplyColor() ) then return end
	
	ent:SetColor( color )
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:ApplyFreeze( player, entity )
--
--	Attempts to spawn the stacked props frozen in place. If not, spawn them unfrozen.
--]]--
function TOOL:ApplyFreeze( ply, ent )
	if ( self:ShouldForceFreeze() or self:ShouldApplyFreeze() ) then
			ply:AddFrozenPhysicsObject( ent, ent:GetPhysicsObject() )
			ent:GetPhysicsObject():EnableMotion( false )
	else
		ent:GetPhysicsObject():Wake()
	end
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:ApplyWeld( entity, entity )
--
--	Attempts to weld the new entity to the last entity
--]]--
function TOOL:ApplyWeld( lastEnt, newEnt )
	if ( !self:ShouldForceWeld() and !self:ShouldApplyWeld() ) then return end

	constraint.Weld( lastEnt, newEnt, 0, 0, 0 )
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:ApplyNoCollide( table )
--
--	Attempts to nocollide all stacker entities with one another.
--	This is roughly an O( ![N-1] ) operation, better than the previous O ( N^2 ) version.
--]]--
function TOOL:ApplyNoCollide( stackerEnts )
	if ( !self:ShouldForceNoCollide() and !self:ShouldApplyNoCollide() ) then return end
	if ( #stackerEnts == 1 ) then return end
	if ( #stackerEnts == 2 ) then constraint.NoCollide( stackerEnts[1], stackerEnts[2], 0, 0 ) return end
	
	for i = 1, #stackerEnts - 1 do
		for j = i + 1, #stackerEnts do
			constraint.NoCollide( stackerEnts[i], stackerEnts[j], 0, 0 )
		end
	end
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:ApplyPhysicalProperties( entity, entity, number, table )
--
--	Attempts to apply the original entity's Gravity/Physics Material properties 
--	and weight onto the stacked propa.
--	
--]]--
function TOOL:ApplyPhysicalProperties( original, newEnt, boneID, properties )
	
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:StackerCalcPos( entity, number, number, number )
--
--	Calculates the positions and angles of the entity being created in the stack.
--	This function uses a lookup table for added optimization as opposed to an if-else block.
--]]--
local CALC_POS = {
	[MODE_WORLD] = {
		[DIRECTION_UP]     = function( hi, low ) return ANGLE_UP,     math.abs( hi.z - low.z ) end,
		[DIRECTION_DOWN]   = function( hi, low ) return ANGLE_DOWN,   math.abs( hi.z - low.z ) end,
		[DIRECTION_FRONT]  = function( hi, low ) return ANGLE_FRONT,  math.abs( hi.x - low.x ) end,
		[DIRECTION_BEHIND] = function( hi, low ) return ANGLE_BEHIND, math.abs( hi.x - low.x ) end,
		[DIRECTION_RIGHT]  = function( hi, low ) return ANGLE_RIGHT,  math.abs( hi.y - low.y ) end,
		[DIRECTION_LEFT]   = function( hi, low ) return ANGLE_LEFT,   math.abs( hi.y - low.y ) end,
	},
	
	[MODE_PROP] = {
		[DIRECTION_UP]     = function( ang, offset, hi, low ) return ang:Up(),           math.abs( hi.z - low.z ), (ang:Up()      * offset.X     ) + (ang:Forward() * offset.Z * -1) + (ang:Right()   * offset.Y)      end,
		[DIRECTION_DOWN]   = function( ang, offset, hi, low ) return ang:Up()      * -1, math.abs( hi.z - low.z ), (ang:Up()      * offset.X * -1) + (ang:Forward() * offset.Z     ) + (ang:Right()   * offset.Y)      end,
		[DIRECTION_FRONT]  = function( ang, offset, hi, low ) return ang:Forward(),      math.abs( hi.x - low.x ), (ang:Forward() * offset.X     ) + (ang:Up()      * offset.Z     ) + (ang:Right()   * offset.Y)      end,
		[DIRECTION_BEHIND] = function( ang, offset, hi, low ) return ang:Forward() * -1, math.abs( hi.x - low.x ), (ang:Forward() * offset.X * -1) + (ang:Up()      * offset.Z     ) + (ang:Right()   * offset.Y * -1) end,
		[DIRECTION_RIGHT]  = function( ang, offset, hi, low ) return ang:Right(),        math.abs( hi.y - low.y ), (ang:Right()   * offset.X     ) + (ang:Up()      * offset.Z     ) + (ang:Forward() * offset.Y * -1) end,
		[DIRECTION_LEFT]   = function( ang, offset, hi, low ) return ang:Right()   * -1, math.abs( hi.y - low.y ), (ang:Right()   * offset.X * -1) + (ang:Up()      * offset.Z     ) + (ang:Forward() * offset.Y)      end,
	},
}

function TOOL:StackerCalcPos( ent, mode, dir, offset )
	local height, direction
	
	if ( mode == MODE_WORLD ) then -- get the position relative to the world's directions
		direction, height = CALC_POS[ mode ][ dir ]( ent:WorldSpaceAABB() )
	elseif ( mode == MODE_PROP ) then -- get the position relative to the prop's directions
		direction, height, offset = CALC_POS[ mode ][ dir ]( ent:GetAngles(), offset, ent:OBBMaxs(), ent:OBBMins() )
	end
	
	return direction, height, offset
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:CreateGhostStack( entity, vector, angle )
--
--	Attempts to create a stack of ghosted props on the prop the player is currently
--	looking at before they actually left click to create the stack. This acts
--	as a visual aid for the player so they can see the results without actually creating
--	the entities yet (if in multiplayer).
--]]--
function TOOL:CreateGhostStack( ent )
	if ( GetGhostStack() ) then self:ReleaseGhostStack() end

	local count = self:GetCount()
	if ( !self:ShouldGhostAll() and count ~= 0 ) then count = 1 end

	local entMod  = ent:GetModel()
	local entSkin = ent:GetSkin()
	
	local ghoststack = {}
	local ghost
	
	for i = 1, count, 1 do
		if ( CLIENT ) then ghost = ents.CreateClientProp( entMod )
		else               ghost = ents.Create( "prop_physics" ) end
		
		if ( !IsValid( ghost ) ) then continue end

		ghost:SetModel( entMod )
		ghost:SetSkin( entSkin )
		ghost:Spawn()

		ghost:SetSolid( SOLID_VPHYSICS )
		ghost:SetMoveType( MOVETYPE_NONE )
		ghost:SetRenderMode( RENDERMODE_TRANSALPHA )
		ghost:SetNotSolid( true )
		
		table.insert( ghoststack, ghost )
	end
	
	SetGhostStack( ghoststack )
	
	return true
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:ReleaseGhostStack()
--	
--	Attempts to remove all ghosted props in the stack. 
--	This occurs when the player stops looking at a prop with the stacker tool equipped.
--]]--
function TOOL:ReleaseGhostStack()
	local ghoststack = GetGhostStack()
	if ( !ghoststack ) then return end
	
	for i = 1, #ghoststack, 1 do
		if ( !IsValid( ghoststack[ i ] ) ) then continue end
		ghoststack[ i ]:Remove()
		ghoststack[ i ] = nil
	end
	
	SetGhostStack( nil )
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:CheckGhostStack()
--
--	Attempts to validate the status of the ghosted props in the stack.
--]]--
function TOOL:CheckGhostStack()
	local ghoststack = GetGhostStack()
	if ( !ghoststack ) then return false end
	
	for i = 1, #ghoststack, 1 do
		if ( !IsValid( ghoststack[ i ] ) ) then return false end
	end
	
	if     ( #ghoststack ~= self:GetCount() and  self:ShouldGhostAll() ) then return false
	elseif ( #ghoststack ~= 1               and !self:ShouldGhostAll() ) then return false end
	
	return true
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL:UpdateGhostStack( entity )
--
--	Attempts to update the positions and angles of all ghosted props in the stack.
--]]--
function TOOL:UpdateGhostStack( ent )
	local ghoststack = GetGhostStack()
	
	local mode   = self:GetStackerMode()
	local dir    = self:GetDirection()
	local offset = self:GetOffsetVector()
	local rotate = self:GetRotateAngle()
	local recalc = self:ShouldStackRelative()
	
	local applyMaterial = self:ShouldApplyMaterial()
	local applyColor    = self:ShouldApplyColor()
	
	local lastEnt = ent
	local entPos = lastEnt:GetPos()
	local entAng = lastEnt:GetAngles()
	local entMat = ent:GetMaterial()
	local entCol = ent:GetColor()
	      entCol.a = 150
	
	local stackdir, height, thisoffset
	local ghost
	
	for i = 1, #ghoststack, 1 do
		if ( i == 1 or ( mode == MODE_PROP and recalc ) ) then
			stackdir, height, thisoffset = self:StackerCalcPos( lastEnt, mode, dir, offset )
		end

		entPos = entPos + stackdir * height + thisoffset
		entAng = entAng + rotate
	
		local ghost = ghoststack[ i ]
		
		ghost:SetAngles( entAng )
		ghost:SetPos( entPos )
		ghost:SetMaterial( ( applyMaterial and entMat ) or "" )
		ghost:SetColor( ( applyColor and entCol ) or TRANSPARENT )
		ghost:SetNoDraw( false )
		lastEnt = ghost
	end
end

--[[--------------------------------------------------------------------------
--
--	TOOL:Think()
--
--	While the stacker tool is equipped, this function will check to see if
--	the player is looking at any props and attempt to create the stack of
--	ghosted props before the players actually left clicks.
--]]--
function TOOL:Think()
	if ( SERVER ) then return end
	
	local ply = self:GetOwner()
	local ent = ply:GetEyeTrace().Entity
	
	if ( IsValid( ent ) and ent:GetClass() == "prop_physics" ) then
		self.CurrentEnt = ent

		if ( self.CurrentEnt == self.LastEnt ) then
			if ( self:CheckGhostStack() ) then
				self:UpdateGhostStack( self.CurrentEnt )
			else
				self:ReleaseGhostStack()
				self.LastEnt = nil
				return
			end
		else
			if ( self:CreateGhostStack( self.CurrentEnt ) ) then
				self.LastEnt = self.CurrentEnt 
			end
		end
		
		if ( !self:ShouldAddHalos() )  then return end

		local ghoststack = GetGhostStack()
		if ( !ghoststack or #ghoststack <= 0 ) then return end
	else
		self:ReleaseGhostStack()
		self.LastEnt = nil
	end
end

--[[--------------------------------------------------------------------------
--
-- 	TOOL.BuildCPanel( panel )
--
--	Builds the control panel menu that can be seen when holding Q and accessing
--	the stacker menu.
--]]--
function TOOL.BuildCPanel( cpanel )
	cpanel:AddControl( "Header", { Text = "#Tool.stacker.name", Description	= "#Tool.stacker.desc" } )
	
	cpanel:AddControl( "Checkbox", { Label = "Freeze stacked props",     Command = "stacker_freeze" } )
	cpanel:AddControl( "Checkbox", { Label = "Weld stacked props",       Command = "stacker_weld" } )
	cpanel:AddControl( "Checkbox", { Label = "No-collide stacked props", Command = "stacker_nocollide" } )

	local params = { Label = "Stack relative to:", MenuButton = "0", Options = {} }
	params.Options[ "World" ] = { stacker_mode = "1" }
	params.Options[ "Prop" ]  = { stacker_mode = "2" }
	cpanel:AddControl( "ComboBox", params )

	local params = { Label = "Stack direction", MenuButton = "0", Options = {} }
	params.Options[ "Up" ]     = { stacker_dir = DIRECTION_UP }
	params.Options[ "Down" ]   = { stacker_dir = DIRECTION_DOWN }
	params.Options[ "Front" ]  = { stacker_dir = DIRECTION_FRONT }
	params.Options[ "Behind" ] = { stacker_dir = DIRECTION_BEHIND }
	params.Options[ "Right" ]  = { stacker_dir = DIRECTION_RIGHT }
	params.Options[ "Left" ]   = { stacker_dir = DIRECTION_LEFT }
	cpanel:AddControl( "ComboBox", params )
	
	cpanel:AddControl( "Slider", { Label = "Count",Type = "Integer", Min = 1, Max = GetConVarNumber( "stacker_max_count" ), Command = "stacker_count", Description = "How many props to create in each stack" } )

	--cpanel:AddControl( "Header", { Text = "Advanced Options", Description = "These options are for advanced users. Leave them all default ( 0 ) if you don't understand what they do." }  )
	cpanel:AddControl( "Button", { Label = "Reset offsets and rotations", Command = "stacker_resetoffsets", Text = "Reset" } )
	
	cpanel:AddControl( "Slider", { Label = "Offset X ( forward/back )", Type = "Float", Min = - GetConVarNumber( "stacker_max_offsetx" ), Max = GetConVarNumber( "stacker_max_offsetx" ), Value = 0, Command = "stacker_offsetx" } )
	cpanel:AddControl( "Slider", { Label = "Offset Y ( right/left )",   Type = "Float", Min = - GetConVarNumber( "stacker_max_offsety" ), Max = GetConVarNumber( "stacker_max_offsety" ), Value = 0, Command = "stacker_offsety" } )
	cpanel:AddControl( "Slider", { Label = "Offset Z ( up/down )",      Type = "Float", Min = - GetConVarNumber( "stacker_max_offsetz" ), Max = GetConVarNumber( "stacker_max_offsetz" ), Value = 0, Command = "stacker_offsetz" } )
	cpanel:AddControl( "Slider", { Label = "Rotate Pitch",              Type = "Float", Min = -360,  Max = 360,  Value = 0, Command = "stacker_rotp" } )
	cpanel:AddControl( "Slider", { Label = "Rotate Yaw",                Type = "Float", Min = -360,  Max = 360,  Value = 0, Command = "stacker_roty" } )
	cpanel:AddControl( "Slider", { Label = "Rotate Roll",               Type = "Float", Min = -360,  Max = 360,  Value = 0, Command = "stacker_rotr" } )
	
	cpanel:AddControl( "Checkbox", { Label = "Stack relative to new rotation", Command = "stacker_recalc",    Description = "Stacks each prop relative to the prop right before it. This allows you to create curved stacks." } )
	cpanel:AddControl( "Checkbox", { Label = "Apply material",                 Command = "stacker_material",  Description = "Applies the material of the original prop to all stacked props" } )
	cpanel:AddControl( "Checkbox", { Label = "Apply color",                    Command = "stacker_color",     Description = "Applies the color of the original prop to all stacked props" } )
	cpanel:AddControl( "Checkbox", { Label = "Apply physical properties",      Command = "stacker_physprop",  Description = "Applies the physical properties of the original prop to all stacked props" } )
	cpanel:AddControl( "Checkbox", { Label = "Ghost all props in the stack",   Command = "stacker_ghostall",  Description = "Creates every ghost prop in the stack instead of just the first ghost prop" } )
	cpanel:AddControl( "Checkbox", { Label = "Add halos to ghosted props",     Command = "stacker_halo",      Description = "Gives halos to all of the props in to ghosted stack" } )
	cpanel:AddControl( "Color", { Label = "Halo color", Red = "stacker_halo_r", Green = "stacker_halo_g", Blue = "stacker_halo_b", Alpha = "stacker_halo_a" } )
end
TOOL.Category = "Render"
TOOL.Name = "#tool.colour.name"

TOOL.ClientConVar[ "r" ] = 255
TOOL.ClientConVar[ "g" ] = 0
TOOL.ClientConVar[ "b" ] = 255
TOOL.ClientConVar[ "a" ] = 255

local function SetColour( Player, ent, data )

	if ( data.Color && data.Color.a < 255 ) then
		data.Color.a = Player:IsRoot() && data.Color.a || math.min(data.Color.a, 100)
		data.RenderMode = 1
	end
	if ( data.RenderMode ) then ent:SetRenderMode( data.RenderMode ) end
	if ( data.Color ) then ent:SetColor( Color( data.Color.r, data.Color.g, data.Color.b, data.Color.a ) ) end
	if ( SERVER ) then
		duplicator.StoreEntityModifier( ent, "colour", Data )
	end
	
end
duplicator.RegisterEntityModifier( "colour", SetColour )

function TOOL:LeftClick( trace )

	local ent = trace.Entity
	if ( IsValid( ent.AttachedEntity ) ) then ent = ent.AttachedEntity end

	if IsValid( ent ) then -- The entity is valid and isn't worldspawn

		if ( CLIENT ) then return true end
	
		local r = self:GetClientNumber( "r", 0 )
		local g = self:GetClientNumber( "g", 0 )
		local b = self:GetClientNumber( "b", 0 )
		local a = self:GetClientNumber( "a", 0 )

		SetColour( self:GetOwner(), ent, { Color = Color( r, g, b, a )})

		return true
		
	end

end

function TOOL:RightClick( trace )

	local ent = trace.Entity
	if ( IsValid( ent.AttachedEntity ) ) then ent = ent.AttachedEntity end

	if IsValid( ent ) then -- The entity is valid and isn't worldspawn

		if ( CLIENT ) then return true end
	
		SetColour( self:GetOwner(), ent, { Color = Color( 255, 255, 255, 255 ), RenderMode = 0, RenderFX = 0 } )
		return true
	
	end
	
end

local ConVarsDefault = TOOL:BuildConVarList()

function TOOL.BuildCPanel( CPanel )
	CPanel:AddControl( "Header", { Description	= "#tool.colour.desc" } )

	CPanel:AddControl( "ComboBox", { MenuButton = 1, Folder = "colour", Options = { [ "#preset.default" ] = ConVarsDefault }, CVars = table.GetKeys( ConVarsDefault ) } )

	CPanel:AddControl( "Color", { Label = "#tool.colour.color", Red = "colour_r", Green = "colour_g", Blue = "colour_b", Alpha = "colour_a" } )
end
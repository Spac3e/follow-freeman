
-----------------------------------------------------
cvar.Register'color_modification':SetDefault(true):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Улучшение цветов')

local tab = {
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0,
	[ "$pp_colour_brightness" ] = -0.02,
	[ "$pp_colour_contrast" ] = 1.1,
	[ "$pp_colour_colour" ] = 1.05,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0
}

hook.Add('RenderScreenspaceEffects', function()
	if cvar.GetValue('color_modification') then
		DrawColorModify( tab )
	end
end)


local color_pink = rp.chatcolors.Pink
local color_red = rp.chatcolors.Red
local color_white = rp.chatcolors.White

local cards = {
	"Туз ♥",
	"2 ♥",
	"3 ♥",
	"4 ♥",
	"5 ♥",
	"6 ♥",
	"7 ♥",
	"8 ♥",
	"9 ♥",
	"10 ♥",
	"Валет ♥",
	"Дама ♥",
	"Король ♥",
	"Туз ♦",
	"2 ♦",
	"3 ♦",
	"4 ♦",
	"5 ♦",
	"6 ♦",
	"7 ♦",
	"8 ♦",
	"9 ♦",
	"10 ♦",
	"Валет ♦",
	"Дама ♦",
	"Король ♦",
	"Туз ♣",
	"2 ♣",
	"3 ♣",
	"4 ♣",
	"5 ♣",
	"6 ♣",
	"7 ♣",
	"8 ♣",
	"9 ♣",
	"10 ♣",
	"Валет ♣",
	"Дама ♣",
	"Король ♣",
	"Туз ♠",
	"2 ♠",
	"3 ♠",
	"4 ♠",
	"5 ♠",
	"6 ♠",
	"7 ♠",
	"8 ♠",
	"9 ♠",
	"10 ♠",
	"Валет ♠",
	"Дама ♠",
	"Король ♠"
}

local function RollTheDice(pl, text, args)
	rp.LocalChat(CHAT_NONE, pl, 250, color_red, '[', color_pink, 'Кубик', color_red, '] ', pl:GetJobColor(), pl:Name(), color_white, ' кинул и выпало ', color_pink, tostring(math.random(100)), color_white, ' из 100.')
end
rp.AddCommand("/roll", RollTheDice)

local function DoubleDice(pl, text, args)
	rp.LocalChat(CHAT_NONE, pl, 250, color_red, '[', color_pink, 'Кости', color_red, '] ', pl:GetJobColor(), pl:Name(), color_white, ' кинул и выпало ', color_pink, tostring(math.random(1, 6)), color_white, ' и ', color_pink, tostring(math.random(1, 6)), color_white, '.')
end
rp.AddCommand("/dice", DoubleDice)

local function RandomCard(pl, text, args)
	rp.LocalChat(CHAT_NONE, pl, 250, color_red, '[', color_pink, 'Карты', color_red, '] ', pl:GetJobColor(), pl:Name(), color_white, ' вытянул ', color_pink, table.Random(cards), color_white, '.')
end
rp.AddCommand("/cards", RandomCard)
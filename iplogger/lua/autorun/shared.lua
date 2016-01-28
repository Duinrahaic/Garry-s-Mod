if(SERVER)then AddCSLuaFile() else AddCSLuaFile() end


ipLogger.About = [[
	IPLogger V2.0 is made by Duinrahaic
	Contact:	STEAM_0:1:47904525 
	Version:	2.0
]]

// Converts long month into int
function convertMonthStringtoInt(value)
	if (value == "January")then 
		return "1"
	elseif (value == "February")then
		return "2"
	elseif (value == "March")then
		return "3"
	elseif (value == "April")then
		return "4"
	elseif (value == "May")then
		return "5"
	elseif (value == "June")then
		return "6"
	elseif (value == "July")then
		return "7"
	elseif (value == "August")then
		return "8"
	elseif (value == "September")then
		return "9"
	elseif (value == "October")then
		return "10"
	elseif (value == "November")then
		return "11"
	elseif (value == "December")then
		return "12"
	else 
		return ""
	end
end

--[[
	KARMA RETURN V1.0
	By Duinrahaic (STEAM_0:1:47904525)
	Gives/Takes Pointshop Points based on behaviour.
	
	Install Instructions:
	insert the following line in "garrysmod\gamemodes\terrortown\gamemode\karma.lua" at line 254
	hook.Call( "KarmaReturn" ) -- Karma Return Hook
	
	insert the following 3 lines in "garrysmod\gamemodes\terrortown\gamemode\lang\english.lua" at the end of the file 
	-- Karma Return -- 
	L.KarmaReturnG = "You were given {amount} points for good karma!"
	L.KarmaReturnB = "You lost {amount} points for bad karma!"
	
--]]

if(SERVER)then
	local base_points = .1            -- Point multiplier
	local karma_starting = 850	      -- When karma begins
	hook.Add( "KarmaReturn", "KarmaReturn", function(ply)
		for _, ply in pairs(player.GetAll()) do
			local x = math.Round(ply:GetBaseKarma())
			x = math.Round((x - karma_starting ) * base_points, 0)
			ply:PS_GivePoints(x)
			Msg("[KARMA RETURN] Gave ".. x .." points to ".. ply:Nick() .. "\n")
			if x > 0 then LANG.Msg(ply, "KarmaReturnG", {amount = x}) end
			if x < 0 then LANG.Msg(ply, "KarmaReturnB", {amount = -x}) end
		end
	end )
end
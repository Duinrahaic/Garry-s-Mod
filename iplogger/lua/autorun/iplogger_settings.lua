if SERVER then AddCSLuaFile() 
	Msg("Iplogger : Settings initialized \n")
end

ipLogger = {}
ipLogger.Config = {}
-- Do not leave arrays blank, just type "empty" in blank sections. Also separate each id and rank with a comma.

-- Use one or the other Do not use both SteamID(true) and Group(false) access
ipLogger.Config.Use = true

--Specific Users who can access the ipLogger window (true)
ipLogger.Config.SteamIDAccess = {"STEAM_0:1:47904525"}

--Groups that can access the ipLogger window (false)
ipLogger.Config.Admin = {"superadmin"}

--The command that opens the ipLogger window (default: "iplogger_admin" )
ipLogger.Config.Comm = "iplogger_admin"
--------------------------------DO NOT TOUCH BELOW CONTENTS------------------------------------
-- Access grant
function ipLogger.CanAccess(ply)
	local x = false
	if(ipLogger.Config.Use)then -- if true then user
		for _, id in pairs( ipLogger.Config.SteamIDAccess) do
			if ply:SteamID() == id then x = true end
		end
	end
	
	if (!ipLogger.Config.Use)then --if false then group
		for _, grp in pairs( ipLogger.Config.Admin ) do
			if ply:IsUserGroup( grp ) then x = true end
		end
	end
	
	return x
end

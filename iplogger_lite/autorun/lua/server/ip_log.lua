
-- IP LOGGER v1.1						  
-- Last Version Edit : 10-23-14				  
-- Created by: Duinrahaic  == STEAM_0:1:47904525				  
-- Description: 
--   ~ Logs player name , ip , and Steam ID on connect and disconnect.
--   ~ All files are located in data/IpLog/#DATE#.txt 


hook.Add("PlayerInitialSpawn", "SaveIP", function( p )	
    if p:IPAddress() != nil then
		local current_date = os.date( "%B-%Y" )
		local dayN = os.date("%a")
		local dayNum = os.date("%d")
		local current_time = os.date( "*t" )
		local x = string.format( "[%02i:%02i:%02i]", current_time.hour, current_time.min, current_time.sec )
		file.CreateDir( "IpLog" )	
		file.Append("IpLog/"..current_date..".txt", x.."["..dayN.." - "..dayNum .."]".."Player "..p:Nick().." has CONN. from the IP: "..p:IPAddress().." and with the Steam ID: "..p:SteamID().."\n")
    end
end)

hook.Add("PlayerDisconnected", "SaveIP", function( p )
    if p:IPAddress() != nil then
		local current_date = os.date( "%B-%Y" )
		local dayN = os.date("%a")
		local dayNum = os.date("%d")
		local current_time = os.date( "*t" )
		local x = string.format( "[%02i:%02i:%02i]", current_time.hour, current_time.min, current_time.sec )
		file.CreateDir( "IpLog" )	
		file.Append("IpLog/"..current_date..".txt", x.."["..dayN.." - "..dayNum .."]".."Player "..p:Nick().." has DISC. with the IP: "..p:IPAddress().." and with the Steam ID: "..p:SteamID().."\n")
    end
end)


/*
IP LOGGER Version Info
-1.0 
	- Intial
-1.1 
	- Changed formatting to Month-Year.txt
	- Changed internal formatting to [Time][Day Name - Day Number]
*/
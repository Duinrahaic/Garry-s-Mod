if SERVER then AddCSLuaFile() 
	Msg("Iplogger : Hooks initialized \n")

	//CONN hook
	hook.Add("PlayerInitialSpawn", "SaveIPCONN", function( ply )	
		if ply:IPAddress() != nil then
			local Action = "CONN"
			local NN = ply:Nick()
			local ID = ply:SteamID()
			local IP = ply:IPAddress()
			insert_log(Action,NN,ID,IP)
		end
	end)
	
	//DISC hook
	hook.Add("PlayerDisconnected", "SaveIPDISC", function( ply )
		if ply:IPAddress() != nil then
			local Action = "DISC"
			local NN = ply:Nick()
			local ID = ply:SteamID()
			local IP = ply:IPAddress()
			insert_log(Action,NN,ID,IP)
		end
	end)
	
    function reset_month_log()
		f = file.Open("iplogger/Years.txt","r","DATA")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("No IPLogger Years")
		else 
			ipLogger.Years = von.deserialize(str)
		end
		f:Close()
	
        local currentYear = os.date("%Y")		
		Msg(currentYear)
        if((currentYear != ipLogger.Year[1]) and (tonumber(os.date("%m")) == 1))then
            file.Delete("iplogger/January.txt")
			ipLogger.January = {}
			table.remove(ipLogger.Year,1)
			table.insert(ipLogger.Year,1,currentYear)
			Msg(PrintTable(ipLogger.Year))
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[2] and (tonumber(os.date("%m")) == 2))then
            file.Delete("iplogger/February.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.February = {}
            ipLogger.Year[2] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[3] and (tonumber(os.date("%m")) == 3))then
            file.Delete("iplogger/March.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.March = {}
            ipLogger.Year[3] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[4] and (tonumber(os.date("%m")) == 4))then
            file.Delete("iplogger/April.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.April = {}
            ipLogger.Year[4] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[5] and (tonumber(os.date("%m")) == 5))then
            file.Delete("iplogger/May.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.May = {}
            ipLogger.Year[5] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[6] and (tonumber(os.date("%m")) == 6))then
            file.Delete("iplogger/June.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.June = {}
            ipLogger.Year[6] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[7] and (tonumber(os.date("%m")) == 7))then
            file.Delete("iplogger/July.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.July = {}
            ipLogger.Year[7] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[8] and (tonumber(os.date("%m")) == 8))then
            file.Delete("iplogger/August.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.August = {}
            ipLogger.Year[8] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[9] and (tonumber(os.date("%m")) == 9))then
            file.Delete("iplogger/September.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.September = {}
            ipLogger.Year[9] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[10] and (tonumber(os.date("%m")) == 10))then
            file.Delete("iplogger/October.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.October = {}
            ipLogger.Year[10] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[11] and (tonumber(os.date("%m")) == 11))then
            file.Delete("iplogger/November.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.November = {}
            ipLogger.Year[11] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		elseif(currentYear != ipLogger.Year[12] and (tonumber(os.date("%m")) == 12))then
            file.Delete("iplogger/December.txt")
            file.Delete("iplogger/Years.txt")
			ipLogger.December = {}
            ipLogger.Year[12] = currentYear
            file.Append("iplogger/Years.txt", von.serialize(ipLogger.Year))
		end
    end
    
	// log insertion
	function insert_log(Action,NN,ID,IP) -- TABLE
		local Day = os.date("%a")
		local current_time = os.date( "*t" )
		local Date = os.date("%m-%d")
		local Time = string.format( "[%02i:%02i:%02i]", current_time.hour, current_time.min, current_time.sec )
 
		loadTables() 
		reset_month_log()
        
		if(os.date("%B") == "January" )then
			table.insert(ipLogger.January, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "February" )then
			table.insert(ipLogger.February, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "March" )then
			table.insert(ipLogger.March, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "April" )then
			table.insert(ipLogger.April, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "May" )then
			table.insert(ipLogger.May, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "June" )then
			table.insert(ipLogger.June, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "July" )then
			table.insert(ipLogger.July, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "August" )then
			table.insert(ipLogger.August, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "September" )then
			table.insert(ipLogger.September, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "October" )then
			table.insert(ipLogger.October, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "November" )then
			table.insert(ipLogger.November, {Time,Date,Action,NN,ID,IP})
		elseif(os.date("%B") == "December" )then
			table.insert(ipLogger.December, {Time,Date,Action,NN,ID,IP})
		end
		saveTable()
		--
		
	end    
	// Save function
	function saveTable()
		file.CreateDir("iplogger")
		if(os.date("%B") == "January" )then
			file.Delete("iplogger/January.txt")
			file.Append( "iplogger/January.txt",  von.serialize(ipLogger.January) )
		elseif(os.date("%B") == "February" )then
			file.Delete("iplogger/February.txt")
			file.Append( "iplogger/February.txt", von.serialize(ipLogger.February) )
		elseif(os.date("%B") == "March" )then
			file.Delete("iplogger/March.txt")
			file.Append( "iplogger/March.txt", von.serialize(ipLogger.March) )
		elseif(os.date("%B") == "April" )then
			file.Delete("iplogger/April.txt")
			file.Append( "iplogger/April.txt", von.serialize(ipLogger.April) )
		elseif(os.date("%B") == "May" )then
			file.Delete("iplogger/May.txt")
			file.Append( "iplogger/May.txt", von.serialize(ipLogger.May) )
		elseif(os.date("%B") == "June" )then
			file.Delete("iplogger/June.txt")
			file.Append( "iplogger/June.txt", von.serialize(ipLogger.June) )
		elseif(os.date("%B") == "July" )then
			file.Delete("iplogger/July.txt")
			file.Append( "iplogger/July.txt", von.serialize(ipLogger.July) )
		elseif(os.date("%B") == "August" )then
			file.Delete("iplogger/August.txt")
			file.Append( "iplogger/August.txt", von.serialize(ipLogger.August) )
		elseif(os.date("%B") == "September" )then
			file.Delete("iplogger/September.txt")
			file.Append( "iplogger/September.txt", von.serialize(ipLogger.September) )
		elseif(os.date("%B") == "October" )then
			file.Delete("iplogger/October.txt")
			file.Append( "iplogger/October.txt", von.serialize(ipLogger.October) )
		elseif(os.date("%B") == "November" )then
			file.Delete("iplogger/November.txt")
			file.Append( "iplogger/November.txt", von.serialize(ipLogger.November) )
		elseif(os.date("%B") == "December" )then
			file.Delete("iplogger/December.txt")
			file.Append( "iplogger/December.txt", von.serialize(ipLogger.December) )
		end
		
	end

	// Load function
	local f,str
	function loadTables() 
		f = file.Open("iplogger/January.txt","r","DATA")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.January table = nil \n Skipping load \n ")
		else 
			ipLogger.January = von.deserialize(str)
		end
		f:Close()
		
		f = file.Open("February.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.February table = nil \n Skipping load \n ")
		else 
			ipLogger.February = von.deserialize(str)
		end
		f:Close()
		f = file.Open("March.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.March table = nil \n Skipping load \n ")
		else 
			ipLogger.March = von.deserialize(str)
		end
		f:Close()
		f = file.Open("April.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.April table = nil \n Skipping load \n ")
		else 
			ipLogger.April = von.deserialize(str)
		end
		f:Close()
		f = file.Open("May.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.May table = nil \n Skipping load \n ")
		else 
			ipLogger.May = von.deserialize(str)
		end
		f:Close()
		f = file.Open("June.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.June table = nil \n Skipping load \n ")
		else 
			ipLogger.June = von.deserialize(str)
		end
		f:Close()
		f = file.Open("July.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.July table = nil \n Skipping load \n ")
		else 
			ipLogger.July = von.deserialize(str)
		end
		f:Close()
		f = file.Open("August.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.August table = nil \n Skipping load \n ")
		else 
			ipLogger.August = von.deserialize(str)
		end
		f:Close()
		f = file.Open("September.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.September table = nil \n Skipping load \n ")
		else 
			ipLogger.September = von.deserialize(str)
		end
		f:Close()
		f = file.Open("October.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.November table = nil \n Skipping load \n ")
		else 
			ipLogger.November = von.deserialize(str)
		end
		f:Close()
		f = file.Open("November.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.November table = nil \n Skipping load \n ")
		else 
			ipLogger.November = von.deserialize(str)
		end
		f:Close()
		f = file.Open("December.txt","r","iplogger")
		if ( !f ) then return end
		str = f:Read( f:Size() )
		if (str == nil)then
			Msg("ipLogger.December table = nil \n Skipping load \n ")
		else 
			ipLogger.December = von.deserialize(str)
		end
		f:Close()
	end 
end

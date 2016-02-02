if(SERVER) then
	Msg("IpLogger: Networking Installed \n")
	util.AddNetworkString( "TodaysLog" ) 
	util.AddNetworkString( "Logs" ) 
	util.AddNetworkString( "Text" )

	
    local Date
    local Count	
--{	NETTODAYSLOGS	
	function NetTodaysLog(ply)	
		if(os.date("%B") == "January" )then
            Count = 0
			if(next (ipLogger.January) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.January) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
                net.Start( "Text" )
				net.WriteString(" There were ".. Count .." entries for today on "..os.date("%m-%d") .. "!")
				net.Send(ply)
			end
		elseif(os.date("%B") == "February" )then
            Count = 0
			if(next (ipLogger.February ) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else
				for _, line  in ipairs(ipLogger.February) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "March" )then
            Count = 0
			if(next (ipLogger.March ) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else
				for _, line  in ipairs(ipLogger.March) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "April" )then
            Count = 0
			if(ipLogger.next (ipLogger.April ) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)			
			else	
				for _, line  in ipairs(ipLogger.April) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "May" )then
            Count = 0
			if(next (ipLogger.May ) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.May) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "June" )then
            Count = 0
			if(next (ipLogger.June) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.June) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "July" )then
            Count = 0
			if(next (ipLogger.July) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.July) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "August" )then
            Count = 0
			if(next (ipLogger.August) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.August) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "September" )then
            Count = 0
			if(next (ipLogger.September) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.September) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "October" )then
            Count = 0
			if(next (ipLogger.October) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.October) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "November" )then
            Count = 0
			if(next (ipLogger.November) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.November) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		elseif(os.date("%B") == "December" )then
            Count = 0
			if(next (ipLogger.December ) == nil) then
				net.Start( "Text" )
				net.WriteString(" There is no logs for "..os.date("%m-%d") .. "!")
				net.Send(ply)
			else	
				for _, line  in ipairs(ipLogger.December) do
					net.Start( "TodaysLog" )
					if(line[2] == os.date("%m-%d"))then
                        Count = Count + 1
                        net.WriteString(tostring(Count))
						temp = {}
						temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
						net.WriteTable(temp)
						net.Send( ply ) -- send the message ONLY to the player that requested it
					end
				end
			end
		end
	end
	
	net.Receive( "TodaysLog", function( bits, ply )
		local x = ipLogger.CanAccess(ply)
		if (x == true) then -- change the check to whatever you're wanting to limit this info by
			NetTodaysLog( ply )
		end
	end)  
--}
--{	NETLOGS	
	function NetLogs(ply,dateM,dateD)	 
			if(dateM == "1" )then
                Count = 0
				Date = ("0"..dateM.."-"..dateD)
				if(next (ipLogger.January ) == nil) then
					net.Start( "Text" )
					net.WriteString("There is no logs for "..Date.."!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.January) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
				
			elseif(dateM == "2" )then
                Count = 0
				Date = ("0"..dateM.."-"..dateD)
				if(next (ipLogger.February ) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply) 
				else
					for _, line  in ipairs(ipLogger.February) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
			elseif(dateM == "3" )then
                Count = 0
				Date = ("0"..dateM.."-"..dateD)
				if(next (ipLogger.March ) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.March) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
				
			elseif(dateM == "4" )then
				Date = ("0"..dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.April ) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.April) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
				
			elseif(dateM == "5" )then
				Date = ("0"..dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.May ) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.May) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1

                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
			elseif(dateM == "6" )then
				Date = ("0"..dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.June) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.June) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
				
			elseif(dateM == "7" )then
				Date = ("0"..dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.July) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.July) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
				
			elseif(dateM == "8" )then
				Date = ("0"..dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.August) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.August) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1

                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
			elseif(dateM == "9" )then
				Date = ("0"..dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.September) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.September) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
				
			elseif(dateM == "10" )then
				Date = (dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.October) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)
				else
					for _, line  in ipairs(ipLogger.October) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
				
			elseif(dateM == "11" )then
				Date = (dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.November) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)				
				else
					for _, line  in ipairs(ipLogger.November) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1

                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
				end
			elseif(dateM == "12" )then
				Date = (dateM.."-"..dateD)
                Count = 0
				if(next (ipLogger.December ) == nil) then
					net.Start( "Text" )
					net.WriteString(" There is no logs for "..Date.. "!")
					net.Send(ply)				
				else
					for _, line  in ipairs(ipLogger.December) do
						if(line[2] == Date)then
							net.Start( "Logs" )
                            Count = Count + 1
                            net.WriteString(tostring(Count))
							temp = {}
							temp = {line[1],line[2],line[3],line[4],line[5],line[6]}
							net.WriteTable(temp)
							net.Send( ply ) -- send the message ONLY to the player that requested it
						end
					end
				end
                    net.Start( "Text" )
                    net.WriteString("Logs retrieved for " ..Date.. "!")
                    net.Send(ply)
            end	
	end
	net.Receive( "Logs", function( bits, ply )
		local x = ipLogger.CanAccess(ply)
		if (x == true) then -- change the check to whatever you're wanting to limit this info by
			local dateM = net.ReadString()
			local dateD = net.ReadString()
			NetLogs( ply, dateM, dateD)
		end
	end)
--}	
end

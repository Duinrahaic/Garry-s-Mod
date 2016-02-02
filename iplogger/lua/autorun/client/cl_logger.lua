if ( CLIENT ) then

	local dayV
	local monthV
	local currentLog = {}
	local Count
    local Size
    local selLine
--{ GUI
	function OpenIPLogger(ply)
        
		local x = ipLogger.CanAccess(ply)
		if x == nil then return end
		if base != nil then
			base:Remove()	-- Remove the menu and set the value to nil
			base = nil
            if About != nil then
                AboutPanel = nil
            end
		elseif ((x == true) and base == nil) then	
			//frame
			base = vgui.Create("DFrame")
			base:SetPos(ScrW()/4, ScrH()/6)
			base:SetSize(800,620)
			base:SetVisible(true)
			base:SetTitle("IpLogger v2.0 by Duinrahaic")
			base:SetDraggable(false)
			base:ShowCloseButton(false)
			base:SetVisible(true)
			base:MakePopup(true)
			base:SetMouseInputEnabled(true)
			base:SetKeyboardInputEnabled(true)
			
			infobox = vgui.Create("DPanel")
			infobox:SetParent(base)
			infobox:SetSize(790,20)
			infobox:SetPos(5,596)
			
			infoText = vgui.Create("DLabel")
			infoText:SetParent(infobox)
			infoText:SetPos( 5, 0 )
			infoText:SetWidth(400)
			infoText:SetDark( true )
			infoText:SetText( "Welcome to Duinrahaic's IPLogger!" )
			
			//Lists
			logged = vgui.Create("DListView");
			logged:SetParent(base)
			logged:SetMultiSelect(false)
			logged:SetPos( 10, 50 )
			logged:SetSize( 780, 540 )
			
			logged:AddColumn("Time"):SetFixedWidth( 75 )
			logged:AddColumn("Date"):SetFixedWidth( 50 )
			logged:AddColumn("Action"):SetFixedWidth( 50 )
			logged:AddColumn("Nickname"):SetFixedWidth( 200 )
			logged:AddColumn("SteamID"):SetFixedWidth( 200 )
			logged:AddColumn("IP"):SetFixedWidth( 205 )
			logged.OnRowSelected = function( panel, line )
                selLine = line
			end
			logged.OnRowRightClick = function ( btn )
                loggedOptions = DermaMenu() -- Creates the menu
                loggedOptions:AddOption("Get Line", function()
                        local actionTemp = ""
                        if(logged:GetLine(selLine):GetValue(3) == "CONN" )then
                            actionTemp = "connected"
                        else
                            actionTemp = "disconnected"
                        end                        
                        InfoPop:SetVisible( true )
                        InfoPop:MakePopup()
                        InfoPopText:SetValue("On " .. logged:GetLine(selLine):GetValue(2).." "..logged:GetLine(selLine):GetValue(1).." "..logged:GetLine(selLine):GetValue(4).." "..actionTemp.. " with ID of " ..logged:GetLine(selLine):GetValue(5).. " and IP of "..logged:GetLine(selLine):GetValue(6) .. " !\n")
                    end ) -- Add options to the menu
                loggedOptions:AddOption("Get Name", function() 
                        InfoPop:SetVisible( true )
                        InfoPop:MakePopup()
                        InfoPopText:SetValue(logged:GetLine(selLine):GetValue(4).."\n") 
                    end )
                loggedOptions:AddOption("Get SteamID", function() 
                        InfoPop:SetVisible( true )
                        InfoPop:MakePopup()
                        InfoPopText:SetValue(logged:GetLine(selLine):GetValue(5).."\n") 
                    end )
                loggedOptions:AddOption("Get IP", function() 
                        InfoPop:SetVisible( true )
                        InfoPop:MakePopup()
                        InfoPopText:SetValue(logged:GetLine(selLine):GetValue(6).."\n") 
                    end )
                loggedOptions:Open() -- Open the menu AFTER adding your options
            end
            
            InfoPop = vgui.Create( "DFrame" )
            InfoPop:SetParent(base)
            InfoPop:SetTitle("Copy and Paste!")
            InfoPop:SetPos( 500,250 )
            InfoPop:SetSize( 500, 50 )
            InfoPop:ShowCloseButton( true )
            InfoPop:SetVisible( false )
            InfoPop:SetDraggable(false)
            
             
            InfoPopText = vgui.Create( "DTextEntry", InfoPop )
            InfoPopText:SetPos( 20,25 )
            InfoPopText:SetTall( 20 )
            InfoPopText:SetWide( 450 )
            InfoPopText:SetEnterAllowed( false )
           
            
			//Month Drop down
			Month = vgui.Create( "DComboBox" )
			Month:SetParent(base)
            Month:SetText("Month")
			Month:SetPos( 50, 30 )
			Month:SetSize( 75, 20 )
			Month:AddChoice( "January" )
			Month:AddChoice( "February" )
			Month:AddChoice( "March" )
			Month:AddChoice( "April" )
			Month:AddChoice( "May" )
			Month:AddChoice( "June" )
			Month:AddChoice( "July" )
			Month:AddChoice( "August" )
			Month:AddChoice( "September" )
			Month:AddChoice( "October")
			Month:AddChoice( "November" )
			Month:AddChoice( "December")
			
			// Day Drop down 
			Day = vgui.Create( "DComboBox" )
			Day:SetParent(base)
			Day:SetPos( 124, 30 )
			Day:SetSize( 60, 20 )
            Day:SetText("Day")
			Month.OnSelect = function( panel, index, value, data )
				monthV = value
				if (value == "September") or (value == "April") or (value == "June") or (value == "November") then
					Day:Clear()
					for i=1,30 , 1 do
						Day:AddChoice(tostring(i))
					end
				elseif (value == "February") then
					Day:Clear()
					for i=1,29 , 1 do
						Day:AddChoice(tostring(i))
					end
				elseif (value == nil ) then
					Day:Clear()
					Month:SetValue("Month")
				else
					Day:Clear()
					for i=1,31 , 1 do
						Day:AddChoice(tostring(i))
					end
				end
			end
			Day.OnSelect = function( panel, index, value, data )
				dayV = value
			end
						
			
			// Todays List button
			Today = vgui.Create( "DButton" )
			Today:SetParent(base)
			Today:SetPos( 10, 30 )
			Today:SetText( "Today" )
			Today:SetSize( 40, 20 )
			Today.DoClick = function()
				logged:Clear()
				infoText:SetText("Searching for Today's logs!")
				net.Start( "TodaysLog" )
				net.SendToServer()
				currentLog = {}
			end
			Today:SetVisible(true)
            
			// Date Search button
			Search1 = vgui.Create( "DButton" )
			Search1:SetParent(base)
			Search1:SetPos( 185, 30 )
			Search1:SetText( "Search" )
			Search1:SetSize( 40, 20 )
			Search1.DoClick = function()
				if(monthV == nil and dayV == nil)then 
					logged:Clear()
					monthV = ""
					dayV = ""
				elseif (monthV == nil or monthV == "" )then 
					infoText:SetText("Please select a month!")
				elseif (dayV == nil or dayV == "") then
					dayV = ""
					infoText:SetText("Don't leave day blank!")
				else
					infoText:SetText("Searching "..monthV.." for logs during " .. convertMonthStringtoInt(monthV) .. "-" .. dayV.."!")
					logged:Clear()
					timer.Simple( .25, function() 
						net.Start( "Logs" )
						net.WriteString( convertMonthStringtoInt(monthV) )
						net.WriteString( dayV )
						net.SendToServer()
						Day:SetText("Day")
						Month:SetValue("Month")
						monthV = ""
						dayV = ""
						currentLog = {}
					end)
				end
			end
			
            // Date Search button
			Previous = vgui.Create( "DButton" )
			Previous:SetParent(base)
			Previous:SetPos( 225, 30 )
			Previous:SetText( "Reset" )
			Previous:SetSize( 40, 20 )
			Previous.DoClick = function()
                if( next(currentLog) == nil) then
                    infoText:SetText("Sorry, you have not loaded a log!")
                else
                    for _, line  in ipairs(currentLog) do
                        logged:Clear()
                        logged:AddLine( unpack(line) )
                    end
                    infoText:SetText("Returning back to previous log!")
                end
			end
            
            
            //NNID Entry
			NNEntry = vgui.Create("DTextEntry")
			NNEntry:SetParent(base)
			NNEntry:SetPos( 265, 30 )
			NNEntry:SetSize( 120, 20 )
			NNEntry:SetText( "NickName" )
			NNEntry.OnEnter = function( self )
				local value = tostring(self:GetValue())
				NNEntry:SetText("NickName")
				logged:Clear()
				Count = 0
				for _, line  in ipairs(currentLog) do
					if(line[4] == value)then
						Count = Count + 1
						logged:AddLine( unpack(line) )
					end
				end
				infoText:SetText("Found " .. Count .. " entries for Nickname : " .. value .. "!")
			end
            
			//SteamID Entry
			IDEntry = vgui.Create("DTextEntry")
			IDEntry:SetParent(base)
			IDEntry:SetPos( 465, 30 )
			IDEntry:SetSize( 120, 20 )
			IDEntry:SetText( "STEAM_" )
			IDEntry.OnEnter = function( self )
				local value = tostring(self:GetValue())
				IDEntry:SetText("STEAM_")
				logged:Clear()
				Count = 0
				for _, line  in ipairs(currentLog) do
					if(line[5] == value)then
						Count = Count + 1
						logged:AddLine( unpack(line) )
					end
				end
				infoText:SetText("Found " .. Count .. " entries for SteamID : " .. value .. "!")
			end

			IPEntry = vgui.Create("DTextEntry")
			IPEntry:SetParent(base)
			IPEntry:SetPos( 670, 30 )
			IPEntry:SetSize( 120, 20 )
			IPEntry:SetText( "000.000.0.0:0000" )
			IPEntry.OnEnter = function( self )
				local value = tostring(self:GetValue())
				IPEntry:SetText("000.000.0.0:0000")
				logged:Clear()
				Count = 0
				for _, line  in ipairs(currentLog) do
					if(line[6] == value)then
						Count = Count + 1
						logged:AddLine( unpack(line) )
					end
				end
				infoText:SetText("Found " .. Count .. " entries for IP : " .. value .. "!")
            end
			
			// About button
			About = vgui.Create("DButton")
			About:SetParent(base)
			About:SetPos(741,3)
			About:SetText("About")
			About:SetSize(34,20)
			About.DoClick = function()
				if(AboutPanel == nil)then
					
					AboutPanel = vgui.Create("DPanel")
					AboutPanel:SetParent(base)
					AboutPanel:SetSize(200,50)
					AboutPanel:SetPos(480,70)
					AboutPanel:SetText(ipLogger.About)
					
					AboutTxt = vgui.Create( "DLabel")
					AboutTxt:SetParent(base)
					AboutTxt:SetSize(200,100)
					AboutTxt:SetPos(495,50)
					AboutTxt:SetDark(true)
					AboutTxt:SetText(ipLogger.About)
				else
					AboutPanel:Remove()
					AboutTxt:Remove()
					AboutPanel = nil
				end
			end
			
			// Close button
			close = vgui.Create("DButton")
			close:SetParent(base)
			close:SetPos(775,3)
			close:SetText("X")
			close:SetSize(20,20)
			close.DoClick = function()
				base:Remove()
				base = nil
                if AboutPanel != nil then
                    AboutPanel:Remove()
                    AboutPanel = nil
                end
			end
		end        
	end
	concommand.Add( ipLogger.Config.Comm, OpenIPLogger )
--}
	// net receive for TodaysLog
	net.Receive( "TodaysLog", function( bits )
        Count = net.ReadString()
		temp = net.ReadTable()
		if(base == nil )then return end
		logged:AddLine( unpack(temp) )
		table.insert(currentLog, {temp[1],temp[2],temp[3],temp[4],temp[5],temp[6]})
	end )
	
	// net receive for Logs
	net.Receive( "Logs", function( bits )
        Count = net.ReadString()
		temp = net.ReadTable()
		if(base == nil )then return end
		logged:AddLine( unpack(temp) )
		table.insert(currentLog, {temp[1],temp[2],temp[3],temp[4],temp[5],temp[6]})
	end )
	
	// net receive for Text
	net.Receive( "Text", function( bits )
		temp = net.ReadString()
		if(base == nil )then return end
		infoText:SetText( temp )
	end )
end

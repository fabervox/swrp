GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Memo = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}
GUIEditor_Radio = {}
GUIEditor_Image = {}

localPlayer = getLocalPlayer ( )

function showHouseBuyMenu( price, number )
if menushow == nil or menushow == 0 then
	menushow = 1
	showCursor ( true )
	GUIEditor_Window[12] = guiCreateWindow(480,429,317,211,"This house is for sale",false)
	GUIEditor_Label[10] = guiCreateLabel(15,34,300,300,"Price: "..tostring(price).."$",false,GUIEditor_Window[12])
	guiLabelSetColor(GUIEditor_Label[10],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[10],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[10],"left",false)
	guiSetFont(GUIEditor_Label[10],"sa-header")
	GUIEditor_Button[37] = guiCreateButton(85,104,144,49,"Buy",false,GUIEditor_Window[12])
	guiSetFont(GUIEditor_Button[37],"sa-header")
	GUIEditor_Button[38] = guiCreateButton(103,164,105,35,"Close",false,GUIEditor_Window[12])
	guiSetVisible ( GUIEditor_Window[12], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[37],
		function ()
		    if(getPlayerMoney(localPlayer) < tonumber(price)) then
		    	outputChatBox("Ошибка: У вас недостаточно денег", localPlayer, 153,51,0)
			else
   				guiSetVisible ( GUIEditor_Window[12], false )
   				triggerServerEvent ( "acceptBuyHouse", getLocalPlayer(), number, price)
   				menushow = 0
   				showCursor ( false )
			end
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[38],
		function ()
   			guiSetVisible ( GUIEditor_Window[12], false )
   			showCursor ( false )
   			menushow = 0
		end
    ,false)
end
end

addEvent( "showBuyHouse", true )
addEventHandler( "showBuyHouse", getRootElement(), showHouseBuyMenu )

local goMarker = {}

function showHouseMainMenu( owner, price, rentprice, number, lock, rent )
if menushow == nil or menushow == 0 then
	menushow = 1
	local localPlayer = getLocalPlayer ( )
	GUIEditor_Window[13] = guiCreateWindow(587,358,290,240,"House",false)
	GUIEditor_Button[39] = guiCreateButton(106,120,83,26,"Enter",false,GUIEditor_Window[13])
	GUIEditor_Button[40] = guiCreateButton(107,189,85,24,"Close",false,GUIEditor_Window[13])
	GUIEditor_Button[41] = guiCreateButton(107,155,83,26,"Rent",false,GUIEditor_Window[13])
	GUIEditor_Label[13] = guiCreateLabel(47,42,48,16,"Owner:",false,GUIEditor_Window[13])
	guiLabelSetColor(GUIEditor_Label[13],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[13],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[13],"left",false)
	guiSetFont(GUIEditor_Label[13],"clear-normal")
	GUIEditor_Label[14] = guiCreateLabel(98,42,172,18,owner,false,GUIEditor_Window[13])
	guiLabelSetColor(GUIEditor_Label[14],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[14],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[14],"left",false)
	guiSetFont(GUIEditor_Label[14],"clear-normal")
	if(getElementData ( localPlayer, "facttype" ) == 2) or (tonumber(getElementData ( localPlayer, "rob")) == 1) then
		GUIEditor_Button[42] = guiCreateButton(202,119,63,94,"Rob",false,GUIEditor_Window[13])
	end
	if(getElementData ( localPlayer, "facttype" ) == 1) then
		GUIEditor_Button[43] = guiCreateButton(29,119,63,94,"Break",false,GUIEditor_Window[13])
	end
	GUIEditor_Label[15] = guiCreateLabel(47,65,69,17,"Rent price:",false,GUIEditor_Window[13])
	guiLabelSetColor(GUIEditor_Label[15],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[15],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[15],"left",false)
	guiSetFont(GUIEditor_Label[15],"clear-normal")
	GUIEditor_Label[16] = guiCreateLabel(121,65,26,17,""..tostring(rentprice).."$",false,GUIEditor_Window[13])
	guiLabelSetColor(GUIEditor_Label[16],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[16],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[16],"left",false)
	guiSetFont(GUIEditor_Label[16],"clear-normal")
	GUIEditor_Label[17] = guiCreateLabel(47,86,37,17,"Price:",false,GUIEditor_Window[13])
	guiLabelSetColor(GUIEditor_Label[17],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[18],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[18],"left",false)
	guiSetFont(GUIEditor_Label[17],"clear-normal")
	GUIEditor_Label[18] = guiCreateLabel(84,86,64,17,""..tostring(price).."$",false,GUIEditor_Window[13])
	guiLabelSetColor(GUIEditor_Label[18],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[19],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[19],"left",false)
	guiSetFont(GUIEditor_Label[19],"clear-normal")
	guiSetVisible ( GUIEditor_Window[13], true )
	toggleAllControls ( localPlayer, false )
	addEventHandler("onClientGUIClick", GUIEditor_Button[39],
		function ()
		    if(tonumber(lock) == 0) then
                triggerServerEvent ( "acceptEnterHouse", getLocalPlayer(), number)
                guiSetVisible ( GUIEditor_Window[13], false )
                menushow = 0
                showCursor ( false )
                toggleAllControls ( localPlayer, true )
			else
                outputChatBox("Ошибка: Дом закрыт", 102, 0, 0)
			end
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[41],
		function ()
			if(tonumber(rent) == 1) then
				if owner ~= getElementData ( localPlayer, "playerid" ) then
				    if(getPlayerMoney(localPlayer) > tonumber(rentprice)) then
				    	triggerServerEvent ( "acceptRentHouse", getLocalPlayer(), number, rentprice)
					else
						outputChatBox("Информация: У вас не хватает денег", 204,102,51)
					end
				else
				    outputChatBox("Ошибка: Вы не можете снять комнату сами у себя", 153,51,0)
				end
			else
			    outputChatBox("Информация: Владелец не сдает комнаты", 204,102,51)
			end
			guiSetVisible ( GUIEditor_Window[13], false )
			menushow = 0
			showCursor ( false )
			toggleAllControls ( localPlayer, true )
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[40],
		function ()
   			guiSetVisible ( GUIEditor_Window[13], false )
   			menushow = 0
   			toggleAllControls ( localPlayer, true )
   			showCursor ( false )
		end
    ,false)
    local xp, xy, xz = getElementPosition ( localPlayer )
    addEventHandler("onClientGUIClick", GUIEditor_Button[42],
		function ()
		local robOK = math.random(0,10)
		local localPlayerlucky = getElementData(localPlayer, "luck")
			if(tonumber(getElementData(localPlayer, "robcomplete")) == 0) or (getElementData(localPlayer, "robcomplete") == nil) then
				if(robOK < 8) then
				    triggerServerEvent ( "acceptEnterHouse", getLocalPlayer(), number)
				    local playervision = tonumber(getElementData(localPlayer, "vision"))
					if(playervision < 7) then
			    	    findmoneys = math.random(0,18)
					end
			    	if((playervision > 6) and (playervision < 10)) then
			    		findmoneys = math.random(0,20)
			    	end
			    	if((playervision > 9) and (playervision < 20)) then
			    		findmoneys = math.random(0,35)
			    	end
			    	if(playervision > 19) then
						findmoneys = math.random(0,60)
			    	end
			    	for id, factionpl in ipairs ( getElementsByType ( "player" ) ) do
				        if ( getElementData ( factionpl, "duty" ) == 1 ) then
							if ( tonumber(getElementData ( localPlayer, "facttype" )) == 1 ) then
       							goMarker[id] = createMarker ( xp, xy, xz, "checkpoint", 2)
        						setElementVisibleTo ( goMarker, factionpl, true )
        						outputChatBox ("Подсказка: чтобы выключить чекпоинт, введите /gostop", factionpl, 102,204,153 )
        						addCommandHandler ( "gostop",
									function ()
									    clearElementVisibleTo ( goMarker )
                                    	destroyElement ( goMarker )
                                    	removeCommandHandler ( gostop )
									end
								)
	                      	end
						end
					end
               		local text = "Внимание всем! Кто то проник в помещение, направляйтесь туда"
     				exports.sweetyRP:SendCopMessage(text)
					setElementData ( localPlayer, "doRob", 1 )
					setElementData ( localPlayer, "doRobExit", 1 )
					showCursor ( false )
					guiSetVisible ( GUIEditor_Window[13], false )
					menushow = 0
					toggleAllControls ( localPlayer, true )
			    	if(findmoneys > 16) then
			    		outputChatBox("Информация: Взлом удался! Теперь вам надо пробыть в доме 30 секунд", 0,153,51)
			    		setTimer ( robTimeComplete, 30000, 1 )
			    		return true
  					end
			    	if(findmoneys > 15) then
			    		outputChatBox("Информация: Взлом удался! Теперь вам надо пробыть в доме 1 минуту", 0,153,51)
			    		setTimer ( robTimeComplete, 60000, 1 )
			    		return true
                  	end
			    	if(findmoneys > 14) then
			    	   	outputChatBox("Информация: Взлом удался! Теперь вам надо пробыть в доме 1 минуту и 10 секунд", 0,153,51)
			    	   	setTimer ( robTimeComplete, 70000, 1 )
			    	   	return true
                    end
					if(findmoneys > 10) then
			    		outputChatBox("Информация: Взлом удался! Теперь вам надо пробыть в доме 1 минуту и 20 секунд", 0,153,51)
			    		setTimer ( robTimeComplete, 80000, 1 )
			    		return true
			    	else
			    	    outputChatBox("Информация: Взлом удался! Теперь вам надо пробыть в доме 1 минуту и 30 секунд", 0,153,51)
			    	    setTimer ( robTimeComplete, 90000, 1)
 			    		return true
					end
				else
				    outputChatBox("Информация: Взлом не удался", localPlayer, 204,102,51)
				    guiSetVisible ( GUIEditor_Window[13], false )
				    setTimer ( robTimeReset, 1800000, 1 )
				    setElementData ( localPlayer, "robcomplete", 1)
				end
				showCursor ( false )
				menushow = 0
				toggleAllControls ( localPlayer, true )
			else
				outputChatBox("Ошибка: Вы уже делали кражу в последние 30 минут!", localPlayer, 102, 0, 0)
			end
			showCursor ( false )
			guiSetVisible ( GUIEditor_Window[13], false )
			menushow = 0
			toggleAllControls ( localPlayer, true )
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[43],
		function ()
		local robOK = math.random(0,10)
		local localPlayerlucky = getElementData(localPlayer, "luck")
   			if ( getElementData ( localPlayer, "duty" ) == 1 ) then
				outputChatBox("Информация: Вы сломали дверь и ворвались в дом!", localPlayer, 204,102,51)
                triggerServerEvent ( "acceptEnterHouse", getLocalPlayer(), number)
                local text = "Внимание всем! Кто то проник в помещение, направляйтесь туда"
				exports.sweetyRP:SendCopMessage(text)
				guiSetVisible ( GUIEditor_Window[13], false )
			else
				outputChatBox("Ошибка: Вы не на дежурстве!", localPlayer, 102, 0, 0)
				guiSetVisible ( GUIEditor_Window[13], false )
			end
			showCursor ( false )
        	menushow = 0
            toggleAllControls ( localPlayer, true )
		end
    ,false)
end
end

addEvent( "showHouseMenu", true )
addEventHandler( "showHouseMenu", getRootElement(), showHouseMainMenu )

function robTimeReset (  )
	local player = getLocalPlayer ( )
	setElementData ( player, "robcomplete", 0)
	outputChatBox("Информация: 30 минут прошло, вы можете снова совершить кражу", 0,153,51)
end

function robTimeComplete ( )
	givePlayerMoney ( math.random(1,10000) )
	outputChatBox("Информация: Кража удалась! Теперь сматывайтесь отсюда побыстрее", 0,153,51)
	outputChatBox("Информация: Следующую кражу вы сможете совершить через 30 минут", 0,153,51)
	setElementData ( localPlayer, "robcomplete", 1)
	setElementData ( localPlayer, "doRob", 0)
	setTimer ( robTimeReset, 1800000, 1 )
end
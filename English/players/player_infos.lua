GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}

localPlayer = getLocalPlayer ()

guishow = 0
money = 0

function showPlayerInfosC ( playercar, playerhouse, playerbiz, housex, housey, housez, factionmoney )
	if guishow == 0 then
		guishow = 1
		showCursor ( true )
		GUIEditor_Window[1] = guiCreateWindow(0.3306,0.1978,0.3236,0.6167,"",true)
		GUIEditor_Label[1] = guiCreateLabel(30,37,410,22,"___________________________Main___________________________",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[1],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
		GUIEditor_Label[2] = guiCreateLabel(30,63,179,18,"Name: "..getPlayerName ( localPlayer ).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[2],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[2],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[2],"left",false)
		GUIEditor_Label[3] = guiCreateLabel(30,95,52,18,"Level: "..tostring(getElementData ( localPlayer, "rplvl" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[3],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[3],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[3],"left",false)
		GUIEditor_Label[4] = guiCreateLabel(85,95,52,18,"ID: "..tostring(getElementData ( localPlayer, "playerid" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[4],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[4],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[4],"left",false)
		GUIEditor_Label[5] = guiCreateLabel(197,63,80,17,"Phone: "..tostring(getElementData ( localPlayer, "phone" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[5],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[5],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[5],"left",false)
		GUIEditor_Label[6] = guiCreateLabel(135,96,117,16,"Phone money: "..tostring(getElementData ( localPlayer, "pmoney" )).."$",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[6],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[6],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[6],"left",false)
		GUIEditor_Label[7] = guiCreateLabel(30,163,410,23,"___________________________Property___________________________",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[7],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[7],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[7],"left",false)
		GUIEditor_Label[8] = guiCreateLabel(260,96,141,16,"Bank money: "..tostring(getElementData ( localPlayer, "bmoney" )).."$",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[8],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[8],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[8],"left",false)
		if playercar then
			GUIEditor_Label[9] = guiCreateLabel(32,188,71,17,"Vehicle: Yes",false,GUIEditor_Window[1])
			GUIEditor_Button[1] = guiCreateButton(111,188,45,18,"Point",false,GUIEditor_Window[1])
		else
			GUIEditor_Label[9] = guiCreateLabel(32,188,71,17,"Vehicle: No",false,GUIEditor_Window[1])
		end
		guiLabelSetColor(GUIEditor_Label[9],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[9],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[9],"left",false)
		GUIEditor_Label[10] = guiCreateLabel(32,227,71,17,"Buisnes: No",false,GUIEditor_Window[1])
		if playerbiz then
			GUIEditor_Label[10] = guiCreateLabel(32,227,71,17,"Buisnes: Yes",false,GUIEditor_Window[1])
			GUIEditor_Button[2] = guiCreateButton(111,228,45,18,"Point",false,GUIEditor_Window[1])
		else
			GUIEditor_Label[10] = guiCreateLabel(32,227,71,17,"Buisnes: No",false,GUIEditor_Window[1])
		end
		guiLabelSetColor(GUIEditor_Label[10],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[10],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[10],"left",false)
		if playerhouse ~= 0 then
			GUIEditor_Label[11] = guiCreateLabel(265,188,63,17,"House: Yes",false,GUIEditor_Window[1])
			guiLabelSetColor(GUIEditor_Label[11],255,255,255)
			guiLabelSetVerticalAlign(GUIEditor_Label[11],"top")
			guiLabelSetHorizontalAlign(GUIEditor_Label[11],"left",false)
			GUIEditor_Button[3] = guiCreateButton(337,188,45,18,"Point",false,GUIEditor_Window[1])
		else
			GUIEditor_Label[11] = guiCreateLabel(265,188,63,17,"House: No",false,GUIEditor_Window[1])
			guiLabelSetColor(GUIEditor_Label[11],255,255,255)
			guiLabelSetVerticalAlign(GUIEditor_Label[11],"top")
			guiLabelSetHorizontalAlign(GUIEditor_Label[11],"left",false)
		end
		if getElementData ( localPlayer, "work" ) == 1 then
			GUIEditor_Label[12] = guiCreateLabel(137,126,84,14,"Job: Taxi",false,GUIEditor_Window[1])
			guiLabelSetColor(GUIEditor_Label[12],255,255,255)
			guiLabelSetVerticalAlign(GUIEditor_Label[12],"top")
			guiLabelSetHorizontalAlign(GUIEditor_Label[12],"left",false)
			GUIEditor_Button[4] = guiCreateButton(224,126,45,18,"Leave",false,GUIEditor_Window[1])
		elseif getElementData ( localPlayer, "work" ) == 2 then
			GUIEditor_Label[12] = guiCreateLabel(137,126,84,14,"Job: Mechanic",false,GUIEditor_Window[1])
			guiLabelSetColor(GUIEditor_Label[12],255,255,255)
			guiLabelSetVerticalAlign(GUIEditor_Label[12],"top")
			guiLabelSetHorizontalAlign(GUIEditor_Label[12],"left",false)
			GUIEditor_Button[4] = guiCreateButton(224,126,45,18,"Leave",false,GUIEditor_Window[1])
		elseif getElementData ( localPlayer, "work" ) == 3 then
			GUIEditor_Label[12] = guiCreateLabel(137,126,84,14,"Job: Sweeper",false,GUIEditor_Window[1])
			guiLabelSetColor(GUIEditor_Label[12],255,255,255)
			guiLabelSetVerticalAlign(GUIEditor_Label[12],"top")
			guiLabelSetHorizontalAlign(GUIEditor_Label[12],"left",false)
			GUIEditor_Button[4] = guiCreateButton(224,126,45,18,"Leave",false,GUIEditor_Window[1])
		elseif getElementData ( localPlayer, "work" ) == 4 then
			GUIEditor_Label[12] = guiCreateLabel(137,126,84,14,"Job: Bus driver",false,GUIEditor_Window[1])
			guiLabelSetColor(GUIEditor_Label[12],255,255,255)
			guiLabelSetVerticalAlign(GUIEditor_Label[12],"top")
			guiLabelSetHorizontalAlign(GUIEditor_Label[12],"left",false)
			GUIEditor_Button[4] = guiCreateButton(224,126,45,18,"Leave",false,GUIEditor_Window[1])
		elseif getElementData ( localPlayer, "work" ) == 5 then
			GUIEditor_Label[12] = guiCreateLabel(137,126,84,14,"Job: Trucker",false,GUIEditor_Window[1])
			guiLabelSetColor(GUIEditor_Label[12],255,255,255)
			guiLabelSetVerticalAlign(GUIEditor_Label[12],"top")
			guiLabelSetHorizontalAlign(GUIEditor_Label[12],"left",false)
			GUIEditor_Button[4] = guiCreateButton(224,126,45,18,"Leave",false,GUIEditor_Window[1])
		end
		GUIEditor_Label[13] = guiCreateLabel(29,123,70,16,"XP: "..tostring(getElementData ( localPlayer, "weapmat" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[13],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[13],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[13],"left",false)
		GUIEditor_Label[14] = guiCreateLabel(30,392,410,23,"___________________________Other___________________________",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[14],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[14],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[14],"left",false)
		GUIEditor_Button[5] = guiCreateButton(33,416,153,48,"Change e-mail",false,GUIEditor_Window[1])
		GUIEditor_Button[6] = guiCreateButton(281,416,153,48,"Change password",false,GUIEditor_Window[1])
		GUIEditor_Button[7] = guiCreateButton(166,493,122,43,"Exit",false,GUIEditor_Window[1])
		guiSetFont(GUIEditor_Button[7],"default-bold-small")
		GUIEditor_Label[15] = guiCreateLabel(30,469,410,23,"___________________________________________________________",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[15],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[15],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[15],"left",false)
		GUIEditor_Label[16] = guiCreateLabel(30,252,410,23,"___________________________Faction___________________________",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[16],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[16],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[16],"left",false)
		GUIEditor_Label[17] = guiCreateLabel(30,277,148,18,"Name: "..tostring(getElementData ( localPlayer, "faction" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[17],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[17],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[17],"left",false)
		GUIEditor_Label[18] = guiCreateLabel(169,277,124,19,"Rank: "..tostring(getElementData ( localPlayer, "rank" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[18],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[18],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[18],"left",false)
		GUIEditor_Label[19] = guiCreateLabel(300,278,138,15,"Faction money: "..tostring(factionmoney).."$",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[19],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[19],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[19],"left",false)
		GUIEditor_Button[8] = guiCreateButton(299,300,51,23,"Deposit",false,GUIEditor_Window[1])
		GUIEditor_Button[9] = guiCreateButton(366,300,61,23,"Withdraw",false,GUIEditor_Window[1])
--		GUIEditor_Label[20] = guiCreateLabel(265,224,79,18,"Rent car: Yes",false,GUIEditor_Window[1])
--		guiLabelSetColor(GUIEditor_Label[20],255,255,255)
--		guiLabelSetVerticalAlign(GUIEditor_Label[20],"top")
--		guiLabelSetHorizontalAlign(GUIEditor_Label[20],"left",false)
--		GUIEditor_Button[10] = guiCreateButton(347,223,45,18,"Point",false,GUIEditor_Window[1])
		GUIEditor_Label[21] = guiCreateLabel(287,63,68,16,"Crimes: "..tostring(getElementData ( localPlayer, "crimes" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[21],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[21],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[21],"left",false)
		GUIEditor_Label[22] = guiCreateLabel(30,320,410,23,"___________________________Character___________________________",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[22],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[22],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[22],"left",false)
		GUIEditor_Label[23] = guiCreateLabel(36,346,59,16,"Lucky: "..tostring(getElementData ( localPlayer, "luck" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[23],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[23],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[23],"left",false)
		GUIEditor_Label[24] = guiCreateLabel(104,346,77,18,"Visionary: "..tostring(getElementData ( localPlayer, "vision" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[24],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[24],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[24],"left",false)
		GUIEditor_Label[25] = guiCreateLabel(192,346,77,18,"Intelekt: "..tostring(getElementData ( localPlayer, "intel" )).."",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[25],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[25],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[25],"left",false)
		GUIEditor_Label[26] = guiCreateLabel(271,346,77,18,"Polityretury: 1",false,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[26],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[26],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[26],"left",false)
		if playercar then
	    	addEventHandler("onClientGUIClick", GUIEditor_Button[1],
				function ()
					guiSetVisible ( GUIEditor_Window[1], false ) 
					guishow = 0
					showCursor ( false )
					local xcar, ycar, zcar = getElementPosition( playercar )
					playercarmarker = createMarker ( xcar, ycar, zcar, "checkpoint", 10, 204,51,0 )
					playercarblip = createBlipAttachedTo ( playercarmarker, 51 )
					outputChatBox ("Информация: Ваша машина отмечена на карте", 0,153,51 )
					addEventHandler ( "onClientMarkerHit", getRootElement(), MarkerHit )
					attachElements ( playercarmarker, playercar )
				end
	    	,false)
		end
		if playerhouse ~= 0 then
	    	addEventHandler("onClientGUIClick", GUIEditor_Button[3],
				function ()
					guiSetVisible ( GUIEditor_Window[1], false ) 
					guishow = 0
					showCursor ( false )
					playerhousemarker = createMarker ( housex, housey, housez, "checkpoint", 10, 204,51,0 )
					playerhouseblip = createBlipAttachedTo ( playercarmarker, 31 )
					outputChatBox ("Информация: Ваш дом отмечен на карте", 0,153,51 )
					addEventHandler ( "onClientMarkerHit", getRootElement(), MarkerHit )
				end
	    	,false)
		end
		if playerbiz then
	    	addEventHandler("onClientGUIClick", GUIEditor_Button[2],
				function ()
					guiSetVisible ( GUIEditor_Window[1], false ) 
					guishow = 0
					showCursor ( false )
					local xcar, ycar, zcar = getElementPosition( playerbiz )
					playerbizmarker = createMarker ( xcar, ycar, zcar, "checkpoint", 10, 204,51,0 )
					playerbizblip = createBlipAttachedTo ( playercarmarker, 32 )
					outputChatBox ("Информация: Ваш бизнесс отмечен на карте", 0,153,51 )
					addEventHandler ( "onClientMarkerHit", getRootElement(), MarkerHit )
				end
	    	,false)
		end
		addEventHandler("onClientGUIClick", GUIEditor_Button[4],
				function ()
					if getElementData ( localPlayer, "work" ) > 0 then
						outputChatBox ("Информация: Вы уволились с работы", 0,153,51 )
						setElementData ( localPlayer, "work", 0 )
					else
                		outputChatBox ("Ошибка: эта функция в разработке", 102, 0, 0)
                	end
				end
	    ,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[5],
				function ()
					outputChatBox ("Ошибка: эта функция в разработке", 102, 0, 0)
				end
	    ,false)
	    addEventHandler("onClientGUIClick", GUIEditor_Button[6],
				function ()
                	outputChatBox ("Ошибка: эта функция в разработке", 102, 0, 0)
				end
	    ,false)
	    addEventHandler("onClientGUIClick", GUIEditor_Button[7],
				function ()
					guiSetVisible ( GUIEditor_Window[1], false ) 
					guishow = 0
					showCursor ( false )
				end
	    ,false)
	    addEventHandler("onClientGUIClick", GUIEditor_Button[8],
				function ()
					if getElementData ( localPlayer, "faction" ) > 0 then
						showFactionMoney ( 2, factionmoney )
					else
						outputChatBox ("Ошибка: вы не состоите во фракции", 102, 0, 0)
					end
				end
	    ,false)
	    addEventHandler("onClientGUIClick", GUIEditor_Button[9],
				function ()
                	if getElementData ( localPlayer, "faction" ) > 0 then
                		if getElementData ( localPlayer, "rank" ) > 3 then
							showFactionMoney ( 1, factionmoney )
						else
							outputChatBox ("Ошибка: вы не можете пользоваться этой функцией", 102, 0, 0)
						end
					else
						outputChatBox ("Ошибка: вы не состоите во фракции", 102, 0, 0)
					end
				end
	    ,false)
	    
	end
end

addEvent( "showPlayerInfos", true )
addEventHandler( "showPlayerInfos", getRootElement(), showPlayerInfosC )

function MarkerHit ( hitPlayer, matchingDimension )
	if source == playercarmarker then
		destroyElement ( playercarmarker )
		destroyElement ( playercarblip )
	end
	if source == playerhousemarker then
		destroyElement ( playerhousemarker )
		destroyElement ( playerhouseblip )
	end
	if source == playerbizmarker then
		destroyElement ( playerbizmarker )
		destroyElement ( playerbizblip )
	end
end

function showFactionMoney ( type, factionmoney )
	if money == 0 then
		outputChatBox("Информация: Введите сумму", 0,153,51)
		money = 1 
		GUIEditor_Window[2] = guiCreateWindow(0.4854,0.3922,0.0924,0.1544,"How many?",true)
		GUIEditor_Edit[1] = guiCreateEdit(30,41,74,22,"0",false,GUIEditor_Window[2])
		GUIEditor_Button[10] = guiCreateButton(27,83,79,33,"Ok!",false,GUIEditor_Window[2])
		guiSetVisible ( GUIEditor_Window[2], true )  
		addEventHandler("onClientGUIClick", GUIEditor_Button[10],
				function ()
					endmoney = tonumber(guiGetText ( GUIEditor_Edit[1] ))
					if type == 1 then
		            	if endmoney < factionmoney then
							triggerServerEvent ( "changeFactionMoneyC", getLocalPlayer(), factionmoney-endmoney )	
							money = 0
							guiSetText ( GUIEditor_Label[19], "Faction money: "..tostring(factionmoney - endmoney).."$" )
							givePlayerMoney ( endmoney )
							outputChatBox ("Информация: Вы сняли со счета фракции "..tostring(endmoney).."$", 0,153,51 )
							guiSetVisible ( GUIEditor_Window[2], false )  
						else
							outputChatBox ("Ошибка: на счете фракции нету таких денег", 102, 0, 0)
						end 
					else
		        		if endmoney < getPlayerMoney ( localPlayer ) then
		        			givePlayerMoney ( endmoney )
		        			guiSetText ( GUIEditor_Label[19], "Faction money: "..tostring(factionmoney + endmoney).."$" )
		        			triggerServerEvent ( "changeFactionMoneyC", getLocalPlayer(), factionmoney+endmoney )
		        			outputChatBox ("Информация: Вы положили на счет фракции "..tostring(endmoney).."$", 0,153,51 )
							money = 0	 	
							guiSetVisible ( GUIEditor_Window[2], false )  
		        		else
		        			outputChatBox ("Ошибка: у вас нету столько денег", 102, 0, 0)	
		        		end
					end
				end
		,false)
	end
end
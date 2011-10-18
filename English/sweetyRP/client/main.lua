GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Memo = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}
GUIEditor_Radio = {}
GUIEditor_Image = {}

GUIEditor_Progress = {}

GUIEditor_Checkbox = {}


localPlayer = getLocalPlayer ( )

function showPlayerMainGUI ()

GUIEditor_Label[20] = guiCreateLabel(7,849,500,41,"Sweetie Role Play",false)
guiLabelSetColor(GUIEditor_Label[20],0,0,0)
guiLabelSetVerticalAlign(GUIEditor_Label[20],"top")
guiLabelSetHorizontalAlign(GUIEditor_Label[20],"left",false)
guiSetFont(GUIEditor_Label[20],"sa-header")



guiSetVisible ( GUIEditor_Label[20], true )

bindKey ( "z", "both", ShowMousePlayer ) -- bind the player's fire down and up control

end

addEvent( "showMainGUI", true )
addEventHandler( "showMainGUI", getRootElement(), showPlayerMainGUI )

function ShowMousePlayer ( player, key )
	if isCursorShowing() then
	showCursor( false )
	else
	showCursor( true )
	end
end

function playerToPoint( localPlayer, radius, x, y, z )
    if isElement( localPlayer ) and radius and x and y and z then
        return getDistanceBetweenPoints3D( x, y, z, getElementPosition( localPlayer ) ) <= radius
    end
    return false
end

function showEquipMenu ()
	GUIEditor_Window[8] = guiCreateWindow(443,210,330,507,"Select weapon",false)
	GUIEditor_Image[3] = guiCreateStaticImage(21,36,77,73,"icons/colt45.png",false,GUIEditor_Window[8])
	GUIEditor_Image[4] = guiCreateStaticImage(126,35,78,74,"icons/silenced.png",false,GUIEditor_Window[8])
	GUIEditor_Image[5] = guiCreateStaticImage(227,34,82,74,"icons/deserteagle.png",false,GUIEditor_Window[8])
	GUIEditor_Image[6] = guiCreateStaticImage(21,144,79,70,"icons/mp5.png",false,GUIEditor_Window[8])
	GUIEditor_Image[7] = guiCreateStaticImage(129,139,77,74,"icons/cuntgun.png",false,GUIEditor_Window[8])
	GUIEditor_Image[8] = guiCreateStaticImage(230,142,79,71,"icons/spaz.png",false,GUIEditor_Window[8])
	GUIEditor_Image[9] = guiCreateStaticImage(19,242,83,71,"icons/sniper.png",false,GUIEditor_Window[8])
	GUIEditor_Image[10] = guiCreateStaticImage(131,244,76,68,"icons/parachute.png",false,GUIEditor_Window[8])
	GUIEditor_Image[11] = guiCreateStaticImage(229,243,79,72,"icons/heatrpg.png",false,GUIEditor_Window[8])
	GUIEditor_Image[12] = guiCreateStaticImage(21,341,84,67,"icons/gas.png",false,GUIEditor_Window[8])
	GUIEditor_Image[13] = guiCreateStaticImage(229,339,84,69,"icons/grenade.png",false,GUIEditor_Window[8])
	GUIEditor_Image[14] = guiCreateStaticImage(130,338,79,70,"icons/camera.png",false,GUIEditor_Window[8])
	GUIEditor_Button[12] = guiCreateButton(19,221,81,16,"Take",false,GUIEditor_Window[8]) -- mp5
	GUIEditor_Button[13] = guiCreateButton(229,221,81,16,"Take",false,GUIEditor_Window[8]) -- spaz
	GUIEditor_Button[14] = guiCreateButton(127,221,81,16,"Take",false,GUIEditor_Window[8]) -- cuntgun
	GUIEditor_Button[15] = guiCreateButton(19,318,81,16,"Take",false,GUIEditor_Window[8]) -- sniper
	GUIEditor_Button[16] = guiCreateButton(18,119,81,16,"Take",false,GUIEditor_Window[8]) -- colt45
	GUIEditor_Button[17] = guiCreateButton(19,418,81,16,"Take",false,GUIEditor_Window[8]) -- gas
	GUIEditor_Button[18] = guiCreateButton(127,119,81,16,"Take",false,GUIEditor_Window[8]) -- silenced
	GUIEditor_Button[19] = guiCreateButton(229,119,81,16,"Take",false,GUIEditor_Window[8]) -- deseteagle
	GUIEditor_Button[20] = guiCreateButton(132,417,81,16,"Take",false,GUIEditor_Window[8]) -- grenade
	GUIEditor_Button[21] = guiCreateButton(231,418,81,16,"Take",false,GUIEditor_Window[8]) -- camera
	GUIEditor_Button[22] = guiCreateButton(107,455,118,33,"Close",false,GUIEditor_Window[8]) -- close windiw
	GUIEditor_Button[23] = guiCreateButton(130,318,81,16,"Take",false,GUIEditor_Window[8]) -- parachute
	GUIEditor_Button[24] = guiCreateButton(228,318,81,16,"Take",false,GUIEditor_Window[8]) -- heatrpg
	guiSetVisible ( GUIEditor_Window[8], true )
	showCursor(true)
	addEventHandler("onClientGUIClick", GUIEditor_Button[12],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 1)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[13],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 2)
		end
    ,false)
   	addEventHandler("onClientGUIClick", GUIEditor_Button[14],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 3)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[15],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 4)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[16],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 5)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[17],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 6)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[18],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 7)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[19],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 8)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[20],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 9)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[21],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 10)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[22],
		function ()
   			guiSetVisible ( GUIEditor_Window[8], false )
   			showCursor(false)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[23],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 11)
		end
    ,false)
	addEventHandler("onClientGUIClick", GUIEditor_Button[24],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 12)
		end
    ,false)
end

addEvent( "showEquip", true )
addEventHandler( "showEquip", getRootElement(), showEquipMenu )

function showMayorEquipMenu ()
	GUIEditor_Window[9] = guiCreateWindow(456,323,369,268,"Select weapon",false)
	GUIEditor_Image[15] = guiCreateStaticImage(16,31,89,84,"images/colt45.png",false,GUIEditor_Window[9])
	GUIEditor_Image[16] = guiCreateStaticImage(132,34,97,84,"images/mp5.png",false,GUIEditor_Window[9])
	GUIEditor_Image[17] = guiCreateStaticImage(256,35,95,82,"images/deserteagle.png",false,GUIEditor_Window[9])
	GUIEditor_Image[18] = guiCreateStaticImage(15,149,90,79,"images/gas.png",false,GUIEditor_Window[9])
	GUIEditor_Image[19] = guiCreateStaticImage(259,149,92,77,"images/cuntgun.png",false,GUIEditor_Window[9])
	GUIEditor_Button[25] = guiCreateButton(128,175,107,49,"Close",false,GUIEditor_Window[9])
	GUIEditor_Button[26] = guiCreateButton(14,236,91,20,"Take",false,GUIEditor_Window[9]) -- Gas grenade
	GUIEditor_Button[27] = guiCreateButton(14,123,91,20,"Take",false,GUIEditor_Window[9]) -- Colt
	GUIEditor_Button[28] = guiCreateButton(261,235,91,20,"Take",false,GUIEditor_Window[9]) -- Country rifle
	GUIEditor_Button[29] = guiCreateButton(136,126,91,20,"Take",false,GUIEditor_Window[9]) -- MP5
	GUIEditor_Button[30] = guiCreateButton(261,123,91,20,"Take",false,GUIEditor_Window[9]) -- Desert Eagle
	guiSetVisible ( GUIEditor_Window[9], true )
	showCursor(true)
	addEventHandler("onClientGUIClick", GUIEditor_Button[27],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 5)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[29],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 1)
		end
    ,false)
   	addEventHandler("onClientGUIClick", GUIEditor_Button[30],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 8)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[26],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 6)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[28],
		function ()
			triggerServerEvent ( "EquipCop", getLocalPlayer(), 3)
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[25],
		function ()
   			guiSetVisible ( GUIEditor_Window[9], false )
   			showCursor(false)
		end
    ,false)
end

addEvent( "showMayorEquip", true )
addEventHandler( "showMayorEquip", getRootElement(), showMayorEquipMenu )

function showBankSystemMenu ( moneys )
	if menushow == nil or menushow == 0 then
		menushow = 1
  		showCursor(true)
		GUIEditor_Window[17] = guiCreateWindow(496,345,364,365,"Bank",false)
		GUIEditor_Label[27] = guiCreateLabel(24,23,338,18,"_____________________Info_____________________",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[27],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[27],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[27],"left",false)
		GUIEditor_Label[28] = guiCreateLabel(15,151,338,22,"_____________________Withdraw_____________________",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[28],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[28],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[28],"left",false)
		GUIEditor_Label[29] = guiCreateLabel(15,75,338,22,"_____________________Deposit_____________________",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[29],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[29],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[29],"left",false)
		GUIEditor_Label[30] = guiCreateLabel(120,49,186,19,"Money: "..tostring(moneys).."$",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[30],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[30],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[30],"left",false)
		guiSetFont(GUIEditor_Label[30],"clear-normal")
		GUIEditor_Edit[8] = guiCreateEdit(178,109,104,26,"0",false,GUIEditor_Window[17])
		GUIEditor_Label[31] = guiCreateLabel(97,114,67,18,"How many?",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[31],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[31],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[31],"left",false)
		guiSetFont(GUIEditor_Label[31],"default-bold-small")
		GUIEditor_Label[32] = guiCreateLabel(97,194,67,22,"How many?",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[32],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[32],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[32],"left",false)
		guiSetFont(GUIEditor_Label[32],"default-bold-small")
		GUIEditor_Edit[9] = guiCreateEdit(175,188,104,26,"0",false,GUIEditor_Window[17])
		GUIEditor_Label[33] = guiCreateLabel(19,226,338,22,"_____________________Phone_____________________",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[33],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[33],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[33],"left",false)
		GUIEditor_Label[34] = guiCreateLabel(97,254,67,20,"Deposit:",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[34],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[34],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[34],"left",false)
		guiSetFont(GUIEditor_Label[34],"default-bold-small")
		GUIEditor_Edit[10] = guiCreateEdit(175,249,104,26,"0",false,GUIEditor_Window[17])
		GUIEditor_Label[35] = guiCreateLabel(25,289,318,21,"_____________________________________________",false,GUIEditor_Window[17])
		guiLabelSetColor(GUIEditor_Label[35],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[35],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[35],"left",false)
		GUIEditor_Button[73] = guiCreateButton(109,317,159,34,"Finish",false,GUIEditor_Window[17])
		addEventHandler("onClientGUIClick", GUIEditor_Button[73],
		function ()
			local finmoneys = moneys + tonumber(guiGetText ( GUIEditor_Edit[8] )) - tonumber(guiGetText ( GUIEditor_Edit[9] )) - tonumber(guiGetText ( GUIEditor_Edit[10] ))
			takePlayerMoney ( tonumber(guiGetText ( GUIEditor_Edit[8] )) )
			givePlayerMoney ( tonumber(guiGetText ( GUIEditor_Edit[9] )) )
			setElementData ( localPlayer, "pmoney", tonumber(getElementData(localPlayer,"pmoney")) + tonumber(guiGetText ( GUIEditor_Edit[10] )) )
			setElementData ( localPlayer, "bmoney", finmoneys )
			if tonumber(guiGetText ( GUIEditor_Edit[8] )) > 0 then
		    		outputChatBox("Info: You deposited to your bank account "..guiGetText ( GUIEditor_Edit[8] ).."$", 0,153,51)
			end
			if tonumber(guiGetText ( GUIEditor_Edit[9] )) > 0 then
		    		outputChatBox("Info: You withdrew from your bank account "..guiGetText ( GUIEditor_Edit[9] ).."$", 0,153,51)
			end
			if tonumber(guiGetText ( GUIEditor_Edit[10] )) > 0 then
		    		outputChatBox("Info: You deposited to your mobile phone account "..guiGetText ( GUIEditor_Edit[10] ).."$", 0,153,51)
			end
			menushow = 0
			showCursor(false)
			guiSetVisible ( GUIEditor_Window[17], false )
		end,false)
	end
end

addEvent( "showBankSystem", true )
addEventHandler( "showBankSystem", getRootElement(), showBankSystemMenu )

function showPlayerLicenses ( drive, fly, boat, weapon, name )
	GUIEditor_Window[20] = guiCreateWindow(664,385,157,206,name,false)
	if drive == 1 then
		GUIEditor_Label[43] = guiCreateLabel(17,28,114,18,"Driver license: Yes",false,GUIEditor_Window[20])
	else
		GUIEditor_Label[43] = guiCreateLabel(17,28,114,18,"Driver license: None",false,GUIEditor_Window[20])
	end
	guiLabelSetColor(GUIEditor_Label[43],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[43],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[43],"left",false)
	if boat == 1 then
		GUIEditor_Label[44] = guiCreateLabel(17,54,104,18,"Boat license: Yes",false,GUIEditor_Window[20])
	else
		GUIEditor_Label[44] = guiCreateLabel(17,54,104,18,"Boat license: None",false,GUIEditor_Window[20])
	end
	guiLabelSetColor(GUIEditor_Label[44],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[44],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[44],"left",false)
	if fly == 1 then
		GUIEditor_Label[45] = guiCreateLabel(17,80,94,19,"Fly license: Yes",false,GUIEditor_Window[20])
	else
		GUIEditor_Label[45] = guiCreateLabel(17,80,94,19,"Fly license: None",false,GUIEditor_Window[20])
	end
	guiLabelSetColor(GUIEditor_Label[45],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[45],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[45],"left",false)
	if weapon == 1 then
		GUIEditor_Label[46] = guiCreateLabel(17,108,123,18,"Weapon license: Yes",false,GUIEditor_Window[20])
	else
		GUIEditor_Label[46] = guiCreateLabel(17,108,123,18,"Weapon license: None",false,GUIEditor_Window[20])
	end
	guiLabelSetColor(GUIEditor_Label[46],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[46],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[46],"left",false)
	GUIEditor_Button[77] = guiCreateButton(32,159,96,31,"Close",false,GUIEditor_Window[20])
	guiSetVisible ( GUIEditor_Window[20], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[77],
		function ()
			guiSetVisible ( GUIEditor_Window[20], false )
		end
	,false)
end

addEvent( "showPlayerLic", true )
addEventHandler( "showPlayerLic", getRootElement(), showPlayerLicenses )

function showPlayerPassport ( name, sex, job, national, crimes )
	GUIEditor_Window[21] = guiCreateWindow(606,328,232,245,getPlayerName(localPlayer),false)
	GUIEditor_Label[47] = guiCreateLabel(23,62,55,22,"Age: "..getElementData ( localPlayer, "age" ).."",false,GUIEditor_Window[21])
	guiLabelSetColor(GUIEditor_Label[47],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[47],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[47],"left",false)
	guiSetFont(GUIEditor_Label[47],"clear-normal")
	if tonumber(getElementData ( localPlayer, "boat" )) == 1 then
		GUIEditor_Label[48] = guiCreateLabel(23,89,160,15,"Job: Taxi driver",false,GUIEditor_Window[21])
	end
	if tonumber(getElementData ( localPlayer, "boat" )) == 1 then
        GUIEditor_Label[48] = guiCreateLabel(23,89,160,15,"Job: Mechanic",false,GUIEditor_Window[21])
	end
    if tonumber(getElementData ( localPlayer, "boat" )) == 1 then
        GUIEditor_Label[48] = guiCreateLabel(23,89,160,15,"Job: Swype driver",false,GUIEditor_Window[21])
    end
    if tonumber(getElementData ( localPlayer, "boat" )) == 1 then
        GUIEditor_Label[48] = guiCreateLabel(23,89,160,15,"Job: Bus driver",false,GUIEditor_Window[21])
    end
    if tonumber(getElementData ( localPlayer, "boat" )) == 1 then
    	GUIEditor_Label[48] = guiCreateLabel(23,89,160,15,"Job: Van driver",false,GUIEditor_Window[21])
    end
	guiLabelSetColor(GUIEditor_Label[48],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[48],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[48],"left",false)
	guiSetFont(GUIEditor_Label[48],"clear-normal")
	GUIEditor_Label[49] = guiCreateLabel(23,114,74,19,"Crimes: "..getElementData ( localPlayer, "crimes" ).."",false,GUIEditor_Window[21])
	guiLabelSetColor(GUIEditor_Label[49],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[49],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[49],"left",false)
	guiSetFont(GUIEditor_Label[49],"clear-normal")
	GUIEditor_Label[50] = guiCreateLabel(53,29,138,16,getPlayerName(localPlayer),false,GUIEditor_Window[21])
	guiLabelSetColor(GUIEditor_Label[50],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[50],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[50],"left",false)
	guiSetFont(GUIEditor_Label[50],"default-bold-small")
	if tonumber(getElementData ( localPlayer, "sex" )) == 1 then
    	GUIEditor_Label[51] = guiCreateLabel(123,60,100,20,"Gender: Male",false,GUIEditor_Window[21])
    else
		GUIEditor_Label[51] = guiCreateLabel(123,60,100,20,"Gender: Female",false,GUIEditor_Window[21])
	end
	guiLabelSetColor(GUIEditor_Label[51],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[51],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[51],"left",false)
	guiSetFont(GUIEditor_Label[51],"clear-normal")
	GUIEditor_Button[78] = guiCreateButton(57,185,120,36,"Close",false,GUIEditor_Window[21])
	GUIEditor_Label[52] = guiCreateLabel(23,135,196,18,"Nationality: "..getElementData ( localPlayer, "nation" ).."",false,GUIEditor_Window[21])
	guiLabelSetColor(GUIEditor_Label[52],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[52],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[52],"left",false)
	guiSetFont(GUIEditor_Label[52],"clear-normal")
	guiSetVisible ( GUIEditor_Window[21], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[78],
		function ()
			guiSetVisible ( GUIEditor_Window[21], false )
		end
	,false)
end


addEvent( "showPlayerPassporte", true )
addEventHandler( "showPlayerPassporte", getRootElement(), showPlayerPassport )

function showFixAccept ( mehid, price )
	GUIEditor_Window[23] = guiCreateWindow(541,347,294,157,"Accept fix?",false)
	GUIEditor_Label[53] = guiCreateLabel(53,37,185,18,"Do you want to fix?",false,GUIEditor_Window[23])
	guiLabelSetColor(GUIEditor_Label[53],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[53],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[53],"left",false)
	guiSetFont(GUIEditor_Label[53],"clear-normal")
	GUIEditor_Button[91] = guiCreateButton(23,75,249,44,"Yes",false,GUIEditor_Window[23])
	guiSetFont(GUIEditor_Button[91],"default-bold-small")
	GUIEditor_Button[92] = guiCreateButton(80,125,136,23,"No!",false,GUIEditor_Window[23])
	guiSetVisible ( GUIEditor_Window[23], true )	
	addEventHandler("onClientGUIClick", GUIEditor_Button[92],
	function ()
		guiSetVisible ( GUIEditor_Window[23], false )		
	end,false)
	addEventHandler("onClientGUIClick", GUIEditor_Button[91],
	function ()
		outputChatBox ("Info: Your car is being repaired, you can pay the bill now", 0,153,51 )
		takePlayerMoney ( price )		
		guiSetVisible ( GUIEditor_Window[23], false )
		triggerServerEvent ( "completeFueling", getLocalPlayer(), mehid, price )					
	end,false)	
end

addEvent( "showFixAcceptMenu", true )
addEventHandler( "showFixAcceptMenu", getRootElement(), showFixAccept )

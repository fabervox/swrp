GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Memo = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}
GUIEditor_Radio = {}
GUIEditor_Image = {}

GUIEditor_Progress = {}

GUIEditor_Checkbox = {}

localPlayer= getLocalPlayer ()

function acceptWorkWindow ( workid )
	if menushow == nil or menushow == 0 then
		menushow = 1
		GUIEditor_Window[23] = guiCreateWindow(541,347,294,157,"Accept work?",false)
		GUIEditor_Label[22] = guiCreateLabel(53,37,185,18,"Do you want to this job?",false,GUIEditor_Window[23])
		guiLabelSetColor(GUIEditor_Label[22],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[22],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[22],"left",false)
		guiSetFont(GUIEditor_Label[22],"clear-normal")
		GUIEditor_Button[48] = guiCreateButton(23,75,249,44,"Yes",false,GUIEditor_Window[23])
		guiSetFont(GUIEditor_Button[48],"default-bold-small")
		GUIEditor_Button[49] = guiCreateButton(80,125,136,23,"Cancel",false,GUIEditor_Window[23])
		guiSetVisible ( GUIEditor_Window[23], true )
		addEventHandler("onClientGUIClick", GUIEditor_Button[49],
		function ()
			guiSetVisible ( GUIEditor_Window[23], false )
			menushow = 0
		end,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[48],
		function ()
			if tonumber(getElementData ( localPlayer, "work" )) == 0 then
				setElementData ( localPlayer, "work", workid )
				if workid == 1 then
					outputChatBox("Информация: Вы устроились на работу таксистом!", 0,153,51)
				end
				if workid == 2 then
					outputChatBox("Информация: Вы устроились на работу механиком!", 0,153,51)
				end
				if workid == 3 then
					outputChatBox("Информация: Вы устроились на работу чистильщиком улиц!", 0,153,51)
				end
	  			if workid == 4 then
					outputChatBox("Информация: Вы устроились на работу водителем автобуса!", 0,153,51)
				end
				if workid == 5 then
					outputChatBox("Информация: Вы устроились на работу дальнобойщиком!", 0,153,51)
				end
			else
				outputChatBox("Ошибка: Вы уже состоите на работе!", 102, 0, 0)
			end
			guiSetVisible ( GUIEditor_Window[23], false )
			menushow = 0
		end,false)
	end
end

addEvent( "workAcceptWindow", true )
addEventHandler( "workAcceptWindow", getRootElement(), acceptWorkWindow )

function showFillAccept ( mehid, price )
	GUIEditor_Window[14] = guiCreateWindow(541,347,294,157,"Accept fill?",false)
	GUIEditor_Label[23] = guiCreateLabel(53,37,185,18,"Do you want to fill?",false,GUIEditor_Window[14])
	guiLabelSetColor(GUIEditor_Label[23],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[23],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[23],"left",false)
	guiSetFont(GUIEditor_Label[23],"clear-normal")
	GUIEditor_Button[50] = guiCreateButton(23,75,249,44,"Yes",false,GUIEditor_Window[14])
	guiSetFont(GUIEditor_Button[50],"default-bold-small")
	GUIEditor_Button[51] = guiCreateButton(80,125,136,23,"No!",false,GUIEditor_Window[14])
	guiSetVisible ( GUIEditor_Window[14], true )	
	addEventHandler("onClientGUIClick", GUIEditor_Button[51],
	function ()
		guiSetVisible ( GUIEditor_Window[14], false )		
	end,false)
	addEventHandler("onClientGUIClick", GUIEditor_Button[50],
	function ()
		outputChatBox ("Информация: Сейчас ваша машина будет заправлена, а пока оплатите счет", 0,153,51 )
		takePlayerMoney ( price )		
		guiSetVisible ( GUIEditor_Window[14], false )
		triggerServerEvent ( "completeFueling", getLocalPlayer(), mehid, price )					
	end,false)	
end

addEvent( "showFillAcceptMenu", true )
addEventHandler( "showFillAcceptMenu", getRootElement(), showFillAccept )
localPlayer = getLocalPlayer ()

GUIEditor_Memo = {}
GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Checkbox = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}
GUIEditor_Radio = {}
GUIEditor_Memo = {}


function instructionPDDMemo ()
	GUIEditor_Window[18] = guiCreateWindow(495,303,508,331,"Rules",false)
	GUIEditor_Memo[2] = guiCreateMemo(17,23,482,228,"Max speed in city - 70 km/h. Max Speed outside - 100 km/h. Left. See the full rules at our site - jesw.co.cc",false,GUIEditor_Window[18])
	guiMemoSetReadOnly(GUIEditor_Memo[1],true)
	GUIEditor_Checkbox[1] = guiCreateCheckBox(159,259,175,28,"I read this rules",false,false,GUIEditor_Window[18])
	GUIEditor_Button[90] = guiCreateButton(161,290,141,24,"Next",false,GUIEditor_Window[18])
	guiSetVisible ( GUIEditor_Window[18], true )
	showCursor ( true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[90],
		function ()
		    if guiCheckBoxGetSelected ( GUIEditor_Checkbox[1] ) then
				instructionPDDTest()
				guiSetVisible ( GUIEditor_Window[18], false )
		    end
        end
	,false)
end

addEvent( "instructionPDDMemoShow", true )
addEventHandler( "instructionPDDMemoShow", getRootElement(), instructionPDDMemo )

function instructionPDDTest()
	outputChatBox ("Подсказка: Выберите три павильных ответа", 102,204,153 )
	GUIEditor_Window[19] = guiCreateWindow(528,265,380,389,"Test",false)
	GUIEditor_Label[36] = guiCreateLabel(78,94,266,20,"Max speed in the city?",false,GUIEditor_Window[19])
	guiLabelSetColor(GUIEditor_Label[36],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[36],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[36],"left",false)
	guiSetFont(GUIEditor_Label[36],"clear-normal")
	GUIEditor_Label[37] = guiCreateLabel(28,144,321,22,"________________________________________",false,GUIEditor_Window[19])
	guiLabelSetColor(GUIEditor_Label[37],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[37],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[37],"left",false)
	guiSetFont(GUIEditor_Label[37],"clear-normal")
	GUIEditor_Checkbox[2] = guiCreateCheckBox(30,123,75,21,"70 kmph",false,false,GUIEditor_Window[19])
	GUIEditor_Checkbox[3] = guiCreateCheckBox(149,123,75,21,"150 kmph",false,false,GUIEditor_Window[19])
	GUIEditor_Checkbox[4] = guiCreateCheckBox(265,123,75,21,"100 kmph",false,false,GUIEditor_Window[19])
	GUIEditor_Label[38] = guiCreateLabel(78,171,266,15,"Max speed in the outside?",false,GUIEditor_Window[19])
	guiLabelSetColor(GUIEditor_Label[38],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[3],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[38],"left",false)
	guiSetFont(GUIEditor_Label[38],"clear-normal")
	GUIEditor_Checkbox[5] = guiCreateCheckBox(30,196,75,21,"200 kmph",false,false,GUIEditor_Window[19])
	guiCheckBoxSetSelected(GUIEditor_Checkbox[4],true)
	GUIEditor_Checkbox[6] = guiCreateCheckBox(149,197,75,21,"150 kmph",false,false,GUIEditor_Window[19])
	guiCheckBoxSetSelected(GUIEditor_Checkbox[5],true)
	GUIEditor_Checkbox[7] = guiCreateCheckBox(77,286,75,21,"Left",false,false,GUIEditor_Window[19])
	guiCheckBoxSetSelected(GUIEditor_Checkbox[6],true)
	GUIEditor_Checkbox[8] = guiCreateCheckBox(265,197,75,21,"100 kmph",false,false,GUIEditor_Window[19])
	guiCheckBoxSetSelected(GUIEditor_Checkbox[7],true)
	GUIEditor_Label[39] = guiCreateLabel(28,231,321,17,"________________________________________",false,GUIEditor_Window[19])
	guiLabelSetColor(GUIEditor_Label[39],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[39],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[39],"left",false)
	guiSetFont(GUIEditor_Label[39],"clear-normal")
	GUIEditor_Label[40] = guiCreateLabel(78,262,266,15,"Right or left?",false,GUIEditor_Window[19])
	guiLabelSetColor(GUIEditor_Label[40],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[40],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[40],"left",false)
	guiSetFont(GUIEditor_Label[40],"clear-normal")
	GUIEditor_Checkbox[9] = guiCreateCheckBox(237,286,75,21,"Right",false,false,GUIEditor_Window[19])
	guiCheckBoxSetSelected(GUIEditor_Checkbox[8],true)
	GUIEditor_Label[41] = guiCreateLabel(136,30,94,51,"Test",false,GUIEditor_Window[19])
	guiLabelSetColor(GUIEditor_Label[41],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[41],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[41],"left",false)
	guiSetFont(GUIEditor_Label[641],"sa-header")
	GUIEditor_Label[42] = guiCreateLabel(28,312,321,17,"________________________________________",false,GUIEditor_Window[19])
	guiLabelSetColor(GUIEditor_Label[42],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[42],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[42],"left",false)
	guiSetFont(GUIEditor_Label[42],"clear-normal")
	GUIEditor_Button[76] = guiCreateButton(107,339,155,39,"Next",false,GUIEditor_Window[19])
	guiSetVisible ( GUIEditor_Window[19], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[76],
		function ()
		    if guiCheckBoxGetSelected ( GUIEditor_Checkbox[2] ) and guiCheckBoxGetSelected ( GUIEditor_Checkbox[7] ) and guiCheckBoxGetSelected ( GUIEditor_Checkbox[8] ) then
				instructionPDDFin()
      		else
      			outputChatBox("Info: You failed the test!", 0,153,51)
				showCursor ( false )
			end
			guiSetVisible ( GUIEditor_Window[19], false )
        end
	,false)
end

function instructionPDDFin ()
	GUIEditor_Window[20] = guiCreateWindow(566,433,378,128,"Congratulations!",false)
	GUIEditor_Label[43] = guiCreateLabel(31,31,335,20,"Your succeeded! Now you can drive a real car",false,GUIEditor_Window[20])
	guiLabelSetColor(GUIEditor_Label[43],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[43],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[43],"left",false)
	guiSetFont(GUIEditor_Label[43],"clear-normal")
	GUIEditor_Button[77] = guiCreateButton(130,61,116,51,"Finish",false,GUIEditor_Window[20])
	guiSetVisible ( GUIEditor_Window[20], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[77],
		function ()
		   	outputChatBox ("Hint: Drive through the checkpoints, don't drive more than 70 km/h and don't damage the car!", 102,204,153 )
		   	--carfortest = createVehicle ( 566, 1148.64453125,1375.7490234375,10.419050216675 )
			guiSetVisible ( GUIEditor_Window[20], false )
			test = createMarker ( 1058.8583984375,1375.248046875,10.446697235107, "checkpoint" )
			testblip = createBlipAttachedTo ( test, 0 )
			setElementData ( localPlayer, "test", 2 )
			addEventHandler( "onClientMarkerHit", test, testMarkerHit)
			setElementData ( localPlayer, "cartest", 1 )
      		triggerServerEvent ( "onGreeting", getLocalPlayer() )
			setVehicleLocked ( carfortest, true )
			toggleControl ( "enter_exit", false )
			showCursor ( false )
        end
	,false)
end

--addCommandHandler ("pdd", instructionPDDFin)

function testMarkerHit ( hitElement, matchingDimension )
--	if getElementHealth ( cars[i] ) < 500 then
--		outputChatBox("Ошибка: Тест провален!!! Вы слишком поведили машину", 153,51,0)
--		--destroyElement ( carfortest )
--		return true
--	end
	local testnum = getElementData ( localPlayer, "test" )
	--destroyElement ( test )
	if testnum == 1 then
		test = createMarker ( 1058.8583984375,1375.248046875,10.446697235107 )
	end
	if testnum == 2 then
		setElementPosition ( test, 1005.3486328125,1334.0693359375,10.419406890869 )
	end
	if testnum == 3 then
		setElementPosition ( test, 1029.42578125,1190.646484375,10.588260650635 )
	end
	if testnum == 4 then
		setElementPosition ( test, 1265.876953125,1190.4814453125,11.238277435303 )
	end
	if testnum == 5 then
		setElementPosition ( test, 1434.2265625,1190.1201171875,10.418175697327 )
	end
	if testnum == 6 then
		setElementPosition ( test, 1504.9609375,1111.1328125,10.419449806213 )
	end
	if testnum == 7 then
		setElementPosition ( test, 1505.15234375,975.8701171875,10.419466018677 )
	end
	if testnum == 8 then
		setElementPosition ( test, 1550.60546875,910.6484375,10.419382095337 )
	end
	if testnum == 9 then
		setElementPosition ( test, 1570.6845703125,956.712890625,10.427146911621 )
	end
	if testnum == 10 then
		setElementPosition ( test, 1546.978515625,1135.599609375,10.419419288635 )
	end
	if testnum == 11 then
		setElementPosition ( test, 1449.69140625,1176.279296875,10.419466972351 )
	end
	if testnum == 12 then
		setElementPosition ( test, 1085.87890625,1195.2197265625,10.419561386108 )
	end
	if testnum == 13 then
		setElementPosition ( test, 1028.5576171875,1370.4140625,10.520358085632 )
	end
	if testnum == 14 then
		setElementPosition ( test, 1144.6064453125,1366.9228515625,10.487559318542 )
	end
	setElementData ( localPlayer, "test", testnum + 1 )
	--addEventHandler( "onClientMarkerHit", test, testMarkerHit)
	if testnum == 15 then
		local theVehicle = getPedOccupiedVehicle ( localPlayer )
  		toggleControl ( "enter_exit", true )
		setElementData ( localPlayer, "cartest", 0 )
		setElementPosition ( localPlayer, 1168.443359375,1364.6494140625,10.812507629395 )
		outputChatBox("Info: Congratulations! You passed the test successfully and now car drive a car", 0,153,51)
		removeEventHandler( "onClientMarkerHit", test, MarkerHit )
		triggerServerEvent ( "onGreetingFinish", getLocalPlayer () )
  		setElementData ( localPlayer, "drive", 1)
  		destroyElement ( test )
  		--destroyElement ( carfortest )
  		destroyElement ( testblip )
	end
end
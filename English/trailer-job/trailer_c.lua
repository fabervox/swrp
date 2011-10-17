localPlayer = getLocalPlayer ()
GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Grid = {}

function showTrailerStartWorkC ()

	GUIEditor_Window[1] = guiCreateWindow(0.3354,0.3444,0.3361,0.42,"Select your destination",true)
	GUIEditor_Grid[1] = guiCreateGridList(9,25,465,282,false,GUIEditor_Window[1])
	--guiGridListSetSelectionMode(GUIEditor_Grid[1],2)
	guiGridListAddColumn(GUIEditor_Grid[1],"Destination",0.3)
	guiGridListAddColumn(GUIEditor_Grid[1],"Lenght",0.2)
	guiGridListAddColumn(GUIEditor_Grid[1],"Difficult",0.2)
	guiGridListAddColumn(GUIEditor_Grid[1],"Cash",0.2)
	GUIEditor_Button[1] = guiCreateButton(105,313,130,56,"Select",false,GUIEditor_Window[1])
	GUIEditor_Button[2] = guiCreateButton(253,322,103,36,"Close",false,GUIEditor_Window[1])
	for i = 1, 8 do
	    guiGridListAddRow(GUIEditor_Grid[1])
	end

		guiGridListSetItemText ( GUIEditor_Grid[1], 1, 1, "San Fierro University", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 1, 2, "Medium", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 1, 3, "Very Long", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 1, 4, "6400$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 2, 1, "Las Venturas Store", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 2, 2, "Very Easy", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 2, 3, "Very Short", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 2, 4, "700$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 3, 1, "Career", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 3, 2, "Very Hard", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 3, 3, "Short", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 3, 4, "5200$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 4, 1, "Las Venturas Church", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 4, 2, "Very Easy", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 4, 3, "Very Short", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 4, 4, "600$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 5, 1, "Ehl Quebrados Ammunation", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 5, 2, "Easy", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 5, 3, "Long", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 5, 4, "3300$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 6, 1, "Port of Bay Side", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 6, 2, "Medium", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 6, 3, "Long", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 6, 4, "4500$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 7, 1, "San Fierro Mayour", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 7, 2, "Easy", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 7, 3, "Very Long", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 7, 4, "4900$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 1, "Bone Country Cluckin Bell", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 2, "Medium", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 3, "Medium", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 4, "1870$", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 1, "Area 69", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 2, "Medium", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 3, "Medium", false, false )
		guiGridListSetItemText ( GUIEditor_Grid[1], 8, 4, "2100$", false, false )
		guiSetVisible ( GUIEditor_Window[1], true ) 
		showCursor ( true )
		toggleAllControls ( false, true, false )
		guiGridListSetSelectionMode ( GUIEditor_Grid[1], 1 )
		addEventHandler("onClientGUIClick", GUIEditor_Button[1],
			function ()
		  		local selectedzone = guiGridListGetSelectedItem ( GUIEditor_Grid[1] )
		  		if selectedzone ~= nil then
					if selectedzone == 1 then
	     				trailer = createMarker ( -1945.119140625,-1084.34375,30.400369644165, "checkpoint" )
	     				outputChatBox ("Шеф: Необходимо отвезти эти компьютеры iMac в Университет Сан Фиерро", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 6400 )
					elseif selectedzone == 2 then
					--	trailer = createMarker ( 1695.421875, 1454.259765625, 12.762633323669, "checkpoint" )
	     				trailer = createMarker ( 977.443359375,2164.9287109375,10.8203125, "checkpoint" )
	     				outputChatBox ("Шеф: На западном складе пылится партия iPad, забери и привези их сюда", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 700 )
				    elseif selectedzone == 3 then
	     				trailer = createMarker ( 585.767578125,854.458984375,-42.894313812256, "checkpoint" )
	     				outputChatBox ("Шеф: Нам заказали привезти в карьер новое оборудование, это будет легко", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 5200 )
				    elseif selectedzone == 4 then
	     				trailer = createMarker ( 1541.0185546875,755.3955078125,10.452857017517, "checkpoint" )
	     				outputChatBox ("Шеф: Отвези в церковь эту партию библий, но, главное, - не попадайся копам", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 600 )
				    elseif selectedzone == 5 then
	     				trailer = createMarker ( -1507.9072265625,2603.46875,55.315052032471, "checkpoint" )
	     				outputChatBox ("Шеф: Хозяин оружейки Эль Кебрадоса прикупил себе пару новых штучек. Отвези их.", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 3300 )
				    elseif selectedzone == 6 then
	     				trailer = createMarker ( -2262.1904296875,2312.19140625,4.4393954277039, "checkpoint" )
	     				outputChatBox ("Шеф: Мне тетушка из России прислала пару пирожков. Забери их в порту Бай Сайда.", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 4500 )
				    elseif selectedzone == 7 then
	     				trailer = createMarker ( -1956.0751953125,1335.7978515625,6.8124227523804, "checkpoint" )
	     				outputChatBox ("Шеф: Так, будь осторожен. Сегодня ты везешь очень хрупкий товар в мэрию Сан Фиерро", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 4900 )
				    elseif selectedzone == 8 then
	     				trailer = createMarker ( 175.423828125,1168.7685546875,14.7578125, "checkpoint" )
	     				outputChatBox ("Шеф: В Клакин Бэле близ Бони Кантри закончился весь кетчуп. Быстрее вези эту фуру к ним", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 1870 )
				    elseif selectedzone == 9 then
	     				trailer = createMarker ( 135.5537109375,1946.2109375,19.35608291626, "checkpoint" )
	     				outputChatBox ("Шеф: У тебя супер секретное задание, лови GPS метку, и не задвай вопросов", 255,153,255 )
	     				setElementData ( localPlayer, "trailerprize", 2100 )
				    end
				    --setControlState ( "enter_exit", false )
				    guiSetVisible ( GUIEditor_Window[1], false ) 
                	toggleAllControls ( true, true, true )
                	showCursor ( false )
				    outputChatBox ("Подсказка: Отправляйтесь на точку, отмеченную на карте", 255,255,255 )
				    addEventHandler( "onClientMarkerHit", trailer, TrailerMarkerHit )
				    setElementData ( localPlayer, "trailerwork", 1 )
				    trailerblip = createBlipAttachedTo ( trailer, 19 )
				else
					outputChatBox("Ошибка: Выберите задание", 102, 0, 0)
				end
			end
        ,false)
        addEventHandler("onClientGUIClick", GUIEditor_Button[1],
			function ()
				guiSetVisible ( GUIEditor_Window[1], false ) 
                toggleAllControls ( true, true, true )
                showCursor ( false )
			end
        ,false)
 end

addEvent("showTrailerStartWork",true)
addEventHandler("showTrailerStartWork",root,showTrailerStartWorkC)

 function TrailerMarkerHit ( hitElement, matchingDimension )
	if getElementData ( localPlayer, "trailerwork" ) == 1 then
	    if getElementModel ( getPedOccupiedVehicle(localPlayer) ) == 515 or getElementModel ( getPedOccupiedVehicle(localPlayer) ) == 514 then -- if theVehicle is either Shamal or AT-400
	    	setTimer ( finishBoarding, 5000, 1 )  
	    	outputChatBox("Информация: Подождите...", 0,153,51)
	    	setElementData ( localPlayer, "trailerwork", 2 )
	    	toggleAllControls ( false, true, false )
		else
	    	outputChatBox("Ошибка: А где грузовик то?", 102, 0, 0)
	    end
	elseif getElementData ( localPlayer, "trailerwork" ) == 2 then
		if getElementModel ( getPedOccupiedVehicle(localPlayer) ) == 515 or getElementModel ( getPedOccupiedVehicle(localPlayer) ) == 514 then
			givePlayerMoney ( getElementData ( localPlayer, "trailerprize" ) )
			destroyElement ( trailer )
			destroyElement ( trailerblip )
			setElementData ( localPlayer, "trailerwork", 0 )
			triggerServerEvent ( "finishTrailerWork", getLocalPlayer() )
			outputChatBox("Информация: Вы успешно довезли груз!", 0,153,51)
		else
	    	outputChatBox("Ошибка: А где грузовик то?", 102, 0, 0)
	    end
	end
end

function finishBoarding ()
	toggleAllControls ( true, true, true )
	--setElementPosition ( trailer, 2814.703125,973.3115234375,10.75 )
	setElementPosition ( trailer, 2823.505859375,917.4501953125,10.75 )
	outputChatBox("Информация: Теперь отправляйтесь обратно на склад дальнобойщиков в Лас Вентурасе", 0,153,51)
end

--- --- --- --- ---

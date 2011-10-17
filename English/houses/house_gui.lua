GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}

localPlayer = getLocalPlayer ()

--addEventHandler( "onClientResourceStart", getRootElement( ),
--    function ( startedRes )
--    outputChatBox ("Информация: Теперь вы сдаете свой дом в аренду", 0,153,51 )
--        outputDebugString ("Hous324es loaded!")
--    end
--)
--
--
--outputDebugString ("123")
housemoneys = 0

guishow = 0
guimoney = 0

function showHouseControlFunction ( ownerid, price, moneys, rent, rentprice, renters )
	if guishow == 0 then
	    housemoneys = moneys
		guishow = 1
		showCursor ( true )
		GUIEditor_Window[1] = guiCreateWindow(0.2118,0.2556,0.209,0.3278,"Your house",true)
		guiWindowSetSizable(GUIEditor_Window[1],false)
		GUIEditor_Label[1] = guiCreateLabel(0.0399,0.1017,0.3721,0.0508,"Price: "..tostring(price).."$",true,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[1],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
		GUIEditor_Label[2] = guiCreateLabel(0.0399,0.1898,0.3987,0.0542,"Moneys: "..tostring(housemoneys).."$",true,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[2],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[2],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[2],"left",false)
		GUIEditor_Button[1] = guiCreateButton(0.0332,0.2746,0.3455,0.1186,"Withdraw",true,GUIEditor_Window[1])
		GUIEditor_Button[2] = guiCreateButton(0.0332,0.4305,0.3455,0.1186,"Deposit",true,GUIEditor_Window[1])
		if rent == 1 then
			GUIEditor_Label[3] = guiCreateLabel(0.5216,0.1017,0.4153,0.0508,"Rent: Accept",true,GUIEditor_Window[1])
			GUIEditor_Button[4] = guiCreateButton(0.515,0.3763,0.3455,0.1186,"Set rent deaccept",true,GUIEditor_Window[1])
		elseif rent == 0 then
			GUIEditor_Label[3] = guiCreateLabel(0.5216,0.1017,0.4153,0.0508,"Rent: No",true,GUIEditor_Window[1])
			GUIEditor_Button[4] = guiCreateButton(0.515,0.3763,0.3455,0.1186,"Set rent accept",true,GUIEditor_Window[1])
		end
		guiLabelSetColor(GUIEditor_Label[3],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[3],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[3],"left",false)
		GUIEditor_Label[4] = guiCreateLabel(0.5216,0.1898,0.309,0.0542,"Rent price: "..tostring(rentprice).."$",true,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[4],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[4],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[4],"left",false)
		GUIEditor_Label[5] = guiCreateLabel(0.5216,0.2847,0.1958,0.0496,"Renters: "..tostring(renters).."",true,GUIEditor_Window[1])
		guiLabelSetColor(GUIEditor_Label[5],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[5],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[5],"left",false)
		GUIEditor_Button[3] = guiCreateButton(0.0332,0.6576,0.3455,0.1186,"Sell",true,GUIEditor_Window[1])
		GUIEditor_Button[5] = guiCreateButton(0.515,0.539,0.3455,0.1186,"Set rent price",true,GUIEditor_Window[1])
		GUIEditor_Button[6] = guiCreateButton(0.0332,0.8373,0.3455,0.1186,"Close",true,GUIEditor_Window[1])

	    guiSetVisible ( GUIEditor_Window[1], true )

		addEventHandler("onClientGUIClick", GUIEditor_Button[1],
			function ()
				showHouseMoney ( 1, housemoneys )
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[2],
			function ()
				showHouseMoney ( 2, housemoneys )
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[3],
			function ()
				triggerServerEvent ( "changeMoneyFromGUI", getLocalPlayer(), 5 )
				guishow = 0
				guiSetVisible ( GUIEditor_Window[1], false )
				showCursor ( false )
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[4],
			function ()
				if rent == 1 then
					triggerServerEvent ( "changeMoneyFromGUI", getLocalPlayer(), 3 )
					outputChatBox ("Информация: Вы больше не сдаете дом в аренду", 0,153,51 )
					guiSetText ( GUIEditor_Label[3], "Rent: No" )
					guiSetText ( GUIEditor_Label[5], "Renters: 0" )
					guiSetText ( GUIEditor_Button[4], "Set rent accept" )
					rent = 3
					return true
				else
					triggerServerEvent ( "changeMoneyFromGUI", getLocalPlayer(), 4 )
					outputChatBox ("Информация: Теперь вы сдаете свой дом в аренду", 0,153,51 )
					guiSetText ( GUIEditor_Label[3], "Rent: Accept" )
					guiSetText ( GUIEditor_Button[4], "Set rent deaccept" )
					rent = 1
				end
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[5],
			function ()
				showHouseMoney ( 3, housemoneys )
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[6],
			function ()
				guishow = 0
				guiSetVisible ( GUIEditor_Window[1], false )
				showCursor ( false )
			end
		,false)
	end
end

addEvent("showHouseControlFunctionS",true)
addEventHandler("showHouseControlFunctionS", getRootElement(),showHouseControlFunction)

function showHouseMoney ( type, money )
	if guimoney == 0 then
		GUIEditor_Window[2] = guiCreateWindow(0.4819,0.2889,0.0882,0.1333,"Enter value",true)
		guiWindowSetSizable(GUIEditor_Window[2],false)
		GUIEditor_Edit[1] = guiCreateEdit(0.1496,0.2417,0.6929,0.1833,"0",true,GUIEditor_Window[2])
		GUIEditor_Button[7] = guiCreateButton(0.1732,0.5833,0.6457,0.2667,"Ok!",true,GUIEditor_Window[2])
		guimoney = 1
		guiSetVisible ( GUIEditor_Window[2], true )
		outputChatBox("Информация: Введите сумму", 0,153,51)
		addEventHandler("onClientGUIClick", GUIEditor_Button[7],
			function ()
				endmoney = tonumber(guiGetText ( GUIEditor_Edit[1] ))
		        if type == 1 then
					if endmoney <= money then
						outputChatBox ("Информация: Вы взяли из дома "..tostring(endmoney).."$", 0,153,51 )
						givePlayerMoney ( endmoney )
						triggerServerEvent ( "changeMoneyFromGUI", getLocalPlayer(), 1, money-endmoney )
						guiSetText ( GUIEditor_Label[2], "Moneys: "..tostring(money-endmoney).."$" )
						housemoneys = money-endmoney
						guiSetVisible ( GUIEditor_Window[2], false )
						guimoney = 0
					else
						outputChatBox ("Ошибка: у вас в доме нет таких денег", 102, 0, 0)
					end
				elseif type == 2 then
					if endmoney < getPlayerMoney ( localPlayer ) then
						outputChatBox ("Информация: Вы положили в дом "..tostring(endmoney).."$", 0,153,51 )
						takePlayerMoney ( endmoney )
						triggerServerEvent ( "changeMoneyFromGUI", getLocalPlayer(), 1, money+endmoney )
						guiSetText ( GUIEditor_Label[2], "Moneys: "..tostring(money+endmoney).."$" )
						guiSetVisible ( GUIEditor_Window[2], false )
						guimoney = 0
						housemoneys = money+endmoney
					else
						outputChatBox ("Ошибка: у вас нет таких денег", 102, 0, 0)
					end
				elseif type == 3 then
					if endmoney > 0 and endmoney < 500 then
						outputChatBox ("Информация: Теперь цена аренды вашего дома будет стоить "..tostring(endmoney).."$", 0,153,51 )
						triggerServerEvent ( "changeMoneyFromGUI", getLocalPlayer(), 2, endmoney )
						guiSetText ( GUIEditor_Label[4], "Rent price: "..tostring(money+endmoney).."$" )
						guiSetVisible ( GUIEditor_Window[2], false )
						guimoney = 0
					else
						outputChatBox ("Ошибка: цена должна быть не меньше 1$ и не больше 500$", 102, 0, 0)
					end
				end
			end
		,false)
	end
end

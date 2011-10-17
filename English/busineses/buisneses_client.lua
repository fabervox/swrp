GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Label = {}
GUIEditor_TabPanel = {}
GUIEditor_Tab = {}

function showBuyList ( busid )
	if menushow == nil or menushow == 0 then
		menushow = 1
		showCursor ( true )
        GUIEditor_Window[1] = guiCreateWindow(0.4021,0.2344,0.2493,0.4433,"24/7",true)
        GUIEditor_TabPanel[1] = guiCreateTabPanel(0.0279,0.0602,0.9471,0.8045,true,GUIEditor_Window[1])
        GUIEditor_Tab[1] = guiCreateTab("Phone",GUIEditor_TabPanel[1])
        GUIEditor_Button[1] = guiCreateButton(0.0441,0.0471,0.3118,0.0976,"Phone - 500$",true,GUIEditor_Tab[1])
        GUIEditor_Button[2] = guiCreateButton(0.0441,0.2054,0.3118,0.0976,"100$ to phone",true,GUIEditor_Tab[1])
        GUIEditor_Button[3] = guiCreateButton(0.0441,0.3636,0.3118,0.0976,"200$ to phone",true,GUIEditor_Tab[1])
        GUIEditor_Button[4] = guiCreateButton(0.0441,0.5253,0.3118,0.0976,"300$ to phone",true,GUIEditor_Tab[1])
--        GUIEditor_Button[5] = guiCreateButton(0.3853,0.0505,0.2765,0.1246,"Something       4000$",true,GUIEditor_Tab[1])
--        GUIEditor_Button[6] = guiCreateButton(0.6941,0.0505,0.2765,0.1246,"",true,GUIEditor_Tab[1])
--        GUIEditor_Button[7] = guiCreateButton(0.3853,0.2323,0.2765,0.1246,"",true,GUIEditor_Tab[1])
--        GUIEditor_Button[8] = guiCreateButton(0.3853,0.4141,0.2765,0.1246,"Something       4000$",true,GUIEditor_Tab[1])
--        GUIEditor_Button[9] = guiCreateButton(0.6941,0.2357,0.2765,0.1246,"",true,GUIEditor_Tab[1])
--        GUIEditor_Button[10] = guiCreateButton(0.6912,0.4141,0.2765,0.1246,"Something       4000$",true,GUIEditor_Tab[1])
--        GUIEditor_Button[11] = guiCreateButton(0.3853,0.596,0.2765,0.1246,"Something       4000$",true,GUIEditor_Tab[1])
--        GUIEditor_Button[12] = guiCreateButton(0.6912,0.596,0.2765,0.1246,"Something       4000$",true,GUIEditor_Tab[1])
--        GUIEditor_Button[13] = guiCreateButton(0.3853,0.7744,0.2765,0.1246,"Something       4000$",true,GUIEditor_Tab[1])
--        GUIEditor_Button[14] = guiCreateButton(0.6912,0.7744,0.2765,0.1246,"Something       4000$",true,GUIEditor_Tab[1])
--        GUIEditor_Button[15] = guiCreateButton(0.0441,0.6835,0.3118,0.0976,"Samething",true,GUIEditor_Tab[1])
--        GUIEditor_Button[16] = guiCreateButton(0.0441,0.8384,0.3118,0.0976,"Samething",true,GUIEditor_Tab[1])
--        GUIEditor_Tab[2] = guiCreateTab("Vehicle",GUIEditor_TabPanel[1])
--        GUIEditor_Tab[3] = guiCreateTab("House",GUIEditor_TabPanel[1])
--        GUIEditor_Button[17] = guiCreateButton(0.0412,0.0539,0.2853,0.1481,"Something",true,GUIEditor_Tab[3])
--        GUIEditor_Button[18] = guiCreateButton(0.0412,0.2593,0.2853,0.1481,"Something",true,GUIEditor_Tab[3])
--        GUIEditor_Button[19] = guiCreateButton(0.0412,0.4747,0.2853,0.1481,"Something",true,GUIEditor_Tab[3])
--        GUIEditor_Button[20] = guiCreateButton(0.0412,0.6936,0.2853,0.1481,"Something",true,GUIEditor_Tab[3])
        GUIEditor_Tab[4] = guiCreateTab("Other",GUIEditor_TabPanel[1])
        GUIEditor_Button[21] = guiCreateButton(0.0353,0.0505,0.2588,0.1313,"Flowers           100$",true,GUIEditor_Tab[4])
        GUIEditor_Button[22] = guiCreateButton(0.3765,0.0505,0.2588,0.1313,"Dildo          150$",true,GUIEditor_Tab[4])
        GUIEditor_Button[23] = guiCreateButton(0.7029,0.0505,0.2588,0.1313,"Basebal bat    150$",true,GUIEditor_Tab[4])
        GUIEditor_Button[24] = guiCreateButton(0.0353,0.2189,0.2588,0.1313,"A tie           200$",true,GUIEditor_Tab[4])
        GUIEditor_Button[25] = guiCreateButton(0.3794,0.2189,0.2588,0.1313,"Mask           300$",true,GUIEditor_Tab[4])
        GUIEditor_Button[26] = guiCreateButton(0.7059,0.2189,0.2588,0.1313,"Lopata           100$",true,GUIEditor_Tab[4])
        GUIEditor_Button[27] = guiCreateButton(0.0353,0.3906,0.2588,0.1313,"Camera          1000$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[28] = guiCreateButton(0.3824,0.3906,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[29] = guiCreateButton(0.7059,0.3906,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[30] = guiCreateButton(0.0353,0.5623,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[31] = guiCreateButton(0.3824,0.5623,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[32] = guiCreateButton(0.7088,0.5623,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[33] = guiCreateButton(0.0353,0.7374,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[34] = guiCreateButton(0.3824,0.7374,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
--        GUIEditor_Button[35] = guiCreateButton(0.7118,0.7374,0.2588,0.1313,"Something          100$",true,GUIEditor_Tab[4])
        GUIEditor_Button[36] = guiCreateButton(0.3565,0.8822,0.2451,0.0852,"Close",true,GUIEditor_Window[1])

        guiSetVisible ( GUIEditor_Window[1], true )

		addEventHandler("onClientGUIClick", GUIEditor_Button[25],   -- маска
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 1, busid, 50)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[24],  -- веревка
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 2, busid, 20)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[27],  -- камера
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 3, busid, 200)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[1],  -- телефон
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 4, busid, 100)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[2],  --  100$
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 5, busid, 20)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[3],  -- 200$
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 6, busid, 10)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[4],  -- 300$
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 7, busid, 5)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[21],  -- цветы
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 8, busid, 30)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[22],  -- дилдо
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 9, busid, 50)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[23],  -- бита
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 10, busid, 50)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[26],  -- лопата
			function ()
				triggerServerEvent ( "fullShopBuy", getLocalPlayer(), 11, busid, 20)
			end
		,false)
		addEventHandler("onClientGUIClick", GUIEditor_Button[36],
			function ()
				guiSetVisible ( GUIEditor_Window[1], false )
				showCursor ( false )
				menushow = 0
			end
		,false)
	end
end

addEvent( "inFullShop", true )
addEventHandler( "inFullShop", getRootElement(), showBuyList )

addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
	    --triggerServerEvent ( "startCreateFillIconC", getLocalPlayer() )
		exports.customblips:createCustomBlip ( 2117.6298828125, 896.8583984375, 10, 10, "fill.png", 330 )
		exports.customblips:createCustomBlip ( 2637.005859375, 1129.4150390625, 10, 10, "fill.png", 330 ) 
		exports.customblips:createCustomBlip ( 1599.380859375, 2221.47265625, 10, 10, "fill.png", 330 )    
		exports.customblips:createCustomBlip ( 2187.7392578125, 2469.451171875, 10, 10, "fill.png", 330 )
	end
)
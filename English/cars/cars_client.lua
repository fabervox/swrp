GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Memo = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}
GUIEditor_Radio = {}
GUIEditor_Image = {}

GUIEditor_Progress = {}

taxiprice = 0

localPlayer = getLocalPlayer ()

local screenWidth, screenHeight = guiGetScreenSize()

function showCarBuyMenu( price )
	showCursor ( true )
	GUIEditor_Window[10] = guiCreateWindow(480,429,317,211,"This car is for sale",false)
	GUIEditor_Label[4] = guiCreateLabel(15,34,99,59,"Price:",false,GUIEditor_Window[10])
	guiLabelSetColor(GUIEditor_Label[4],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[4],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[4],"left",false)
	guiSetFont(GUIEditor_Label[4],"sa-header")
	GUIEditor_Label[5] = guiCreateLabel(121,40,149,53,""..tostring(price).."",false,GUIEditor_Window[10])
	guiLabelSetColor(GUIEditor_Label[5],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[5],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[5],"left",false)
	guiSetFont(GUIEditor_Label[5],"sa-header")
	GUIEditor_Label[6] = guiCreateLabel(281,41,22,59,"$",false,GUIEditor_Window[10])
	guiLabelSetColor(GUIEditor_Label[6],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[6],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[6],"left",false)
	guiSetFont(GUIEditor_Label[6],"sa-header")
	GUIEditor_Button[31] = guiCreateButton(85,104,144,49,"Buy",false,GUIEditor_Window[10])
	guiSetFont(GUIEditor_Button[31],"sa-header")
	GUIEditor_Button[32] = guiCreateButton(103,164,105,35,"Close",false,GUIEditor_Window[10])
	addEventHandler("onClientGUIClick", GUIEditor_Button[31],
		function ()
   			guiSetVisible ( GUIEditor_Window[10], false )
   			triggerServerEvent ( "acceptBuyCar", getLocalPlayer())
   			showCursor ( false )
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[32],
		function ()
   			guiSetVisible ( GUIEditor_Window[10], false )
   			toggleAllControls ( true )
   			setControlState ( "enter_exit", true )
   			showCursor ( false )
		end
    ,false)
end

addEvent( "showBuyCar", true )
addEventHandler( "showBuyCar", getRootElement(), showCarBuyMenu )

function showCarRentMenu( price )
	showCursor ( true )
	GUIEditor_Window[11] = guiCreateWindow(480,429,317,211,"This car is for rent",false)
	GUIEditor_Label[7] = guiCreateLabel(15,34,99,59,"Price:",false,GUIEditor_Window[11])
	guiLabelSetColor(GUIEditor_Label[7],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[7],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[7],"left",false)
	guiSetFont(GUIEditor_Label[7],"sa-header")
	GUIEditor_Label[8] = guiCreateLabel(121,40,149,53,""..tostring(price).."",false,GUIEditor_Window[11])
	guiLabelSetColor(GUIEditor_Label[8],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[8],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[8],"left",false)
	guiSetFont(GUIEditor_Label[8],"sa-header")
	GUIEditor_Label[9] = guiCreateLabel(281,41,22,59,"$",false,GUIEditor_Window[11])
	guiLabelSetColor(GUIEditor_Label[9],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[9],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[9],"left",false)
	guiSetFont(GUIEditor_Label[9],"sa-header")
	GUIEditor_Button[34] = guiCreateButton(85,104,144,49,"Rent",false,GUIEditor_Window[11])
	guiSetFont(GUIEditor_Button[31],"sa-header")
	GUIEditor_Button[35] = guiCreateButton(103,164,105,35,"Close",false,GUIEditor_Window[11])
	addEventHandler("onClientGUIClick", GUIEditor_Button[34],
		function ()
   			guiSetVisible ( GUIEditor_Window[11], false )
   			triggerServerEvent ( "acceptRentCar", getLocalPlayer())
   			showCursor ( false )
		end
    ,false)
    addEventHandler("onClientGUIClick", GUIEditor_Button[35],
		function ()
   			guiSetVisible ( GUIEditor_Window[11], false )
   			toggleAllControls ( true )
   			setControlState ( "enter_exit", true )
   			showCursor ( false )
		end
    ,false)
end

addEvent( "showRentCar", true )
addEventHandler( "showRentCar", getRootElement(), showCarRentMenu )
--
----addEventHandler( "createCarText", getRootElement(),
----    function( x, y, z, carnum, text,  )
----       local xp, yp = getScreenFromWorldPosition( x, y, z );
----       if x then
----          cartext[carnum] = dxDrawText( "LV "..tostring(text)..", xp, yp );
----       end
----    end
----)
--
function updateFuelBar ( fuel )
	guiProgressBarSetProgress(GUIEditor_Progress[1],tonumber(fuel))
end

addEvent( "updateFuel", true )
addEventHandler( "updateFuel", getRootElement(), updateFuelBar )

function showFuelBar ( theVehicle )
	GUIEditor_Label[1] = guiCreateLabel(542,817,104,50,"Fuel:",false)
	guiLabelSetColor(GUIEditor_Label[1],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
	guiSetFont(GUIEditor_Label[1],"sa-header")
	GUIEditor_Progress[1] = guiCreateProgressBar(641,825,233,36,false)
	guiProgressBarSetProgress(GUIEditor_Progress[1],tonumber(getElementData(theVehicle, "fuel")))
	guiSetVisible ( GUIEditor_Progress[1], true )
	guiSetVisible ( GUIEditor_Label[1], true )
end
addEventHandler( "onClientPlayerVehicleEnter", getRootElement(), showFuelBar )

function unShowFuelBar ( )
	guiSetVisible ( GUIEditor_Progress[1], false )
	guiSetVisible ( GUIEditor_Label[1], false )
	taxipirce = 0
	if getElementData ( localPlayer, "taxipas" ) > 0 then
		resetTimer ( taxitimer )
	end
end
addEventHandler( "onClientPlayerVehicleExit", getRootElement(), unShowFuelBar )

function startTaxiDrive ()
	taxitimer = setTimer ( upTaxiPrice, 5000, 0 )
	addEventHandler("onClientRender",root,
	    function()
	        dxDrawText("Price: "..tostring(taxiprice).."$",60, screenHeight-300, screenWidth, screenHeight,tocolor(255,255,255,255),2.0,"pricedown","left","top",false,false,false)
	    end
	)
end

addCommandHandler ("taxi", startTaxiDrive )

function upTaxiPrice ()
	taxiprice = taxiprice + 5
end

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function ()
		setTimer ( testPayerInCarFuel, 3000, 0 )
	end
)

function testPayerInCarFuel ()
	if isPedInVehicle ( localPlayer ) == false then
	    if getElementData ( localPlayer, "fuelshow" ) == 1 then
	    	unShowFuelBar ()
	        setElementData ( localPlayer, "fuelshow", 0 )
	    end
	end
end
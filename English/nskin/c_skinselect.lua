function CreateSelectorWindow()
wdwselector = guiCreateWindow(0.438,0.880,0.15,0.10,"",true)
guiWindowSetMovable(wdwselector,false)
btnLeft = guiCreateButton(0.0,0.4,0.200,0.350,"<-",true,wdwselector)
btnRight = guiCreateButton(0.76,0.4,0.200,0.350,"->",true,wdwselector)
btnSelect = guiCreateButton(0.30,0.4,0.400,0.350,"Select",true,wdwselector)
guiSetVisible(wdwselector, false)
end
local localPlayer = getLocalPlayer ()

function selectorenable ()
CreateSelectorWindow()
 addEventHandler("onClientGUIClick", btnLeft, clientSkinLeft, false)
 addEventHandler("onClientGUIClick", btnSelect, clientSkinSelect, false)
 addEventHandler("onClientGUIClick", btnRight, clientSkinRight, false)
	        if (wdwselector ~= nil) then
		         guiSetVisible(wdwselector, true)
				 triggerServerEvent("FrontCamera", getLocalPlayer())
	        end
			local x, y, z = getElementPosition(localPlayer)
			setElementData (localPlayer, "x", x )
			setElementData (localPlayer, "y", y )
			setElementData (localPlayer, "z", z )
			setElementData (localPlayer, "inter", getElementInterior ( localPlayer ))
			setElementData (localPlayer, "dim", getElementDimension ( localPlayer ))
			setElementPosition(localPlayer, 217.6044,-98.7226,1005.2578 )
			setElementInterior ( localPlayer, 15 )
			setElementRotation ( localPlayer, 210 )
			--setElementInterior ( localPlayer, 0 )
			--setElementPosition ( localPlayer, -1691.1279296875,2046.3740234375,37.14387512207 )
			setElementDimension(localPlayer, math.random(0,10000))
	        showCursor(true)
end
addEvent( "onGreeting", true )
addEventHandler( "onGreeting", getRootElement(), selectorenable )
--addCommandHandler("skin", selectorenable, false, false)

function clientSkinSelect(button)
		guiSetVisible(wdwselector, false)
		showCursor(false)
		setElementInterior ( localPlayer, getElementData ( localPlayer, "inter" ) )
		setElementPosition ( localPlayer, getElementData ( localPlayer, "x" ), getElementData ( localPlayer, "y" ), getElementData ( localPlayer, "z" ) )
		setElementDimension(localPlayer, getElementData ( localPlayer, "dim" ))
		setCameraInterior ( localPlayer, getElementData ( localPlayer, "inter" ) )
		outputChatBox ("Информация: Поздравляю вас с покупкой новго костюма, который обошелся вам в 150 баксов!", 255,204,0 )
		takePlayerMoney ( 150 )
		triggerServerEvent("SkinSelected", getLocalPlayer())
end

function clientSkinRight(button)
	triggerServerEvent("SkinRight", getLocalPlayer())
end

function clientSkinLeft(button)
	triggerServerEvent("SkinLeft", getLocalPlayer())
end

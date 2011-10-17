function camf()
--setPedRotation(source, 157)
--setCameraInterior ( source, 0 )
	setCameraInterior ( source, 15 )
	setCameraMatrix(source, 213.8769,-99.2441,1005.2578, 217.6044,-98.7226,1005.2578 )
--setCameraMatrix( source, -1695.2548828125,2036.193359375,35.795997619629,-1691.1279296875,2046.3740234375,37.14387512207)
end
addEvent("FrontCamera", true)
addEventHandler("FrontCamera", getRootElement(), camf)

function selected()
fadeCamera(source, true)
setCameraTarget(source, source)
exports.busineses:giveToBizValue( getElementData ( source, "busid" ), 50 )
end
addEvent("SkinSelected", true)
addEventHandler("SkinSelected", getRootElement(), selected)

function skinright()
local skin = getPedSkin(source)
if (skin == 0) then
setPedSkin(client, 7)
elseif (skin == 7) then
setPedSkin(client, 9)
elseif (skin == 41) then
setPedSkin(client, 43)
elseif (skin == 64) then
setPedSkin(client, 66)
elseif (skin == 85) then
setPedSkin(client, 87)
elseif(skin == 118) then
setPedSkin(client, 120)
elseif(skin == 148) then
setPedSkin(client, 150)
elseif(skin == 207) then
setPedSkin(client, 209)
elseif(skin == 238) then
setPedSkin(client, 240)
elseif(skin == 264) then
setPedSkin(client, 274)
elseif(skin == 288) then
setPedSkin(client, 0)
else
setPedSkin(source, skin+1)
end
end
addEvent("SkinRight", true)
addEventHandler("SkinRight", getRootElement(), skinright)

function skinleft()
local skin = getPedSkin(source)
if (skin == 7) then
setPedSkin(client, 0)
elseif (skin == 9) then
setPedSkin(client, 7)
elseif (skin == 43) then
setPedSkin(client, 41)
elseif (skin == 66) then
setPedSkin(client, 64)
elseif (skin == 87) then
setPedSkin(client, 85)
elseif(skin == 120) then
setPedSkin(client, 118)
elseif(skin == 150) then
setPedSkin(client, 148)
elseif(skin == 209) then
setPedSkin(client, 207)
elseif(skin == 240) then
setPedSkin(client, 238)
elseif(skin == 274) then
setPedSkin(client, 264)
elseif(skin == 0) then
setPedSkin(client, 288)
else
setPedSkin(source, skin-1)
end
end
addEvent("SkinLeft", true)
addEventHandler("SkinLeft", getRootElement(), skinleft)          

function clothShopEvent ( source )
	triggerClientEvent ( source, "onGreeting", getRootElement() )
end

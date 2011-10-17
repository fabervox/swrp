function playLVLUpSoundC ()
	playSound("sounds/lvlup.mp3") --Play wasted.mp3 from the sounds folder
	setSoundVolume(sound, 3) -- set the sound volume to 50%
	addEventHandler("onClientRender",root,showDXLevelUpText)
	setTimer (
	function ()
		removeEventHandler ( "onClientRender",root,showDXLevelUpText )
	end, 3500, 1 )


end

addEvent( "playLVLUpSound", true )
addEventHandler( "playLVLUpSound", getRootElement(), playLVLUpSoundC )

function showDXLevelUpText ()
    dxDrawText("LEVEL UP!",2.0,184.0,510.0,240.0,tocolor(255,0,0,255),3.0,"bankgothic","left","center",true,false,false)
end
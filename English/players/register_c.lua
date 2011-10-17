localPlayer = getLocalPlayer ( )

GUIEditor_Memo = {}
GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Checkbox = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}
GUIEditor_Radio = {}

function startRegistration ()
	GUIEditor_Window[1] = guiCreateWindow(519,244,387,462,"Registration",false)
	GUIEditor_Label[1] = guiCreateLabel(31,25,339,19,"_______________________IC_______________________",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[1],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
	guiSetFont(GUIEditor_Label[1],"default-bold-small")
	GUIEditor_Radio[1] = guiCreateRadioButton(141,55,47,19,"Male",false,GUIEditor_Window[1])
	guiRadioButtonSetSelected(GUIEditor_Radio[1],true)
	GUIEditor_Radio[2] = guiCreateRadioButton(195,55,59,19,"Female",false,GUIEditor_Window[1])
	GUIEditor_Edit[1] = guiCreateEdit(199,81,50,22,"",false,GUIEditor_Window[1])
	GUIEditor_Label[2] = guiCreateLabel(163,83,29,22,"Age:",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[2],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[2],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[2],"left",false)
	guiSetFont(GUIEditor_Label[2],"clear-normal")
	GUIEditor_Label[3] = guiCreateLabel(120,112,75,18,"Nationality:",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[3],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[3],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[3],"left",false)
	guiSetFont(GUIEditor_Label[3],"clear-normal")
	GUIEditor_Edit[2] = guiCreateEdit(199,109,94,25,"",false,GUIEditor_Window[1])
	GUIEditor_Label[4] = guiCreateLabel(31,183,339,19,"_______________________OOC_______________________",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[4],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[4],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[4],"left",false)
	guiSetFont(GUIEditor_Label[4],"default-bold-small")
	GUIEditor_Label[5] = guiCreateLabel(127,212,65,19,"Your age:",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[5],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[5],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[5],"left",false)
	guiSetFont(GUIEditor_Label[5],"clear-normal")
	GUIEditor_Edit[3] = guiCreateEdit(199,208,40,22,"",false,GUIEditor_Window[1])
	GUIEditor_Label[6] = guiCreateLabel(158,239,36,18,"ICQ:",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[6],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[6],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[6],"left",false)
	guiSetFont(GUIEditor_Label[6],"clear-normal")
	GUIEditor_Edit[4] = guiCreateEdit(199,237,94,25,"",false,GUIEditor_Window[1])
	GUIEditor_Label[7] = guiCreateLabel(142,276,47,19,"e-mail:",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[7],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[7],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[7],"left",false)
	guiSetFont(GUIEditor_Label[7],"clear-normal")
	GUIEditor_Edit[5] = guiCreateEdit(199,272,94,25,"",false,GUIEditor_Window[1])
	GUIEditor_Label[8] = guiCreateLabel(118,310,69,17,"Password:",false,GUIEditor_Window[1])
	guiLabelSetColor(GUIEditor_Label[8],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[8],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[8],"left",false)
	guiSetFont(GUIEditor_Label[8],"clear-normal")
	GUIEditor_Edit[6] = guiCreateEdit(199,306,94,25,"",false,GUIEditor_Window[1])
	GUIEditor_Button[1] = guiCreateButton(133,406,111,39,"Next",false,GUIEditor_Window[1])
	GUIEditor_Checkbox[1] = guiCreateCheckBox(88,374,220,22,"I know that it is server is RP",false,false,GUIEditor_Window[1])
	guiSetVisible ( GUIEditor_Window[1], true )
	showCursor(true)
	local click1 = 0
	local click2 = 0
	local click3 = 0
	local click4 = 0
	local click5 = 0
	local click6 = 0
	addEventHandler ( "onClientGUIClick", GUIEditor_Edit[1], 
		function ()
			if click1 == 0 then
	 			outputChatBox ("Информация: Здесь введите возраст вашего персонажа", 0,153,51 )				 		
	 			click1 = 1
	 		end
		end
	, false )
	addEventHandler ( "onClientGUIClick", GUIEditor_Edit[2], 
		function ()
			if click2 == 0 then
	 			outputChatBox ("Информация: Здесь напишите национальность вашего персонажа", 0,153,51 )
	 			click2 = 1
	 		end
		end
	, false )
	addEventHandler ( "onClientGUIClick", GUIEditor_Edit[3], 
		function ()
			if click3 == 0 then
	 			outputChatBox ("Информация: Здесь, пожалуйста, введите свой реальный возраст", 0,153,51 )
	 			click3 = 1
	 		end
		end
	, false )
	addEventHandler ( "onClientGUIClick", GUIEditor_Edit[5], 
		function ()
			if click4 == 0 then
	 			outputChatBox ("Информация: Здесь введите свой e-mail. Если вы забудете свой пароль от аккаунта, то мы вышлим вам его на e-mail", 0,153,51 )
	 			click4 = 1
	 		end
		end
	, false )
	addEventHandler ( "onClientGUIClick", GUIEditor_Edit[4], 
		function ()
			if click5 == 0 then
	 			outputChatBox ("Информация: Здесь введите свой icq (если есть)", 0,153,51 )
	 			click5 = 1
	 		end
		end
	, false )
	addEventHandler ( "onClientGUIClick", GUIEditor_Edit[6], 
		function ()
			if click6 == 0 then
	 			outputChatBox ("Информация: Здесь введите свой пароль", 0,153,51 )
	 			click6 = 1
	 		end
		end
	, false )
	addEventHandler("onClientGUIClick", GUIEditor_Button[1],
		function ()	
			if guiCheckBoxGetSelected ( GUIEditor_Checkbox[1] ) then
				local age = guiGetText ( GUIEditor_Edit[1] )
				local nationality = guiGetText ( GUIEditor_Edit[2] )
				local page = guiGetText ( GUIEditor_Edit[3] )
				local icq = guiGetText ( GUIEditor_Edit[4] )
				local mail = guiGetText ( GUIEditor_Edit[5] )
				local password = guiGetText ( GUIEditor_Edit[6] )
				local sex = 0
				if guiRadioButtonGetSelected( GUIEditor_Radio[1] ) then sex = 1 end
				if guiRadioButtonGetSelected( GUIEditor_Radio[2] ) then sex = 2 end
				if password ~= "" and age~="" and nationality ~= "" and page ~= "" then
		--			registerPlayer ( password, age, nat, page, icq, mail, sex  )
					triggerServerEvent ( "finRegisterPlayer", getLocalPlayer(), password, age, nationality, page, icq, mail, sex)
					guiSetVisible ( GUIEditor_Window[1], false )
					nextRulesPlayer ()  
				else
					outputChatBox ("Ошибка: Строки Пароль, Возраст, Национальность и Ваш возраст должны быть заполнены! ",source, 255,255,127 )
				end
			else
				outputChatBox ("Ошибка: Вы должны подтвердить что знаете, что это РП сервер! ",source, 255,255,127 )
			end
		end
	,false)
end

--addEvent( "startRegestration", true )
--addEventHandler( "startRegestration", getRootElement(), startRegistration )
--
addCommandHandler ( "regist", startRegistration ) -- add the command handler

function nextRulesPlayer ()  
	GUIEditor_Window[2] = guiCreateWindow(442,341,545,303,"Our rules",false)
	GUIEditor_Memo[1] = guiCreateMemo(16,22,517,237,"",false,GUIEditor_Window[2])
	guiMemoSetReadOnly(GUIEditor_Memo[1],true)
	GUIEditor_Button[2] = guiCreateButton(171,268,193,26,"Next",false,GUIEditor_Window[2])
	guiSetVisible ( GUIEditor_Window[2], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[2],
		function ()	
			nextFinishReg () 
			guiSetVisible ( GUIEditor_Window[2], false )
		end
	,false)
end

function nextFinishReg ()
	GUIEditor_Window[3] = guiCreateWindow(509,377,408,161,"Registration complete!",false)
	GUIEditor_Button[3] = guiCreateButton(233,102,123,33,"Finish",false,GUIEditor_Window[3])
	GUIEditor_Label[9] = guiCreateLabel(59,30,317,60,"Your registration is complete!",false,GUIEditor_Window[3])
	guiLabelSetColor(GUIEditor_Label[9],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[9],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[9],"left",false)
	GUIEditor_Button[4] = guiCreateButton(69,102,123,33,"Start introduction",false,GUIEditor_Window[3])
	guiSetVisible ( GUIEditor_Window[3], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[3],
		function ()	
			guiSetVisible ( GUIEditor_Window[3], false ) 
			--showCursor(false)
			showLoginPlayer()
   			outputChatBox ("Подсказка: Введите свой пароль и нажмите кнопку Login", 255,255,255 )
		end
	,false)
	addEventHandler("onClientGUIClick", GUIEditor_Button[4],
		function ()
			outputChatBox ( "",  255,204,102 )
			outputChatBox ( "------------------------------------------------",  204,0,255 )
			outputChatBox ( "Добро пожаловать в Лас Вентурас!",  255,204,0 )
			outputChatBox ( "Лас Вентурас - уникальный город! В нем за несколько минут можно выиграть миллионы долларов, но еще быстрее можно их проиграть.",  255,204,0 )
			outputChatBox ( "У нас нету места голоду, нищете, плохому настроению!",  255,204,102 )
			outputChatBox ( "Но что вы хотите получить от нашего города? Счастье, деньги, хорошую машину, завести семью, или просто хорошо провести время? ",  255,204,102 )
			outputChatBox ( "Что ж, все может быть. Но сначала пройдите обучение.",  255,204,102 )
			outputChatBox ( "------------------------------------------------",  204,0,255 )
            setTimer ( setStage1, 20000, 1 )
			guiSetVisible ( GUIEditor_Window[3], false )
			showCursor(false)
		end
	,false)
end

function setStage1 ( )
	setCameraMatrix ( 1176.9482421875,1379.4423828125,15.812507629395, 1167.55078125,1353.130859375,10.921875 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "Сначала я бы тебе порекомедовал отправится за лицензией а вождение. ",  255,204,0 )
	outputChatBox ( "Её можно получить в нашей автошколе, ты сейчас как раз её и видишь.",  255,204,0 )
	outputChatBox ( "Беги туда, там тебе все обьяснят, разжуют, и ты обязательно получишь водительскую лицензию! Кстати, если лень бежать, то вызови таксиста",  255,204,102 )
    outputChatBox ( "------------------------------------------------",  204,0,255 )
    setTimer ( setStage2, 15000, 1 )
end

function setStage2 ( )
	setCameraMatrix ( 1719.9638671875,1868.2412109375,10.8203125, 1742.017578125,1906.6552734375,10.8203125 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "Затем можешь отправится на авторынок, где можно дешего арендовать отличую машину ",  255,204,0 )
    outputChatBox ( "------------------------------------------------",  204,0,255 )
    setTimer ( setStage3, 7000, 1 )
end

function setStage3 ( )
	setCameraMatrix ( 2110.2392578125,2085.9521484375,15.8203125, 2085.783203125,2087.9736328125,11.057899475098 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "После того, как арендуешь машину - можно сьездить в магазин 24/7. В нем есть абсолютно все.",  255,204,0 )
    outputChatBox ( "------------------------------------------------",  204,0,255 )
    setTimer ( setStage4, 7000, 1 )
end

function setStage4 ( )
	setCameraMatrix ( 2518.0654296875,2090.552734375,10.8203125, 2539.5107421875,2084.203125,10.8203125 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "Если тебе по душе больше бандитская жизнь, то направляйся прямо в одну из множества аммуниций!",  255,204,0 )
    outputChatBox ( "------------------------------------------------",  204,0,255 )
    outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
    setTimer ( setStage5, 7000, 1 )
end


function setStage5 ( )
	setCameraMatrix ( 2387.4111328125,2725.10546875,15.8203125, 2342.255859375,2772.890625,10.8203125 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "Если у тебя кончилась ВСЕ деньги, то отправляйся работать!",  255,204,0 )
	outputChatBox ( "В нашем городе полно работ! Вот например сейчас ты видишь работу чистильщиком улиц.",  255,204,0 )
    outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "" )
   	outputChatBox ( "" )
    setTimer ( setStage6, 15000, 1 )
end

function setStage6 ( )
	setCameraMatrix ( 2203.5634765625,2443.4345703125,10.8203125, 2267.2587890625,2457.5126953125,10.8203125 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "Надоела работа на себя? Ну тогда у нас есть множество фракций, которые с радостью примят тебя!",  255,204,0 )
	outputChatBox ( "Сейчас ты видишь базу полиции и ФБР",  255,204,0 )
    outputChatBox ( "------------------------------------------------",  204,0,255 )
    outputChatBox ( "" )
   	outputChatBox ( "" )
    setTimer ( setStage7, 10000, 1 )
end

function setStage7 ( )
	setCameraMatrix ( 2131.9765625,1909.2822265625,25.671875, 2017.01171875,1912.1953125,12.333491325378 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "------------------------------------------------",  204,0,255 )
	outputChatBox ( "А это база Русской Мафии",  255,204,0 )
    outputChatBox ( "------------------------------------------------",  204,0,255 )
    setTimer ( setStage8, 4000, 1 )
    outputChatBox ( "" )
   	outputChatBox ( "" )
end

function setStage8 ( )
	setCameraMatrix ( 2056.275390625,793.0009765625,30.8125, 2057.228515625,1689.4091796875,11.307146072388 )
	outputChatBox ( "" )
	outputChatBox ( "" )
	outputChatBox ( "" )
   	outputChatBox ( "" )
   	outputChatBox ( "" )
	outputChatBox ( "Это все, что я хотел тебе рассказать. Если возникнут еще вопросы, то можешь спросить ответы у хелперов, или посмотреть на форуме инструкции.",  255,204,0 )
    outputChatBox ( "А теперь отправляйся покорять Лас Вентурас! Удачи тебе!",  204,0,255 )
    outputChatBox ( "" )
   	outputChatBox ( "" )
    setTimer ( setStage9, 10000, 1 )
end

function setStage9 ()
	showLoginPlayer ()
	outputChatBox ("Подсказка: Введите свой пароль и нажмите кнопку Login", 255,255,255 )
end
--
--
--
function showRegisterPlayerC ()
	showCursor ( true )
	GUIEditor_Window[4] = guiCreateWindow(568,351,258,160,"Not registered",false)
	GUIEditor_Button[4] = guiCreateButton(89,96,85,31,"Registration",false,GUIEditor_Window[4])
	guiSetFont(GUIEditor_Button[4],"default-bold-small")
	GUIEditor_Label[10] = guiCreateLabel(38,51,201,16,"This account not registered",false,GUIEditor_Window[4])
	guiLabelSetColor(GUIEditor_Label[10],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[10],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[10],"left",false)
	guiSetFont(GUIEditor_Label[10],"clear-normal")
	guiSetVisible ( GUIEditor_Window[4], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[4],
		function ()
			startRegistration ()
			guiSetVisible ( GUIEditor_Window[4], false )
		end
	,false)
end

addEvent( "showRegisterPlayerS", true )
addEventHandler( "showRegisterPlayerS", getRootElement(), showRegisterPlayerC )

function showLoginPlayer ()
	showCursor ( true )
	GUIEditor_Window[5] = guiCreateWindow(628,326,167,168,"Login",false)
	GUIEditor_Edit[10] = guiCreateEdit(36,70,101,26,"",false,GUIEditor_Window[5])
	GUIEditor_Button[5] = guiCreateButton(42,119,84,27,"Login",false,GUIEditor_Window[5])
	GUIEditor_Label[11] = guiCreateLabel(14,35,145,17,"This account is registered",false,GUIEditor_Window[5])
	guiLabelSetColor(GUIEditor_Label[1],255,255,255)
	guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
	guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
	guiSetVisible ( GUIEditor_Window[5], true )
	addEventHandler("onClientGUIClick", GUIEditor_Button[5],
		function ()
			guiSetVisible ( GUIEditor_Window[5], false )
			triggerServerEvent ( "LoadAccountС", getLocalPlayer(), guiGetText ( GUIEditor_Edit[10] ) )
			showCursor ( false )
		end
	,false)
end

addEvent( "showLoginPlayerS", true )
addEventHandler( "showLoginPlayerS", getRootElement(), showLoginPlayer )

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
	function ()
    	triggerServerEvent ( "preLoadPlayerAccountC", getLocalPlayer())
	end
)

factions={}

function loadFactions ()
  local root = xmlLoadFile ("factions.xml")
  local factionroot = xmlFindChild (root,"factiones",0)
  if (factionroot) then
   	  for i,v in ipairs (xmlNodeGetChildren(factionroot)) do
      local name = xmlNodeGetAttribute (v,"name")
	  local leader = tonumber(xmlNodeGetAttribute (v,"leader"))
	  local fnum = tonumber(xmlNodeGetAttribute (v,"num"))
      local spawnx = tonumber(xmlNodeGetAttribute (v,"x"))
      local spawny = tonumber(xmlNodeGetAttribute (v,"y"))
      local spawnz = tonumber(xmlNodeGetAttribute (v,"z"))
	  local rang1 = xmlNodeGetAttribute (v,"rang1")
	  local rang2 = xmlNodeGetAttribute (v,"rang2")
	  local rang3 = xmlNodeGetAttribute (v,"rang3")
      local rang4 = xmlNodeGetAttribute (v,"rang4")
      local rang5 = xmlNodeGetAttribute (v,"rang5")
	  local skin1 = tonumber(xmlNodeGetAttribute (v,"skin1"))
	  local skin2 = tonumber(xmlNodeGetAttribute (v,"skin2"))
	  local skin3 = tonumber(xmlNodeGetAttribute (v,"skin3"))
	  local skin4 = tonumber(xmlNodeGetAttribute (v,"skin4"))
	  local skin5 = tonumber(xmlNodeGetAttribute (v,"skin5"))
	  local ftype = tonumber(xmlNodeGetAttribute (v,"type"))
	  local fmoney = tonumber(xmlNodeGetAttribute (v,"money"))
	  factions[i]={name,leader,fnum,spawnx,spawny,spawnz,rang1,rang2,rang3,rang4,rang5,skin1,skin2,skin3,skin4,skin5,ftype,fmoney}
    end
  end
  outputDebugString ("Factions loaded!")
end

function saveFactions ()
  local root = xmlLoadFile ("factions.xml")
  local factionroot = xmlFindChild (root,"factiones",0)
  if (factionroot) then
   	  for i,v in ipairs (xmlNodeGetChildren(factionroot)) do
	      xmlNodeSetAttribute ( v, "name", factions[i][1] )
	      xmlNodeSetAttribute ( v, "leader", factions[i][2] )
	      xmlNodeSetAttribute ( v, "num", factions[i][3] )
	      xmlNodeSetAttribute ( v, "x", factions[i][4] )
		  xmlNodeSetAttribute ( v, "y", factions[i][5] )
		  xmlNodeSetAttribute ( v, "z", factions[i][6] )
		  xmlNodeSetAttribute ( v, "rang1", factions[i][7] )
		  xmlNodeSetAttribute ( v, "rang2", factions[i][8] )
		  xmlNodeSetAttribute ( v, "rang3", factions[i][9] )
		  xmlNodeSetAttribute ( v, "rang4", factions[i][10] )
		  xmlNodeSetAttribute ( v, "rang5", factions[i][11] )
		  xmlNodeSetAttribute ( v, "skin1", factions[i][12] )
		  xmlNodeSetAttribute ( v, "skin2", factions[i][13] )
		  xmlNodeSetAttribute ( v, "skin3", factions[i][14] )
		  xmlNodeSetAttribute ( v, "skin4", factions[i][15] )
		  xmlNodeSetAttribute ( v, "skin5", factions[i][16] )
		  xmlNodeSetAttribute ( v, "type", factions[i][17] )
		  xmlNodeSetAttribute ( v, "money", factions[i][18] )
	    end
	    xmlSaveFile(root)
    end
    outputDebugString ("Factions saved!")
end

addEventHandler ( "onResourceStart", getResourceRootElement(), loadFactions )

function getFactionInfo ( fact, inf )
	return factions[fact][inf]
end

function setFactionInfo ( fact, inf, valve )
	factions[fact][inf] = valve
end

function giveFactionMoney ( fact, value )
	factions[fact][18] = factions[fact][18] + value
end

function setPlayerLeader ( source, cmd, ident, faction )
 	local accName = getAccountName ( getPlayerAccount ( source ) )
    if isObjectInACLGroup ( "user." .. playerName, aclGetGroup ( "Admin" ) ) then
    	for id, player in ipairs ( getElementsByType ( "player" ) ) do
    		if ident == getElementData ( player, "playerid" ) then
				setElementData ( player, "faction", tonumber(faction) )
				setElementData ( player, "rank", 5 )
				setElementModel ( player, factions[tonumber(faction)][16] )
			end 
		end
	end
end
addCommandHandler ("makeleader", setPlayerLeader)
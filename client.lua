------------------------CREDITS------------------------
-------- Script made by Vlad, DevStudios Owner --------
--         Script made for Diamond Romania RP        --
--          Site: https://devstudios.store           --
--        Forum: http://forum.devstudios.store       --
--   Copyright 2019 ©DevStudios. All rights served   --
-------------------------------------------------------
inSafeZone = false
safeZone = nil

coords = {
	["showroom"] = {-43.726108551026,-1101.1746826172,35.20348739624, 50},
	["spital"] = {-473.91375732422,-338.5883178711,35.20181274414, 45},
	["politie"] = {439.81991577148,-990.33282470704,43.691638946534, 60},
	["f.b.i"] = {129.02937316894,-763.58184814454,45.752010345458, 70},
	["swat"] = {-1102.8555908204,-262.93338012696,37.739303588868, 35},
    ["primarie"] = {-538.79608154296,-216.25761413574,37.649787902832, 120}
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
		local px,py,pz = playerPos.x, playerPos.y, playerPos.z

		for i, v in pairs(coords)do
			x, y, z = v[1], v[2], v[3]
			radius = v[4]

			if(Vdist(x, y, z,px,py,pz) < radius)then
				inSafeZone = true
				safeZone = i
			end
		end
		if(safeZone ~= nil)then
			x2, y2, z2 = coords[safeZone][1], coords[safeZone][2], coords[safeZone][3]
			radius2 = coords[safeZone][4]
			if(Vdist(x2, y2, z2,px,py,pz) > radius2)then
				inSafeZone = false
				safeZone = nil
			end
		end
	end
end)

function DrawSafeAlert(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if (inSafeZone == true)then
			DisableControlAction(1, 37, true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DrawSafeAlert("~w~You are in ~y~SafeZone~w~, ~y~combat ~w~is not allowed!", 1)
			SetEntityInvincible(GetPlayerPed(-1), true)
            SetPlayerInvincible(PlayerId(), true)
            ClearPedBloodDamage(GetPlayerPed(-1))
            ResetPedVisibleDamage(GetPlayerPed(-1))
            ClearPedLastWeaponDamage(GetPlayerPed(-1))
            SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
            SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
            SetEntityCanBeDamaged(GetPlayerPed(-1), false)
        else
            SetEntityInvincible(GetPlayerPed(-1), false)
            SetPlayerInvincible(PlayerId(), false)
            ClearPedLastWeaponDamage(GetPlayerPed(-1))
            SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
            SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
            SetEntityCanBeDamaged(GetPlayerPed(-1), true)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if (inSafeZone == false) then
				TriggerServerEvent('vRP:restart')
			break
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if (inSafeZone == true)then
			if IsDisabledControlJustPressed(1, 37) then
				TriggerServerEvent('vRP:weaponmsg')
			end
		end
	end
end)

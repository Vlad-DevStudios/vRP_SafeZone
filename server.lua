------------------------CREDITS------------------------
-------- Script made by Vlad, DevStudios Owner --------
--         Script made for Diamond Romania RP        --
--          Site: https://devstudios.store           --
--        Forum: http://forum.devstudios.store       --
--   Copyright 2019 ©DevStudios. All rights served   --
-------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_safezone")

RegisterServerEvent('vRP:restart')
AddEventHandler('vRP:restart', function ()
    local user_id = vRP.getUserId({source})
    local cfg = getConfig()
    vRPclient.notify(user_id,{cfg.message.restart})
    vRPclient.notify(user_id,{"~w~[~y~Credits~w~] The ~y~SafeZone ~w~script was made by ~y~Vlad-DevStudios~w~!"})
    vRPclient.notify(user_id,{"~w~[~y~Sites~w~] Site ~y~https://devstudios.store~w~   Forum: ~y~http://forum.devstudios.store"})
    vRPclient.notify(user_id,{"~w~[~y~Discord~w~] Discord: ~y~Vlad-DevStudios#8668"})
    return false
end)

RegisterServerEvent('vRP:weaponmsg')
AddEventHandler('vRP:weaponmsg', function ()
    local user_id = vRP.getUserId({source})
    local cfg = getConfig()
    vRPclient.notify(user_id,{cfg.message.weaponmsg})
end)
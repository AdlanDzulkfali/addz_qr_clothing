local QRCore = exports['qr-core']:GetCoreObject()

QRCore.Functions.CreateCallback('addz_qr_clothing:server_getPlayerSkin', function(source, cb)
    local _source = source
    local xPlayer = QRCore.Functions.GetPlayer(_source)

    local playerCid = xPlayer.PlayerData.citizenid
    local skins = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ?', {playerCid})
    cb(skins[1])
end)
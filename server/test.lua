local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('onTestLog', function()
  local src = source

  local Player = QBCore.Functions.GetPlayer(src)

  exports.fivemanage_lib:LogMessage("info", "Image taken again", {
    ["player"] = Player.PlayerData.citizenid,
    ["playerSrc"] = src,
  })
end)
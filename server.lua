ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("zn-paraver")
AddEventHandler("zn-paraver", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local para = math.random(Config.MinimumPara, Config.MaximumPara)

    xPlayer.addMoney(para)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		print('[^2zn-denizticareti^0] - Started!')
	end
end)
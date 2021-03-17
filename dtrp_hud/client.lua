local ESX = nil
local voice = {default = 8.0, shout = 15.0, whisper = 3.0, current = 0} 
local Keys = {

    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,

    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,

    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,

    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,

    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,

    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,

    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,

    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,

    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118

}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	TriggerEvent('es:setMoneyDisplay', 0.0)
	ESX.UI.HUD.SetDisplay(0.0)

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

AddEventHandler("onClientMapStart", function()
	NetworkSetTalkerProximity(voice.default)
	SendNUIMessage({action = "setVoiceLevel", level = 2});
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	local data = xPlayer
	local accounts = data.accounts
	for k, v in pairs(accounts) do
		local account = v
		Citizen.CreateThread(function()
			if account.name == "black_money" then
				if account.money > 0 then
				SendNUIMessage({action = "setBlackMoney", black = account.money})
				else
				SendNUIMessage({action = "hideBlackMoney"})
				end
			end
			while true do
				Citizen.Wait(10)
				if ESX.GetPlayerData().money ~= nil then
					SendNUIMessage({action = "setMoney", money = ESX.GetPlayerData().money})
				end

			end
		end)
	end
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "black_money" then
		if account.money > 0 then
			SendNUIMessage({action = "setBlackMoney", black = account.money})
		else
			SendNUIMessage({action = "hideBlackMoney"})
	    end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
		
		if IsControlJustPressed(1, 243) and IsControlPressed(1, 243) then
            voice.current = (voice.current + 1) % 3
            if voice.current == 0 then
                NetworkSetTalkerProximity(voice.default)
                SendNUIMessage({action = "setVoiceLevel", level = 2});
				voiceCoords = voice.default
            elseif voice.current == 1 then
                NetworkSetTalkerProximity(voice.shout)
                SendNUIMessage({action = "setVoiceLevel", level = 3});
				voiceCoords = voice.shout
            elseif voice.current == 2 then
                NetworkSetTalkerProximity(voice.whisper)
                SendNUIMessage({action = "setVoiceLevel", level = 1});
				voiceCoords = voice.whisper
            end
			

        end
    end
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(e)
	SendNUIMessage({action = "setMoney", money = e})
end)




local _break = "<br>"
local linestrike = "<hr>"

function color(color, text) return "<font color="..color..">"..text.."</font>" end
function underlined(text) return "<u>"..text.."</u>" end
function bold(text) return "<strong>"..text.."</strong>" end
function small(text) return "<small>"..text.."</small>" end
function strikethrough(text) return "<del>"..text.."</del>" end
function italic(text) return "<i>"..text.."</i>" end
function big(text) return "<big>"..text.."</big>" end

-----------------------------------------------------------------------



RegisterNetEvent("grv_notifyannounce:display")
AddEventHandler("grv_notifyannounce:display", function(title, msg, time, sound)
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
	ShowNotify(title, msg, time, sound)
end)

function ShowNotify(title, msg, time, sound)
	if msg ~= nil and msg ~= "" then
		if time == nil then
			time = Config.DefaultFadeOut
		end
	
		if title == nil then
			title = "Notification"
		end

		TriggerEvent('message:show', title, msg)
		if sound == true then
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
		end
		Wait(time)
		TriggerEvent('message:hide')
	else
	end
end	
	

RegisterNetEvent('message:show')
AddEventHandler('message:show', function(title, msg)
	SendNUIMessage({
      type = "message",
      display = true,
	  title = title,
	  message = msg
    })
end)

RegisterNetEvent('message:hide')
AddEventHandler('message:hide', function()
	SendNUIMessage({
      type = "message",
      display = false,
	  title = nil,
	  message = nil
    })
 end)
  
AddEventHandler("onResourceStart", function(resource) --keeps the message hidden as long as it is not called.
	if resource == GetCurrentResourceName() then
		TriggerEvent("message:hide", true)
	end
end)

AddEventHandler("onClientResourceStart", function(resource) --hides the boxes if someone connects
	if (resource == GetCurrentResourceName()) then
		TriggerEvent("message:hide", true)
	else
		return
	end
end)

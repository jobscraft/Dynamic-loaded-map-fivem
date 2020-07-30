local iplslist={}
local id = 0
RegisterNetEvent('DLM:RegisterIpl')
AddEventHandler('DLM:RegisterIpl', function(ipl, DefaultState)
    if not IsUsed(ipl) then
        id = id +1
        if DefaultState then
            iplslist[id] = {
                name = ipl,
                state = true,
                CLstate = false
            }
        else
            iplslist[id] = {
                name = ipl,
                state = false,
                CLstate = false
            }
        end
    end

end)

RegisterNetEvent('DLM:RegisterIplByArray')
AddEventHandler('DLM:RegisterIplByArray', function(ipls)
    for i in pairs(ipls) do

        if not IsUsed(ipls[i].name) then
            id = id +1
                iplslist[id] = {
                    name = ipls[i].name,
                    state = ipls[i].state,
                    CLstate = false
                }
        else
            print("[27] WARNING ! trying to register similar IPL ")
        end
    end
end)

RegisterNetEvent('DLM:UpdateSv')
AddEventHandler('DLM:UpdateSv', function(ipl,state)
    if IsUsed(ipl) then
        for i in pairs(iplslist) do
            if iplslist[i].name == ipl then
                iplslist[i].state = state
            end 
        end
    end
    Citizen.Wait(50)
    TriggerClientEvent("DLM:UpdateCl",-1,iplslist)
end)
RegisterNetEvent('DLM:UpdateSvByArray')
AddEventHandler('DLM:UpdateSvByArray', function(ipls)

    for i in pairs(ipls) do
        if IsUsed(ipls[i].name) then
            for j in pairs(iplslist) do
                if iplslist[j].name == ipls[i].name then
                    iplslist[j].state = ipls[i].state
                end
            end
        end

    end
    Citizen.Wait(50)
    TriggerClientEvent("DLM:UpdateCl",-1,iplslist)

end)

RegisterNetEvent('DLM:Connect')
AddEventHandler('DLM:Connect', function()
    TriggerClientEvent("DLM:UpdateCl",source,iplslist)
end)

function IsUsed(name)
    for i in pairs(iplslist) do
        if iplslist[i].name == name then
            return true
        end
    end
    return false
end
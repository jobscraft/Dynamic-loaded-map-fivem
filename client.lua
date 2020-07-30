local ipls={}

RegisterNetEvent("DLM:UpdateCl")
AddEventHandler("DLM:UpdateCl", function(IplsList)
    ipls = IplsList
end)

Citizen.CreateThread(function()
    Citizen.Wait(5000)  --waiting ipl array from server
    for i in pairs(ipls) do
        RemoveIpl(ipls[i].name)
    end 
end)

Citizen.CreateThread(function()
    TriggerServerEvent("DLM:Connect")
    while true do
        Citizen.Wait(1000)
        for i in pairs(ipls) do
            if IsIplActive(ipls[i].name) then
                ipls[i].CLstate = true
            else
                ipls[i].CLstate = false
            end
            if ipls[i].state == true then
                if not ipls[i].CLstate == true then
                    RequestIpl(ipls[i].name)
                end
            elseif ipls[i].state == false then
                if ipls[i].CLstate == true then
                    RemoveIpl(ipls[i].name)
                end
            end
        end
    end
end)
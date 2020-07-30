Citizen.CreateThread(function()
    local Ipls = {
        {name = "ex0",state = false},
        {name = "ex1",state = false},
        {name = "ex2",state = false},
        {name = "ex3",state = false},          --Register ipls when loading scripts
        {name = "ex4",state = false},
        {name = "ex5",state = false}
    
    }
        TriggerEvent("DLM:RegisterIplByArray",Ipls)
end) 
    

local id = 0
RegisterCommand('dlm', function(source, args, rawCommand)
    local ReturnArray = {}
    if args[1] == "up" then
        id = id + 1
        if id>6 then id=6 end 
    else
        id = id - 1
        if id<1 then id=1 end
    end

    local state1 = {

        {name = "ex0",state = true},
        {name = "ex1",state = false},
    }
    local state2 = {

        {name = "ex0",state = false},
        {name = "ex1",state = true},
        {name = "ex2",state = false},
    }
    local state3 = {
        {name = "ex1",state = false},
        {name = "ex2",state = true},
        {name = "ex3",state = false},          
    }
    local state4 = {

        {name = "ex2",state = false},
        {name = "ex3",state = true},          
        {name = "ex4",state = false},

    }
    local state5 = {

        {name = "ex3",state = false},          
        {name = "ex4",state = true},
        {name = "ex5",state = false}
    }
    local state6 = {   

        {name = "ex4",state = false},
        {name = "ex5",state = true}
    }

    if id == 1 then 
        ReturnArray = state1
    elseif id == 2 then
        ReturnArray = state2
    elseif id == 3 then
        ReturnArray = state3
    elseif id == 4 then
        ReturnArray = state4
    elseif id == 5 then
        ReturnArray = state5
    elseif id == 6 then
        ReturnArray = state6
    end
    print("state "..id)
	TriggerEvent("DLM:UpdateSvByArray",ReturnArray)
end)
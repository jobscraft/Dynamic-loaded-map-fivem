# Dynamic-loading-map-fivem
sync and load ymap while playing


this script sync loading of IPL across the server 



only register one ymap 
--
TriggerEvent("DLM:RegisterIpl",*'IPlName',**State(bool))


Register multiple ymap (reduce server resource)
--
     ArrayOfNames = {
        {name = *"ymap1",state = **State},
        {name = "ymap2",state = State},
        {name = "ymap3",state = State},
    } 
TriggerEvent("DLM:RegisterIplByArray",'ArrayOfNames',DEFAULT state (bool))

 
Update State of a streamed ymap
--

TriggerEvent("DLM:UpdateSv",'IPlName',State (bool))


Update State of ymap by array
--


     ArrayOfNames = {
        {name = *"ymap1",state = **State},
        {name = "ymap2",state = State},
        {name = "ymap3",state = State},
    }  

TriggerEvent("DLM:UpdateSvByArray",ArrayOfNames)


*: this is your ymap name (file name) <br/>
**: this is the default state of the IPL (if you want to stream it by default or not)

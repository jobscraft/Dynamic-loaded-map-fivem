# Dynamic-loading-map-fivem
sync and load ymap while playing


this script sync loading of IPL across the server 



only register one ymap 
--
TriggerEvent("DLM:RegisterIpl",*'IPLNAME',**STATE(bool))


Register multiple ymap (reduce server resource)
--
     ARRAYOFNAMES = {
        {name = *"ymap1",state = **State},
        {name = "ymap2",state = State},
        {name = "ymap3",state = State},
    } 
TriggerEvent("DLM:RegisterIplByArray",'ARRAYOFNAME',DEFAULT state (bool))

 
Update State of a streamed ymap
--

TriggerEvent("DLM:UpdateSv",'IPLNAME',DEFAULT state (bool))

Update the ymap loaded across the server

Update State of ymap by array
--


     ARRAYOFNAMES = {
        {name = *"ymap1",state = **State},
        {name = "ymap2",state = State},
        {name = "ymap3",state = State},
    }  

TriggerEvent("DLM:UpdateSvByArray",ARRAYOFNAMES)


*: this is your ymap name (file name) <br/>
**: this is the default state of the IPL (if you want to stream it by default or not)


                     Gaining Respect to a Player for Killing DAPE For servers EXILE. V 1.2
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
1. File: DAPE_respect_killedBots.sqf
   Put it in a folder: 
   addons/DAPE/DAPE_respect_killedBots.sqf
   
2. File: addons/DAPE/config.sqf
   After line № 33 add a new line: 
   DAPE_RespectKilledBoat = 150;
   
3. File: addons/DAPE/dape.sqf
   after lines № 745 и № 859 add:
   _x addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'addons\DAPE\DAPE_respect_killedBots.sqf'"];
   
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   

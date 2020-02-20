//////////////////////////////////////////////////////////////////
//        DEH4NK for EXILE DAPE the system from Knocks.         //     
// The code was taken from ejik, which is in the public domain  //
//////////////////////////////////////////////////////////////////
params ["_victim", "_killer"];

_name1 = name (_this select 0);
_name2 = name (_this select 1);
_pl = vehicle (_this select 1);
_respect = missionNamespace getVariable "DAPE_RespectKilledBoat"; 

//["toastRequest", ["InfoTitleAndText", ["АДМИНИСТРАЦИЯ", format ["Убит:%1 игроком:%2", _name1, _name2]]]] call ExileServer_system_network_send_broadcast;

if(isPlayer _pl)then{
    _playerUid = getPlayerUID _pl;
	_response = format ["getAccountScore:%1", _playerUid] call ExileServer_system_database_query_selectSingle;
    _newScore = _response select 0;
	_newScore = _newScore + _respect;
	diag_log format["DEBUG: player %2 score %1.", _newScore, _name2];
    _pl setVariable ["ExileScore", _newScore];
    ExileClientPlayerScore = _newScore;
	(owner _pl) publicVariableClient "ExileClientPlayerScore";
	ExileClientPlayerScore = nil;
	format["setAccountScore:%1:%2", _newScore, getPlayerUID _pl] call ExileServer_system_database_query_fireAndForget;
	_newKillerFrags = _pl getVariable ["ExileKills", 0];
	_newKillerFrags = _newKillerFrags + 1;
	_killerStatsNeedUpdate = true;
	_pl setVariable ["ExileKills", _newKillerFrags];
	format["addAccountKill:%1", getPlayerUID _pl] call ExileServer_system_database_query_fireAndForget;
	[_pl, "freeResponse", [str _respect]] call ExileServer_system_network_send_to;
};
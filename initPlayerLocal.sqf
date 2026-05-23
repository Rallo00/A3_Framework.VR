/* Scenario introduction for every player. Call it from initPLayerLocal.sqf */
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
//JIP
if([player] call BIS_fnc_didJIP) then { [] execVM "briefing.sqf"; [player] spawn FWK_fnc_teleportToLeader; };/*
//Intro
[] spawn
{
	//Fade Black In
	cutText ["", "BLACK FADED", 999];
	0.1 fadeSound 0;
	sleep 1;
	//Blur Effect
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 3;
	//Date handling
	_nowDate = date;
	_day = (if (_nowDate select 2 < 10) then { "0" } else { "" }) + str (_nowDate select 2);
	_month = (if (_nowDate select 1 < 10) then { "0" } else { "" }) + str (_nowDate select 1);
	_year = _nowDate select 0;
	_hour = (if (_nowDate select 3 < 10) then { "0" } else { "" }) + str (_nowDate select 3);
	_minutes = (if (_nowDate select 4 < 10) then { "0" } else { "" }) + str (_nowDate select 4);
	_dateToShow = format["%1/%2/%3 %4:%5", _day, _month, _year, _hour, _minutes];

	_introText=
	[
		[_dateToShow,"<t size='0.9' font='puristaLight'>%1</t><br/>",2],
		[localize "STR_INF_scenario_town","<t size='0.9' font='PuristaLight'>%1</t>",2],
		[localize "STR_INF_scenario_country","<t size='0.9' font='puristaLight'>%1</t><br/>",2],
		[localize "STR_INF_scenario_title","<t size='0.9' font='puristaMedium'>%1</t><br/>",2],
		[format["%1, %2", name player, localize "STR_INF_squad_army"],"<t size='0.9' font='puristaLight'>%1</t><br/>",40]
	];
	[ _introText, (-safezoneX - 0.05), 0.95, "<t color='#FFFFFFFF' shadow = '1' size = '0.9' align = 'right'>%1</t>"] spawn BIS_fnc_typeText;
	//Fade Black Out
	cutText ["", "BLACK IN", 5];
	5 fadeSound 1;
};
*/

player addEventHandler ["HandleDamage", {
    params ["_unit"];
	if (lifeState _unit == "INCAPACITATED") then 
	{
		params ["_unit"];
		[3000] call BIS_fnc_bloodEffect;
		//Camera
		//["Initialize", [_unit, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
		//No death
		_unit allowdamage false;		
	}
	else { _unit allowdamage true; };
}];
/*player addEventHandler ["HandleHeal", {
	_this spawn {
		params ["_injured", "_healer", "_isMedic", "_atVehicle", "_action"];
		if (_injured != _healer) then
		{
			_generalTrash = ["MedicalGarbage_01_5x5_v1_F",
					 "MedicalGarbage_01_3x3_v1_F",
				 	 "MedicalGarbage_01_3x3_v2_F"	
			] call BIS_fnc_selectRandom;
			// field medical bag open
			if (random 1 > 0.5) then { randomPos = _healer getRelPos [1, 45 + random 90]; } // to the right
			else { randomPos = _healer getRelPos [1, -(45 + random 90)]; }; // to the left 
			_medBag = createSimpleObject ["Land_FirstAidKit_01_open_F", AGLtoASL randomPos];
			_medBag setDir random 359; 
			// bandage new
			_randomPos = _healer getRelPos [0.5 + random 1, random 360]; 
			_bandage = createSimpleObject ["Land_Bandage_F", AGLtoASL _randomPos];
			_bandage setDir random 359;  
			// bandage dirty
			_randomPos = _healer getRelPos [0.5 + random 1, random 360]; 
			_bandageDirty = createSimpleObject ["MedicalGarbage_01_Bandage_F", AGLtoASL _randomPos];
			_bandageDirty setDir random 359;  
			sleep 1;
			// medical garbage 3x3
			_medGarbage = createSimpleObject [_generalTrash, AGLtoASL getpos _injured];
			_medGarbage setDir random 359; 
		};
	};
}];*/
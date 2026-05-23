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
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitPoint", "_specialAmmo"];
	// Here the unit is not yet incapacitated
	if (damage _unit >= 0.95) then 
	{
		// if already spawning medical trash, skip
		if (!(_unit getVariable ["FWK_medtrash_locked", false])) then {
			_unit setVariable ["FWK_medtrash_locked", true];
			[_unit] spawn {
				params ["_player"];
				[5000] call BIS_fnc_bloodEffect;
				systemchat format ["3-Unit: %1", name _player];
				// Blood pool
				_randomPos = _player getRelPos [0.5 + random 1, random 360]; 
				_blood = createSimpleObject ["BloodPool_01_Medium_New_F", AGLtoASL position _player];
				_blood setDir random 359;  
				// Camera
				["Initialize", [_player, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
				// No death while incapacitated
				_player allowDamage false;
				waitUntil { lifeState _player != "INCAPACITATED" };
				_player allowDamage true;
				["Terminate", [_player]] call BIS_fnc_EGSpectator;
				// SPAWN MEDICAL GARBAGE
				[_player, 1] spawn FWK_fnc_spawnMedicalTrash;
				// release lock after a short delay to avoid duplicates
				_player spawn {
					params ["_u"];
					sleep 6;
					_u setVariable ["FWK_medtrash_locked", false];
				};
			};
		};
	};
}];
//EVENT - HEAL ACTION (SELF OR OTHER UNIT)
player addEventHandler ["HandleHeal", {
	_this spawn {
		params ["_injured", "_healer", "_isMedic", "_atVehicle", "_action"];
		[_injured, 0] spawn FWK_fnc_spawnMedicalTrash;
		sleep 0.5;
	};
}];
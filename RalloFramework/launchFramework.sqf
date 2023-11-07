//--- HANDLING SERVER SIDE ---//
if (isServer || isDedicated) then 
{ 
	//Configurable
	FWK_AllowCustomSupports = false;
	FWK_EnemySide = independent;
	FWK_EastWestTruce = true;
	FWK_EnemyFaction = "IND_F";
	FWK_IsReviveEnabled = true;
	FWK_IsStealthActive = false;
	FWK_PlayerFaction = "BLU_F";
	
	FWK_ReviveType = paramsArray select 3;	//0=Only medics, 1=FAK, 2=Everyone(Medkit), 3=No revive);
	if (FWK_ReviveType == 4) then { FWK_IsReviveEnabled = false; };
	
	//Automated
	FWK_DateTime = paramsArray select 2; //0=Random; 1=RealTime; 2=DefaultScenario
	FWK_IsWeatherRandom = if (paramsArray select 0 == 0) then { true } else { false };
	FWK_IsRhsActive = ["USAF"] call FWK_fnc_isModActive;
	FWK_IsStaminaActive = if (paramsArray select 1 == 1) then { true } else { false };
	FWK_IsTfarActive = ["TFAR"] call FWK_fnc_isModActive;
	FWK_PlayerSide = side (allPlayers select 0);
	FWK_EnemyInfantryArray = [FWK_EnemyFaction] call FWK_fnc_getFactionInfantry;
	FWK_EnemyStaticArray = [FWK_EnemyFaction] call FWK_fnc_getFactionStatic;
	FWK_EnemyLightArray = [FWK_EnemyFaction] call FWK_fnc_getFactionLV;
	FWK_EnemyArtilleryArray = [FWK_EnemyFaction] call FWK_fnc_getFactionArtillery;
	FWK_EnemyBoatArray = [FWK_EnemyFaction] call FWK_fnc_getFactionBoat;
	FWK_EnemyHeavyArray = [FWK_EnemyFaction] call FWK_fnc_getFactionHV;
	FWK_EnemySupportArray = [FWK_EnemyFaction] call FWK_fnc_getFactionSupport;
	FWK_EnemyGunshipArray = [FWK_EnemyFaction] call FWK_fnc_getFactionGunship;
	FWK_EnemyHeloArray = [FWK_EnemyFaction] call FWK_fnc_getFactionHelo;
	FWK_EnemyAirArray = [FWK_EnemyFaction] call FWK_fnc_getFactionAir;
	FWK_EnemyAntiAirArray = [FWK_EnemyFaction] call FWK_fnc_getFactionAntiAir;
	publicVariable "FWK_AllowCustomSupports";
	publicVariable "FWK_EnemyInfantryArray";
	publicVariable "FWK_EnemyStaticArray";
	publicVariable "FWK_EnemyLightArray";
	publicVariable "FWK_EnemyArtilleryArray";
	publicVariable "FWK_EnemyBoatArray";
	publicVariable "FWK_EnemyHeavyArray";
	publicVariable "FWK_EnemySupportArray";
	publicVariable "FWK_EnemyGunshipArray";
	publicVariable "FWK_EnemyHeloArray";
	publicVariable "FWK_EnemyAirArray";
	publicVariable "FWK_EnemyAntiairArray";
	publicVariable "FWK_EastWestTruce";
	publicVariable "FWK_EnemyFaction";
	publicVariable "FWK_EnemySide";
	publicVariable "FWK_EnemySpawnCoef";
	publicVariable "FWK_IsRhsActive";
	publicVariable "FWK_IsStaminaActive";
	publicVariable "FWK_IsStealthActive";
	publicVariable "FWK_IsTfarActive";
	publicVariable "FWK_IsWeatherRandom";
	publicVariable "FWK_PlayerFaction";
	publicVariable "FWK_PlayerSide";
	publicVariable "FWK_IsReviveEnabled";
	publicVariable "FWK_ReviveType";
	
	//--- LOADING SETTINGS ---//
	[FWK_DateTime] spawn FWK_fnc_setDateTime;
	if (FWK_IsTfarActive) then { [] spawn FWK_fnc_loadSettingsTFAR; };
	if (FWK_IsStealthActive) then { [0.4] spawn FWK_fnc_activateStealth; };
	if (FWK_AllowCustomSupports) then { [] spawn FWK_fnc_allowCustomSupports; };
	if (FWK_EastWestTruce) then { [1] spawn FWK_fnc_eastWestTruce; };
	if (FWK_IsWeatherRandom) then { [] spawn FWK_fnc_randomWeather; };
	if (!FWK_IsStaminaActive) then { { _x enableStamina false; }forEach allUnits; };
	
	//Handle Revive
	//if (FWK_IsReviveEnabled) then {  };
};

//--- HANDLING CLIENT SIDE ---//
if(hasInterface) then
{
	if ([] call BIS_fnc_didJIP) then { [player] spawn FWK_fnc_teleportToLeader; };
};

//--- HANDLING BOTH SERVER AND CLIENT SIDE ---//
//Briefing
[] execVM "briefing.sqf";
[] execVM "RalloFramework\FAR_revive\FAR_FrameworkLaunch.sqf";
{ [_x] spawn FWK_fnc_vehicleUnflip; }forEach vehicles;

//Messaggio caricamento framework a buon fine
systemChat localize "STR_misc_frameworkloaded";
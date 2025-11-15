params["_cache"];
if (isNil "_cache") exitWith { systemChat "fn_supportsAmmoCache: _cache not defined"; };
_isRhsLoaded = ["usaf"] call FWK_fnc_isModActive;
private _debug = true;

//Debug
if(_debug) then { hint format["RHS Loaded: %1\nCache: %2\nSide: %3", _isRhsLoaded, _cache, FWK_PlayerSide]; };

//Cleaning up cache
_cache allowDamage false;
clearWeaponCargoGlobal _cache;
clearMagazineCargoGlobal _cache;
clearItemCargoGlobal _cache;
clearBackpackCargoGlobal _cache;

//West
if(FWK_PlayerSide == west) then 
{
	//RHS
	if(_isRhsLoaded) then {
		_cache addWeaponCargoGlobal ["rhs_weap_M136", 2]; 
		_cache addMagazineCargoGlobal ["20Rnd_762x51_Mag", 15]; 
		_cache addMagazineCargoGlobal ["rhs_mag_m67", 15]; 
		_cache addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 15];
		_cache addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_PMAG", 15];
		_cache addMagazineCargoGlobal ["rhs_mag_M441_HE", 30];
		_cache addMagazineCargoGlobal ["rhs_mag_m18_green", 15]; 
		_cache addMagazineCargoGlobal ["rhs_mag_m18_red", 15]; 
		_cache addMagazineCargoGlobal ["rhs_mag_an_m8hc", 20]; 
		_cache addMagazineCargoGlobal ["rhsusf_200rnd_556x45_M855_box", 3]; 
		_cache addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_M200_soft_pouch", 3];
		_cache addItemCargoGlobal ["FirstAidKit", 15];
	} else {
	//Vanilla
		_cache addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 50];
		_cache addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Sand_Tracer_Green", 50];
		_cache addMagazineCargoGlobal ["130Rnd_338_Mag", 50];
		_cache addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 50];
		_cache addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag", 50];
		_cache addMagazineCargoGlobal ["20Rnd_762x51_Mag", 50];
		_cache addMagazineCargoGlobal ["10Rnd_338_Mag", 50];
		_cache addMagazineCargoGlobal ["16Rnd_9x21_Mag", 50];
		_cache addMagazineCargoGlobal ["HandGrenade", 30];
		_cache addMagazineCargoGlobal ["SmokeShell", 30];
		_cache addMagazineCargoGlobal ["SmokeShellRed", 30];
		_cache addMagazineCargoGlobal ["SmokeShellGreen", 30];
		_cache addMagazineCargoGlobal ["Chemlight_green", 10];
		_cache addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 30];
		_cache addMagazineCargoGlobal ["Titan_AA", 5];
		_cache addMagazineCargoGlobal ["Titan_AT", 5];
		_cache addMagazineCargoGlobal ["B_IR_Grenade", 5];
		_cache addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	};
};
//East
if(FWK_PlayerSide == east) then 
{
	//RHS
	if(_isRhsLoaded) then {
		_cache addWeaponCargoGlobal ["rhs_weap_rpg7", 2];
		_cache addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 2];
		_cache addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_green", 8];
		_cache addMagazineCargoGlobal ["rhs_10Rnd_762x54mmR_7N14", 15];
		_cache addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N10_plum_AK", 30];
		_cache addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N6_AK", 30];
		_cache addMagazineCargoGlobal ["rhs_mag_rdg2_white", 20];
		_cache addMagazineCargoGlobal ["rhs_mag_rdg2_black", 15];
		_cache addMagazineCargoGlobal ["rhs_mag_rgo", 15];
		_cache addMagazineCargoGlobal ["rhs_VOG25", 30];
		_cache addItemCargoGlobal ["FirstAidKit", 15];
	} else {
	//Vanilla
		_cache addMagazineCargoGlobal ["30Rnd_65x39_caseless_green_mag_Tracer", 50];
		_cache addMagazineCargoGlobal ["150Rnd_93x64_Mag", 50];
		_cache addMagazineCargoGlobal ["150Rnd_762x51_Box", 50];
		_cache addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag", 50];
		_cache addMagazineCargoGlobal ["30Rnd_762x39_AK12_Mag_F", 50];
		_cache addMagazineCargoGlobal ["30Rnd_762x39_AK12_Mag_Tracer_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Arid_Mag_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Arid_Mag_Tracer_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Lush_Mag_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Lush_Mag_Tracer_F", 50];
		_cache addMagazineCargoGlobal ["HandGrenade", 30];
		_cache addMagazineCargoGlobal ["SmokeShell", 30];
		_cache addMagazineCargoGlobal ["SmokeShellRed", 30];
		_cache addMagazineCargoGlobal ["SmokeShellGreen", 30];
		_cache addMagazineCargoGlobal ["Chemlight_red", 10];
		_cache addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 30];
		_cache addMagazineCargoGlobal ["Titan_AA", 5];
		_cache addMagazineCargoGlobal ["Titan_AT", 5];
		_cache addMagazineCargoGlobal ["O_IR_Grenade", 5];
		_cache addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	};
};
//Indipendent
if(FWK_PlayerSide == independent) then 
{
	//RHS
	if(_isRhsLoaded) then {
		
	} else {
	//Vanilla
		_cache addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 50];
		_cache addMagazineCargoGlobal ["200Rnd_65x39_Belt_Tracer_Green", 50];
		_cache addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 50];
		_cache addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag", 50];
		_cache addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 50];
		_cache addMagazineCargoGlobal ["HandGrenade", 30];
		_cache addMagazineCargoGlobal ["SmokeShell", 30];
		_cache addMagazineCargoGlobal ["SmokeShellRed", 30];
		_cache addMagazineCargoGlobal ["SmokeShellGreen", 30];
		_cache addMagazineCargoGlobal ["Chemlight_red", 10];
		_cache addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 30];
		_cache addMagazineCargoGlobal ["Titan_AA", 5];
		_cache addMagazineCargoGlobal ["Titan_AT", 5];
		_cache addMagazineCargoGlobal ["i_IR_Grenade", 5];
		_cache addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	};
};
waitUntil { (getPosATL _cache) select 2 < 10 };
Signal = "SmokeShellPurple" createVehicle position _cache;
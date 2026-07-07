_crate = _this select 0;
_smoke = _this select 1;
private _debug = false;

if (isNil "_crate") exitWith { systemChat "supplyCrate.sqf: _crate not defined"; };
_isRhsLoaded = ["usaf"] call FWK_fnc_isModActive;

//Debug
if(_debug) then { hint format["RHS Loaded: %1\nCache: %2\nSide: %3", _isRhsLoaded, _cache, FWK_PlayerSide]; };

_crate allowDamage false;
_crate enableSimulation true;
clearItemCargoGlobal _crate;
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
		_crate addWeaponCargoGlobal ["rhs_weap_m249_light_S_elcan", 2];
		_crate addWeaponCargoGlobal ["rhs_weap_M136", 4];
		_crate addWeaponCargoGlobal ["rhs_weap_fim92", 1];
		_crate addWeaponCargoGlobal ["rhs_weap_fgm148", 1];
		_crate addWeaponCargoGlobal ["rhs_fim92_mag", 3];
		_crate addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 4];
		_crate addmagazineCargoGlobal ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch", 20];
		_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red", 50];
		_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red", 50];
		_crate addMagazineCargoGlobal ["rhs_mag_100Rnd_556x45_M855_cmag", 20];
		_crate addMagazineCargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 33];
		_crate addMagazineCargoGlobal ["rhs_mag_m67", 20];
		_crate addMagazineCargoGlobal ["rhs_mag_an_m8hc", 30];
		_crate addMagazineCargoGlobal ["rhs_mag_m18_green", 10];
		_crate addMagazineCargoGlobal ["rhs_mag_m18_red", 10];
		_crate addMagazineCargoGlobal ["rhsusf_m112_mag", 10];
		_crate addMagazineCargoGlobal ["rhsusf_m112x4_mag", 4];
		_crate addItemCargoGlobal ["Laserbatteries", 3];
		_crate addItemCargoGlobal ["Laserdesignator_01_khk_F", 3];
		_crate addItemCargoGlobal ["FirstAidKit", 60];
		_crate addItemCargoGlobal ["B_IR_Grenade", 5];
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
//Smoke where crate landed
waitUntil { (getPosATL _crate) select 2 < 10 };
if(_smoke) then { Signal = "SmokeShellPurple" createVehicle position _crate; };
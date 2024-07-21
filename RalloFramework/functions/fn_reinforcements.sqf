/*	Spawn random reinforcements (group from 4 to 10) of the desired faction at the given position
*
*	Parameters:
*	1. string: Faction (see below)
*  2. side: Side of reinforcements
*  3. position: Position
*  4. int: Range of spawn from position
*  5. Bool: Add support vehicle
*
*  SUPPORTED VANILLA FACTIONS:
*	BLU_F		NATO (standard)
*	OPF_F		CSAT (standard)
*	IND_F		AAF (standard)
*	BLU_T_F		NATO (Apex, pacific)
*	OPF_T_F		CSAT (Apex, pacific)
*	BLU_W_F		NATO Woodland (Contact)
*	OPF_R_F		Specnaz (Contact
*  IND_E_F		LDF (Contact)
*
*  SUPPORTED MODS FACTIONS:
*  rhs_faction_usarmy_d		RHS USAF (USA Army D OCP)
*  rhs_faction_usarmy_wd		RHS USAF (USA Army D UCP)
*  rhs_faction_usmc_d			RHS USAF (USA Army D MARPAT)
*  rhs_faction_usmc_wd			RHS USAF (USA Army WD MARPAT)
*  rhs_faction_msv					RHS AFRF (Russia MSV EMR)
*  rhs_faction_vdv					RHS AFRF (Russia VDV DES)
*  rhssaf_faction_army			RHS SAF (KOV Digital)
*  Tban										EricJ Taliban Units
*/
params["_faction","_sideReinforcements","_spawnPosition", "_rangeOfSpawn","_addVehicle"];
_unitsArray = [];
_vehicleArray = [];
_unitsArrayToSpawn = [];
_counter = 0;
//Parsing factions
switch (_faction) do
{
	//Vanilla
	case "BLU_F": 	//NATO (standard)
	{
		_unitsArray = [
			"B_Soldier_SL_F",
			"B_Medic_F",
			"B_Soldier_GL_F",
			"B_Soldier_F",
			"B_HeavyGunner_F",
			"B_Soldier_LAT_F",
			"B_Soldier_M_F",
			"B_Soldier_AR_F",
			"B_Soldier_LAT2_F",
			"B_Soldier_UAV_F"
			];
			_vehicleArray = [
			"B_MRAP_01_hmg_F"
			];
	};
	case "OPF_F": 	//CSAT (standard)
	{
		_unitsArray = [
		"O_Soldier_SL_F",
		"O_Medic_F",
		"O_Soldier_HAT_F",
		"O_Soldier_GL_F",
		"O_Soldier_F",
		"O_HeavyGunner_F",
		"O_Soldier_F",
		"O_Soldier_M_F",
		"O_Soldier_AR_F",
		"O_Soldier_UAV_F"
		];
		_vehicleArray = [
		"O_MRAP_02_hmg_F"
		];
	};
	case "IND_F": 	//AAF units
	{
		_unitsArray = [
		"I_Soldier_SL_F",
		"I_Medic_F",
		"I_Soldier_GL_F",
		"I_Soldier_F",
		"I_Soldier_AR_F",
		"I_Soldier_F",
		"I_Soldier_AT_F",
		"I_Soldier_AA_F",
		"I_Soldier_M_F",
		"I_Soldier_UAV_F"
		];
		_vehicleArray = [
		"I_MRAP_03_hmg_F"
		];
	};
	case "OPF_T_F": 	//Chinese CSAT (Apex)
	{
		_unitsArray = [
		"O_T_Soldier_SL_F",
		"O_T_Medic_F",
		"O_T_Soldier_HAT_F",
		"O_T_Soldier_GL_F",
		"O_T_Soldier_F",
		"O_T_HeavyGunner_F",
		"O_T_Soldier_F",
		"O_T_Soldier_M_F",
		"O_T_Soldier_AR_F",
		"O_T_Soldier_UAV_F"
		];
		_vehicleArray = [
		"O_T_MRAP_02_hmg_ghex_F"
		];
	};
	case "BLU_T_F": 	//NATO Pacific (Apex)
	{
		_unitsArray = [
		"B_T_Soldier_SL_F",
		"B_T_Medic_F",
		"B_T_Soldier_GL_F",
		"B_T_Soldier_F",
		"B_T_HeavyGunner_F",
		"B_T_Soldier_LAT_F",
		"B_T_Soldier_M_F",
		"B_T_Soldier_AR_F",
		"B_T_Soldier_LAT2_F",
		"B_T_Soldier_UAV_F"
		];
		_vehicleArray = [
		"B_T_MRAP_01_hmg_F"
		];
	};
	case "BLU_W_F": 	//NATO (Contact)
	{
		_unitsArray = [
		"B_W_Soldier_SL_F",
		"B_W_Medic_F",
		"B_W_Soldier_GL_F",
		"B_W_Soldier_F",
		"B_W_HeavyGunner_F",
		"B_W_Soldier_LAT_F",
		"B_W_Soldier_M_F",
		"B_W_Soldier_AR_F",
		"B_W_Soldier_LAT2_F",
		"B_W_Soldier_UAV_F"
		];
		_vehicleArray = [
		"B_T_MRAP_01_hmg_F"
		];
	};
	case "OPF_R_F": 	//Specnaz (Contact)
	{
		_unitsArray = [
		"O_R_Soldier_SL_F",
		"O_R_Medic_F",
		"O_R_Soldier_LAT_F",
		"O_R_Soldier_GL_F",
		"O_R_JTAC_F",
		"O_R_JTAC_F",
		"O_R_JTAC_F",
		"O_R_Soldier_M_F",
		"O_R_Soldier_AR_F",
		"O_R_JTAC_F"
		];
		_vehicleArray = [
		"O_T_LSV_02_armed_F"
		];
	};
	case "INF_E_F": 	//LDF (Contact)
	{
		_unitsArray = [
		"I_E_Soldier_TL_F",
		"I_E_Medic_F",
		"I_E_Soldier_GL_F",
		"I_E_Soldier_F",
		"I_E_Soldier_AR_F",
		"I_E_Soldier_F",
		"I_E_Soldier_AT_F",
		"I_E_Soldier_AA_F",
		"I_E_Soldier_M_F",
		"I_E_Soldier_UAV_F"
		];
		_vehicleArray = [
		"I_E_Offroad_01_covered_F"
		];
	};
	case "rhs_faction_usarmy_d":	//RHS USAF  (USA Army D OCP)
	{
		_unitsArray = [
		"rhsusf_army_ocp_squadleader",
		"rhsusf_army_ocp_medic",
		"rhsusf_army_ocp_grenadier",
		"rhsusf_army_ocp_rifleman",
		"rhsusf_army_ocp_autorifleman",
		"rhsusf_army_ocp_rifleman",
		"rhsusf_army_ocp_javelin",
		"rhsusf_army_ocp_marksman",
		"rhsusf_army_ocp_aa",
		"rhsusf_army_ocp_uav"
		];
		_vehicleArray = [
		"rhsusf_m1025_d_m2"
		];
	};
	case "rhs_faction_usarmy_wd":	//RHS USAF (USA Army W UCP)
	{
		_unitsArray = [
		"rhsusf_army_ucp_squadleader",
		"rhsusf_army_ucp_medic",
		"rhsusf_army_ucp_grenadier",
		"rhsusf_army_ucp_rifleman",
		"rhsusf_army_ucp_autorifleman",
		"rhsusf_army_ucp_rifleman",
		"rhsusf_army_ucp_javelin",
		"rhsusf_army_ucp_marksman",
		"rhsusf_army_ucp_aa",
		"rhsusf_army_ucp_uav"
		];
		_vehicleArray = [
		"rhsusf_m1025_w_m2"
		];
	};
	case "rhs_faction_usmc_d":		//RHS USAF (USMC D)
	{
		_unitsArray = [
		"rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_navy_sarc_d_fast",
		"rhsusf_usmc_marpat_d_grenadier",
		"rhsusf_usmc_marpat_d_rifleman",
		"rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_usmc_marpat_d_rifleman",
		"rhsusf_usmc_marpat_d_javelin",
		"rhsusf_usmc_marpat_d_marksman",
		"rhsusf_usmc_marpat_d_stinger",
		"rhsusf_usmc_marpat_d_uav"
		];
		_vehicleArray = [
		"rhsusf_m1025_d_s_m2"
		];
	};
	case "rhs_faction_usmc_wd":		//RHS USAF (USMC WD MARPAT)
	{
		_unitsArray = [
		"rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_navy_sarc_wd_fast",
		"rhsusf_usmc_marpat_wd_grenadier",
		"rhsusf_usmc_marpat_wd_rifleman",
		"rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_usmc_marpat_wd_rifleman",
		"rhsusf_usmc_marpat_wd_javelin",
		"rhsusf_usmc_marpat_wd_marksman",
		"rhsusf_usmc_marpat_wd_stinger",
		"rhsusf_usmc_marpat_wd_uav"
		];
		_vehicleArray = [
		"rhsusf_m1025_w_s_m2"
		];
	};
	case "rhs_faction_msv":
	{
		_unitsArray = [
		"rhs_msv_emr_sergeant",
		"rhs_msv_emr_medic",
		"rhs_msv_emr_grenadier_rpg",
		"rhs_msv_emr_rifleman",
		"rhs_msv_emr_arifleman_rpk",
		"rhs_msv_emr_rifleman",
		"rhs_msv_emr_rifleman",
		"rhs_msv_emr_aa",
		"rhs_msv_emr_LAT",
		"rhs_msv_emr_marksman"
		];
		_vehicleArray = [
		"rhs_tigr_sts_msv"
		];
	};
	case "rhs_faction_vdv":
	{
		_unitsArray = [
		"rhs_vdv_des_sergeant",
		"rhs_vdv_des_medic",
		"rhs_vdv_des_grenadier_rpg",
		"rhs_vdv_des_rifleman",
		"rhs_vdv_des_arifleman_rpk",
		"rhs_vdv_des_rifleman",
		"rhs_vdv_des_rifleman",
		"rhs_vdv_des_LAT",
		"rhs_vdv_des_aa",
		"rhs_vdv_des_marksman"
		];
		_vehicleArray = [
		"rhs_tigr_sts_3camo_msv"
		];
	};
	case "Tban":
	{
		_unitsArray = [
		"TBan_Fighter6",
		"TBan_Fighter5",
		"TBan_Fighter4",
		"TBan_Fighter3NH",
		"TBan_Fighter2NH",
		"TBan_Fighter1NH",
		"TBan_Fighter3",
		"TBan_Fighter2",
		"TBan_Fighter1"
		];
		_vehicleArray = [
		"Tban_O_Offroad_01_F"
		];
	};
	case "rhssaf_faction_army":
	{
		_unitsArray = [
		"rhssaf_army_m10_digital_sq_Lead",
		"rhssaf_army_m10_digital_medic",
		"rhssaf_army_m10_digital_gl",
		"rhssaf_army_m10_digital_rifleman_m70",
		"rhssaf_army_m10_digital_mgun_m84",
		"rhssaf_army_m10_digital_rifleman_m70",
		"rhssaf_army_m10_digital_rifleman_m70",
		"rhssaf_army_m10_digital_spec_aa",
		"rhssaf_army_m10_digital_spec_at",
		"rhssaf_army_m10_digital_sniper_m76"
		];
		_vehicleArray = [
		"rhssaf_m1151_olive_pkm"
		];
	};
};
_groupSize = [4,10] call BIS_fnc_randomInt;
_unitsArray resize _groupSize;
//Random position around given position
_randomSpawnPosition = [_spawnPosition, random _rangeOfSpawn, random 360] call BIS_fnc_relPos;
//Spawning group
_spawnedGroup = [_randomSpawnPosition, _sideReinforcements, _unitsArray] call BIS_fnc_spawnGroup;
_waypoint = _spawnedGroup addWaypoint [position (allPlayers select 0), 0];
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointType "MOVE";
_waypoint setWaypointStatements ["true",""];
_spawnedGroup setCurrentWaypoint [_spawnedGroup, 0];
//Spawning vehicle
if (_addVehicle) then
{
	_vehGroup = [_randomSpawnPosition, _sideReinforcements, _vehicleArray] call BIS_fnc_spawnGroup;
	_wp = _vehGroup addWaypoint [position (allPlayers select 0), 0];
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true",""];
	_vehGroup setCurrentWaypoint [_vehGroup, 0];
};

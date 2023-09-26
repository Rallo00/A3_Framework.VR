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
params["_spawnPosition","_addVehicle"];
_unitsArray = [];
_vehicleArray = [];
_unitsArrayToSpawn = [];
_counter = 0;

_groupSize = [4,10] call BIS_fnc_randomInt;
_unitsArray resize _groupSize;
//Random position around given position
_randomSpawnPosition = [_spawnPosition, 1500, random 360] call BIS_fnc_relPos;
//Spawning group
_spawnedGroup = [_randomSpawnPosition, FWK_EnemySide, _unitsArray] call BIS_fnc_spawnGroup;
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
	_vehGroup = [_randomSpawnPosition, FWK_EnemySide, _vehicleArray] call BIS_fnc_spawnGroup;
	_wp = _vehGroup addWaypoint [position (allPlayers select 0), 0];
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true",""];
	_vehGroup setCurrentWaypoint [_vehGroup, 0];
};

/*	Spawn random reinforcements (group from 4 to 10) of the desired faction at the given position */
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

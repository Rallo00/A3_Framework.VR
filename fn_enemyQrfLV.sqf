/*	Spawn random reinforcements (group from 4 to 10) of the desired faction at the given position */
params["_spawnPosition", "_rangeOfSpawn"];

_unitsArray = FWK_EnemyInfantryArray;
_vehicleType = FWK_EnemyLightArray call BIS_fnc_selectRandom;				//Spawning vehicle
_veh = _vehicleType createVehicle _randomSpawnPosition;
_vehicleType = FWK_EnemyLightArray call BIS_fnc_selectRandom;
_veh = _vehicleType createVehicle _randomSpawnPosition;
_randomSpawnPosition = [_spawnPosition, random _rangeOfSpawn, random 360] call BIS_fnc_relPos;
_availableVehSeats = count fullcrew _veh;									//Getting available seats from vehicle
_unitsArray resize _availableVehSeats;

//Spawning group
_spawnedGroup = [_randomSpawnPosition, FWK_EnemySide, _unitsArray] call BIS_fnc_spawnGroup;

//Waypoints
_getInWaypoint = _spawnedGroup addWaypoint [_randomSpawnPosition, 0];
_getInWaypoint setWaypointBehaviour "AWARE";
_getInWaypoint setWaypointCombatMode "RED";
_getInWaypoint setWaypointSpeed "FULL";
_getInWaypoint setWaypointType "GETIN NEAREST";
_getInWaypoint setWaypointStatements ["true",""];
_moveWaypoint = _spawnedGroup addWaypoint [position (allPlayers select 0), 1];
_moveWaypoint setWaypointBehaviour "AWARE";
_moveWaypoint setWaypointCombatMode "RED";
_moveWaypoint setWaypointSpeed "FULL";
_moveWaypoint setWaypointType "MOVE";
_moveWaypoint setWaypointStatements ["true",""];
_getOutWaypoint = _spawnedGroup addWaypoint [position (allPlayers select 0), 2];
_getOutWaypoint setWaypointBehaviour "AWARE";
_getOutWaypoint setWaypointCombatMode "RED";
_getOutWaypoint setWaypointSpeed "FULL";
_getOutWaypoint setWaypointType "GETOUT";
_getOutWaypoint setWaypointStatements ["true",""];
_spawnedGroup setCurrentWaypoint [_spawnedGroup, 0];
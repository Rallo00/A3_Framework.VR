//Helicopter QRF of _side from random far start position to _destination
params["_destination"];

//Spawning transport
_startPos = [_destination, 3000, 5000] call FWK_fnc_getRandomAOLocation;
_landingPos = [_destination, 25, 75] call FWK_fnc_getRandomAOLocation;
_heloType = selectRandom FWK_EnemyHeloArray;
_helipad = "Land_HelipadEmpty_F" createVehicle _landingPos;
_spawnHelo = [_startPos, random 360, _heloType, FWK_EnemySide] call BIS_fnc_spawnVehicle;
_heloObj = _spawnHelo select 0;
_heloGrp = _spawnHelo select 2;

//Spawning units in transport based on free seats
_cargoSize = _heloObj emptyPositions "cargo";
_groupUnitsArray = + FWK_EnemyInfantryArray;
_groupUnitsArray resize _cargoSize;
_qrfGrp = [_startPos, FWK_EnemySide, _groupUnitsArray] call BIS_fnc_spawnGroup;
{ _x moveInCargo _heloObj } forEach units _qrfGrp;

//Helo waypoint and unload
_landWp = group _heloObj addWaypoint [_helipad, 0];
_landWp setWaypointType "TR UNLOAD";
_landWp setWaypointSpeed "FULL";
_landWp setWaypointBehaviour "CARELESS";
_landWp setWaypointStatements["true", "(vehicle this) land 'GET OUT';"];

//Go away waypoint for helo
_awayWp = _heloGrp addWaypoint [[0,0,0], 0];
_awayWp setWaypointType "MOVE";
_awayWp setWaypointSpeed "FULL";
_awayWp setWaypointBehaviour "CARELESS";
_awayWp setWaypointStatements["true", "[vehicle this] spawn FWK_fnc_deleteVehicle;"];
_heloGrp setCurrentWaypoint _landWp;

//Waiting for all troops to disembark
waitUntil { {_x in _heloObj} count (units _qrfGrp) == 0; };
hint "sbloccato";
_heloGrp setCurrentWaypoint _awayWp;

//Defend waypoint for QRF
_defendWp = _qrfGrp addWaypoint [_destination, 20];
_defendWp setWaypointType "SENTRY";
_defendWp setWaypointSpeed "FULL";
_defendWp setWaypointBehaviour "COMBAT";
_defendWp setWaypointStatements["true", ""];
_qrfGrp setCurrentWaypoint _defendWp;
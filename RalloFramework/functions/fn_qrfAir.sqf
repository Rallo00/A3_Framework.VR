//Helicopter QRF of _side from random far start position to _destination
params["_destination", "_isFriendly"];
private _heloArray;
private _side;
private _infantryArray;
//Handling friendly or enemy
if(_isFriendly) then { 
	_heloArray = + FWK_FriendlyHeloArray; 
	_side = FWK_PlayerSide; 
	_infantryArray = + FWK_FriendlyInfantryArray; 
} else { 
	_heloArray = + FWK_EnemyHeloArray; 
	_side = FWK_EnemySide; 
	_infantryArray = + FWK_EnemyInfantryArray; 
};

//Spawning transport
_startPos = [_destination, 3000, 5000] call FWK_fnc_getRandomAOLocation;
_landingPos = [_destination, 25, 75] call FWK_fnc_getRandomAOLocation;
_heloType = selectRandom _heloArray;
_helipad = "Land_HelipadEmpty_F" createVehicle _landingPos;
_spawnHelo = [_startPos, random 360, _heloType, _side] call BIS_fnc_spawnVehicle;
_heloObj = _spawnHelo select 0;
_heloGrp = _spawnHelo select 2;

//Spawning units in transport based on free seats
_cargoSize = _heloObj emptyPositions "cargo";
_groupUnitsArray = + _infantryArray;
_groupUnitsArray resize _cargoSize;
_qrfGrp = [_startPos, _side, _groupUnitsArray] call BIS_fnc_spawnGroup;
{ _x moveInCargo _heloObj } forEach units _qrfGrp;

//Helo waypoint and unload
_landWp = group _heloObj addWaypoint [_helipad, 0];
_landWp setWaypointType "TR UNLOAD";
_landWp setWaypointSpeed "FULL";
_landWp setWaypointBehaviour "CARELESS";
_landWp setWaypointStatements["true", "(vehicle this) land 'GET OUT';"];
_heloGrp setCurrentWaypoint _landWp;

//Waiting for all troops to disembark
waitUntil { {_x in _heloObj} count (units _qrfGrp) == 0; };

//Defend waypoint for QRF
_defendWp = _qrfGrp addWaypoint [_destination, 20];
_defendWp setWaypointType "SENTRY";
_defendWp setWaypointSpeed "FULL";
_defendWp setWaypointBehaviour "COMBAT";
_defendWp setWaypointStatements["true", ""];
_qrfGrp setCurrentWaypoint _defendWp;

//Make helo go away
_heloPilot = leader _heloGrp;
_heloPilot doMove ([0,0,0]);

//After 40 seconds delete helo and crew inside
sleep 40;
{deleteVehicle _x} forEach (crew _heloObj) + [_heloObj]; 
//Helicopter QRF of _side from random far start position to _pos
params["_pos", "_isFriendly"];
if(isNil "_pos") exitWith { systemChat "fn_qrfTransport: _pos not defined"; };
if(isNil "_isFriendly") exitWith { systemChat "fn_qrfTransport: _isFriendly not defined"; };

_debug = true;
_transportArray = [];
_side = 0;
_infantryArray = [];
_safePos = [_pos, 0, 15] call BIS_fnc_findSafePos;
//Handling friendly or enemy
if(_isFriendly) then { 
	_transportArray = + FWK_FriendlyTransportArray; 
	_side = FWK_PlayerSide; 
	_infantryArray = + FWK_FriendlyInfantryArray; 
} else { 
	_transportArray = + FWK_EnemyTransportArray; 
	_side = FWK_EnemySide; 
	_infantryArray = + FWK_EnemyInfantryArray; 
};

//Spawning transport
if(_debug) then {
	_startPos = [_pos, 1000, 2000] call BIS_fnc_findSafePos;
	_startPosRoad = _startPos;
} else {
	_startPos = [_pos, 1000, 2000] call FWK_fnc_getRandomAOLocation;
	_startPosRoad = position (_pos call BIS_fnc_nearestRoad);
};
_vehicleType = selectRandom _transportArray;
_spawnVehicle = [_startPosRoad, random 360, _vehicleType, _side] call BIS_fnc_spawnVehicle;
_vehicle = _spawnVehicle select 0;
_vehicleGrp = _spawnVehicle select 2;

//Spawning units in transport based on free seats
_cargoSize = _vehicle emptyPositions "cargo";
_groupUnitsArray = + _infantryArray;
_groupUnitsArray resize _cargoSize;
_qrfGrp = [_startPosRoad, _side, _groupUnitsArray] call BIS_fnc_spawnGroup;
{ _x moveInCargo _vehicle } forEach units _qrfGrp;

//Helo waypoint and unload
_landWp = group _vehicle addWaypoint [_pos, 0];
_landWp setWaypointType "TR UNLOAD";
_landWp setWaypointSpeed "FULL";
_landWp setWaypointBehaviour "CARELESS";
_landWp setWaypointStatements["true", "(vehicle this) land 'GET OUT';"];
_vehicleGrp setCurrentWaypoint _landWp;

if(_debug) then {
	_marker = createMarker [format ["%1", _startPosRoad], _startPosRoad];
    _marker setMarkerText format ["QRF TRANSPORT: %1 units", count _groupUnitsArray];
    _marker setMarkerSize [1,1];
    _marker setMarkerType "hd_dot";
	hint format["Position: %1\nRoad Pos: %2\nFriendly: %3\nGroup size: %4\nSide: %5\nUnits Array: %6", _startPos, _startPosRoad, _isFriendly, count _groupUnitsArray, _side, _infantryArray];
};

//Waiting for all troops to disembark
waitUntil { {_x in _vehicle} count (units _qrfGrp) == 0; };

//Defend waypoint for QRF
_defendWp = _qrfGrp addWaypoint [_pos, 20];
_defendWp setWaypointType "SENTRY";
_defendWp setWaypointSpeed "FULL";
_defendWp setWaypointBehaviour "COMBAT";
_defendWp setWaypointStatements["true", ""];
_qrfGrp setCurrentWaypoint _defendWp;

//Make helo go away
_vehicleDriver = leader _vehicleGrp;
_vehicleDriver doMove ([0,0,0]);

//After 40 seconds delete helo and crew inside
sleep 120;
{deleteVehicle _x} forEach (crew _vehicle) + [_vehicle]; 
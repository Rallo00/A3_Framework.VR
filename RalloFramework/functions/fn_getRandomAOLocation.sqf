/* Returns a random position around a given position */
params["_location", "_minDistance", "_maxDistance"];
if (_maxDistance == 0) then { _maxDistance = 600; };
//Randomized location
_distance = [_minDistance, _maxDistance] call BIS_fnc_randomInt;
_direction = [0,359] call BIS_fnc_randomInt;
_randomLocation = [_location, _distance, _direction] call BIS_fnc_relPos;

_randomLocation;

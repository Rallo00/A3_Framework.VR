/* Make some (random) units of a side surrender in given area and range */
params["_position","_distance","_side"];
_unitsToSurrender = [_position nearEntities ["Man", _distance], {side _x == _side}] call BIS_fnc_conditionalSelect;
{
	if ((random 1) > 0.5) then { _x setCaptive true; _x action ["surrender", _x]; };
} forEach _unitsToSurrender;

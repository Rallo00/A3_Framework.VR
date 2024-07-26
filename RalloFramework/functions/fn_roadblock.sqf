params ["_pos"];
private _debug = false;

//Spawn vehicle
private _randomTypeLV = selectRandom ([FWK_EnemyFaction] call FWK_fnc_getFactionLV);
private _veh = [_pos, random 360, _randomTypeLV, FWK_EnemySide] call BIS_fnc_spawnVehicle;
//Waypoint to hold position
private _grp = group (_veh select 0);
_holdWp = _grp addWaypoint [_grp, 0];
_holdWp setWaypointType "HOLD";
_holdWp setWaypointBehaviour "AWARE";
_grp setCurrentWaypoint [_grp, 0];
//Spawn units
private _groupUnitsCount = 6;
_groupUnitsArray = + FWK_EnemyInfantryArray;
_groupUnitsArray resize _groupUnitsCount;
private _grpUnits = [_pos, FWK_EnemySide, _groupUnitsArray] call BIS_fnc_spawnGroup;
//Waypoint to hold position
_holdWpUnits = _grpUnits addWaypoint [_grpUnits, 0];
_holdWpUnits setWaypointType "HOLD";
_holdWpUnits setWaypointBehaviour "AWARE";
_grpUnits setCurrentWaypoint [_grpUnits, 0];
//Debug
if(_debug) then {
    _marker = createMarker [format ["%1",_pos], _pos];
    _marker setMarkerText format ["Roadblock: %1", _randomTypeLV];
    _marker setMarkerSize [1,1];
    _marker setMarkerType "hd_dot";
};
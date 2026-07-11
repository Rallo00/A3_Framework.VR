//Gets the closest radio tower. If last parameter is true puts a marker on it
params ["_pos", "_createMarker"];
private _debug = false;
private _towerClasses = [
    "Land_TTowerBig_1_F",
    "Land_TTowerBig_2_F",
    "Land_Communication_F"
    //Missing RHS antennas
];
private _nearestTower = objNull;

// Find the closest alive tower
private _towers = nearestObjects [_pos, _towerClasses, 10000];
private _aliveTowers = _towers select { alive _x };

if (_aliveTowers isNotEqualTo []) then 
{
    _nearestTower = _aliveTowers select 0;
    private _gridPosArray = _nearestTower call BIS_fnc_posToGrid;
    private _gridInfo = format ["%1-%2", _gridPosArray select 0, _gridPosArray select 1];

    // Creates marker and updates it if the tower is destroyed
    
    if (_createMarker) then 
	{
        private _markerName = format ["tower_%1", _gridInfo];
        private _marker = createMarker [_markerName, getPosATL _nearestTower];
        _marker setMarkerShape "ICON";
        _marker setMarkerType "loc_Transmitter";
        _marker setMarkerColor "ColorOPFOR";
        _marker setMarkerText format ["Radio Tower %1", _gridInfo];

        _nearestTower setVariable ["fwk_towerMarkerName", _marker];

        //In case of tower destruction the marker becomes gray
        _nearestTower addEventHandler ["Killed", {
            params ["_tower"];
            private _markerName = _tower getVariable ["fwk_towerMarkerName", ""];
            if (_markerName isEqualTo "") exitWith {};
            _markerName setMarkerColor "ColorGrey";
            private _markerName = format ["tower_%1", _gridInfo];
        }];
    };

    if (_debug) then {
        systemChat "fn_nearestRadioTower.sqf is in debug mode.";
        hint format ["Nearest tower: %1\nDistance: %2 m\nGrid: %3", typeOf _nearestTower, round (_pos distance2D _nearestTower), _gridInfo];
    };
};
_nearestTower;
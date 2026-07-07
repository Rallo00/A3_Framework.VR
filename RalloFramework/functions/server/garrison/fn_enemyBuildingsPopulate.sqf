/* Populate random buildings in given area with infantry soldiers */
params ["_pos", "_patrolledAreaSize", "_criticalLevel"];
private _debug = true;
private _buildingCount = 0;
private _unitsPerBuilding = 0;

switch (_criticalLevel) do
{
    case 1:
    {
        _buildingCount = 2 + floor random 3;     // 2-4 buildings
        _unitsPerBuilding = 1 + floor random 1;  // 1-2 units
    };

    case 2:
    {
        _buildingCount = 4 + floor random 3;     // 4-6 buildings
        _unitsPerBuilding = 2 + floor random 2;  // 2-4 units
    };

    case 3:
    {
        _buildingCount = 6 + floor random 5;     // 6-10 buildings
        _unitsPerBuilding = 3 + floor random 3;  // 3-6 units
    };
};

// Find buildings
private _buildings = nearestObjects [_pos, ["House", "Building"], _patrolledAreaSize];
// Remove buildings without positions
_buildings = _buildings select {
    count (_x buildingPos -1) > 0
};
// Limit number of buildings
_buildings = _buildings call BIS_fnc_arrayShuffle;
_buildings resize (_buildingCount min count _buildings);

//Debug
if (_debug) then { systemChat "fn_enemyBuildingsPopulate.sqf is in debug mode."; };

// Spawn defenders
{
    private _building = _x;
    private _positions = _building buildingPos -1;
    // Shuffle internal positions
    _positions = _positions call BIS_fnc_arrayShuffle;
    // Limit positions used
    _positions resize (_unitsPerBuilding min count _positions);
    private _grp = createGroup FWK_EnemySide;
    {
        private _unitType = selectRandom FWK_EnemyInfantryArray;
        private _unit = _grp createUnit [_unitType, _x, [], 0, "NONE"];
        // Make units stay in building
        _unit setPosATL _x;
		_unit setUnitPos "UP";
    } forEach _positions;

    // Basic building defense behaviour
    {
        _x setUnitPos "UP";
        _x disableAI "PATH";
        _x enableAI "TARGET";
        _x enableAI "AUTOTARGET";
    } forEach units _grp;
    // Dynamic simulation
    _grp enableDynamicSimulation true;
    sleep 2;
	//Debug marker
	if(_debug) then 
	{
		_marker = createMarker [format ["ran: %1", position _x], position _x];
    	_marker setMarkerText format ["Populated: %1 soldiers", count units _grp];
    	_marker setMarkerSize [1,1];
    	_marker setMarkerType "hd_dot";
	};
} forEach _buildings;
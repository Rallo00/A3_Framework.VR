/* SCRIPT IS STILL FAULTY */

/* Make some (random) units of a side spawn in area */
params["_pos", "_patrolledAreaSize", "_criticalLevel"];

_playersCount = count allPlayers;
_sqMeters = 50;

//Each enemy patrol a total of N square meters, this value changes with player number
if (_playersCount >= 5 && _playersCount <= 8) then { _sqMeters = _sqMeters + 20; };
if (_playersCount >= 9 && _playersCount <= 12) then { _sqMeters = _sqMeters + 20; };
if (_playersCount >= 13 && _playersCount <= 16) then { _sqMeters = _sqMeters + 20; };
if (_playersCount >= 17 && _playersCount <= 20) then { _sqMeters = _sqMeters + 20; };

_ratio = (_patrolledAreaSize + _patrolledAreaSize) * _playersCount;

//Handle vehicles with critical level

//Handling 1 person in MP


_counter = 0;
while { _counter < _ratio } do
{
	_randomSpawnPos = [_pos, 10, _patrolledAreaSize] call FWK_fnc_getRandomAOLocation;
	_groupUnitsCount = 8;
	_groupUnitsArray = + FWK_EnemyInfantryArray;
	_groupUnitsArray resize _groupUnitsCount;
	_grp = [_randomSpawnPos, FWK_EnemySide, _groupUnitsArray] call BIS_fnc_spawnGroup;
	_counter = _counter + 1;
	sleep 5;
	//Patrol area
	[_grp, _pos, _patrolledAreaSize] call BIS_fnc_taskPatrol;
};

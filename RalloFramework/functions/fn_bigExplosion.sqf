/* Big building collapse effect (debries and earthquake) */
_building = param[0];
_exploded = false;
_debriesCount = random[20,30,40];
while { !_exploded } do
{
	if (damage _building > 0.2) then
	{
		_exploded = true;
		_bombType = "IEDUrbanSmall_Remote_Ammo" createVehicle (getPos _building);
		_bombType setDammage 1;
		[2] spawn BIS_fnc_earthquake;
		//Spawning Debries
		for "_i" from 1 to _debriesCount do
		{
			_distance = [2, 12] call BIS_fnc_randomInt;
			_direction = [0,359] call BIS_fnc_randomInt;
			_randomPos = [position _building, _distance, _direction] call BIS_fnc_relPos;
			_debriesArray = [
								"Land_ShellCrater_02_debris_F",
								"Land_Fortress_01_bricks_v2_F",
								"Land_Fortress_01_bricks_v2_F",
								"Land_DomeDebris_01_hex_damaged_green_F"
							] call BIS_fnc_selectRandom;
			_debriesArray createVehicle _randomPos;
			sleep 0.1;
		};
	};
};

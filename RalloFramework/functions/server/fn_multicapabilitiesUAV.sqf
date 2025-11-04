_configDrone = {
	params["_vehicle","_configDrone","_handleDrone"];
	_vehicle addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa'/> <t color=""#37A9E7"">" + localize 'STR_misc_drone_resupply' + "</t>", {
		params ["_target", "_caller", "_actionId", "_arguments"];

		_grenadeTypes = [
			"rhssaf_mag_br_m84"
			,"rhs_grenade_m1939e_f_mag"
			,"rhs_grenade_m1939l_f_mag"
			,"rhs_mag_f1"
			,"HandGrenade"
			,"rhs_mag_m67"
			,"rhs_grenade_m15_mag"
			,"MiniGrenade"
			,"rhs_grenade_mkii_mag"
			,"rhs_grenade_nbhgr39_mag"
			,"rhs_grenade_nbhgr39B_mag"
			,"rhs_mag_plamyam"
			,"rhs_mag_rgd5"
			,"rhs_mag_rgn"
			,"rhs_mag_rgo"
			,"rhsgref_mag_rkg3em"
			,"rhssaf_mag_rshb_p98"
			,"rhs_grenade_sthgr43_mag"
			,"rhs_grenade_sthgr43_heerfrag_mag"
			,"rhs_grenade_sthgr43_SSfrag_mag"
			,"rhs_grenade_khattabka_vog17_mag"
			,"rhs_grenade_khattabka_vog25_mag"
			,"rhs_mag_zarya2"
		];
		_foundGrenade = _grenadeTypes findIf { [_caller, _x] call BIS_fnc_hasItem };
		if(_foundGrenade > -1) then 
		{
			_caller removeItem (_grenadeTypes select _foundGrenade);
			_configDrone = (_this select 3) select 0;
			_handleDrone = (_this select 3) select 1;
			_target removeAction _actionId;
			[_target, _configDrone, _handleDrone] spawn _handleDrone;
		} 
		else 
		{
			_id = owner _caller;
			[localize "STR_misc_drone_unable."] remoteExec ["hint", _id];
		};
	}, [_configDrone, _handleDrone], 2, true, true, "", "!(_this in _target)", 5];
};
_handleDrone = {
	params["_vehicle","_configDrone","_handleDrone"];
	_gren = createSimpleObject ["A3\Weapons_f\ammo\Handgrenade", [0,0,0]];
	_gren attachTo [_vehicle, [0,0,-0.15]];
	_vehicle setVariable ["grenade", _gren];
	{
		_x addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa'/> <t color=""#37A9E7"">" + localize 'STR_misc_drone_drop' + "</t>", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_configDrone = (_this select 3) select 0;
			_handleDrone = (_this select 3) select 1;
			_vehicle = vehicle _caller;
			_gren = _vehicle getVariable ["grenade", objNull];
			detach _gren;
			deleteVehicle _gren;
			_droneVelocity = velocity _vehicle;
			_pos = _target modelToWorld [0,0,-0.15];
			_gren = "Grenade" createvehicle _pos;
			_gren setVectorDirandUp [[0,0,-1],[0.1,0.1,1]]; 
			_gren setVelocity [_droneVelocity select 0, _droneVelocity select 1,-1];
			{ _x removeAction _actionId; } forEach [gunner _vehicle, driver _vehicle];
			[_vehicle, _configDrone, _handleDrone] spawn _configDrone;
			_pos = getPosATL _gren;
			//Bigger explosion
			waitUntil { !alive _gren };
			_bombType = "IEDLandBig_Remote_Ammo" createVehicle [_pos select 0, _pos select 1, 0];
			_bombType setDamage 1;
		}, [_configDrone, _handleDrone]];
	}forEach [gunner _vehicle, driver _vehicle];
};
_explosiveDrone = {
	_veh = _this select 0;
	if(isNull _veh) exitWith {};

	waitUntil {(damage _veh) > 0.8};
	bomb = "IEDUrbanBig_Remote_Ammo" createVehicle (_veh modelToWorld [0,0,-0.5]); //Spawn a bomb
	bomb setDamage 1;
	deleteVehicle _veh;
};
_drone = param[0];
[_drone, _configDrone, _handleDrone] spawn _handleDrone;
[_drone] spawn _explosiveDrone;
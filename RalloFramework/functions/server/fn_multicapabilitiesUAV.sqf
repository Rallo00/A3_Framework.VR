
_handleDrops = {
	params["_vehicle", "_handleDrops"];
	//Fake object to make it seem it has a cargo box
	_content = createSimpleObject ["Land_BatteryPack_01_battery_black_F", [0,0,0]];
	_content allowDamage false;
	_content enableSimulation false;
	_content attachTo [_vehicle, [0,0,-0.15]];
	//Number of rounds available
	_vehicle setVariable ["chargesCount", 4];
	_vehicle setVariable ["smokesCount", 4];
	//Action CHARGE
	{
		_x addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa'/> <t color=""#37A9E7"">" + localize 'STR_misc_drone_drop_explosive' + "</t>", 
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			_vehicle = vehicle _caller;
			private _charges = _vehicle getVariable ["chargesCount", 0];
			_vehicle setVariable ["chargesCount", _charges - 1];

			_droneVelocity = velocity _vehicle;
			_pos = _target modelToWorld [0,0,-0.15];
			_content = "Grenade" createVehicle _pos;
			_model = "\A3\Weapons_F_Tank\Launchers\MRAWS\rocket_MRAWS_HEAT_F.p3d";
			_visual = createSimpleObject [_model, [0,0,0]];
			_visual attachTo [_content, [0,0,0]];
			_content setVectorDirandUp [[0,0,-1],[0.1,0.1,1]]; 
			_content setVelocity [_droneVelocity select 0, _droneVelocity select 1,-1];
			_pos = getPosATL _content;

			//Hint message to let player know of remaining rounds
			private _charges = _vehicle getVariable ["chargesCount", 0];
			private _smokes = _vehicle getVariable ["smokesCount", 0];
			private _hintMessage = format [localize "STR_misc_drone_ammo_remaining", _charges, _smokes];
			[_hintMessage] remoteExec ["hint", _caller];

			//Need spawn{} because waituntil hangs the script and the explosive counter does not get decremented,
			//if player drops grenades fast the counter can go below zero resulting in more than 4 drops
			[_content, _pos] spawn {
				params ["_content","_pos"];
				waitUntil { !alive _content };
				_bombType = "IEDLandBig_Remote_Ammo" createVehicle [_pos select 0, _pos select 1, 0];
				_bombType setDamage 1;
			};

			if (_charges <= 0) then {
				_target removeAction _actionId;
			};
		}];
	} forEach [gunner _vehicle, driver _vehicle];
	//Action SMOKE
	{
		_x addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa'/> <t color=""#37A9E7"">" + localize 'STR_misc_drone_drop_smoke' + "</t>", 
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			_vehicle = vehicle _caller;
			private _smokes = _vehicle getVariable ["smokesCount", 0];
			_vehicle setVariable ["smokesCount", _smokes - 1];

			_droneVelocity = velocity _vehicle;
			_pos = _target modelToWorld [0,0,-0.15];
			_content = "SmokeShell" createvehicle _pos;
			_content setVectorDirandUp [[0,0,-1],[0.1,0.1,1]]; 
			_content setVelocity [_droneVelocity select 0, _droneVelocity select 1,-1];
			_pos = getPosATL _content;

			//Hint message to let player know of remaining rounds
			private _charges = _vehicle getVariable ["chargesCount", 0];
			private _smokes = _vehicle getVariable ["smokesCount", 0];
			private _hintMessage = format [localize "STR_misc_drone_ammo_remaining", _charges, _smokes];
			[_hintMessage] remoteExec ["hint", _caller];

			if (_smokes <= 0) then {
				_target removeAction _actionId;
			};

		}];
	} forEach [gunner _vehicle, driver _vehicle];
};
_handleResupply = {
	params["_vehicle", "_handleDrops"];
	//DICE NON ESISTE _HANDLEDROPS QUINDI DOPO LA RICARICA NON ESCONO LE ADDACTION PER DROPPARE MERDA
	_vehicle addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa'/> <t color=""#37A9E7"">" + localize 'STR_misc_drone_resupply' + "</t>",
	{
			params ["_target", "_caller", "_actionId", "_arguments"];
			_handleDrops = _arguments select 0;
			_vehicle = _target;
			_chargeTypes = [
				"DemoCharge_Remote_Mag"
			];
			_smokeTypes = [
				"SmokeShell"
				,"SmokeShellOrange"
				,"SmokeShellBlue"
				,"SmokeShellYellow"
				,"SmokeShellRed"
				,"SmokeShellGreen"
				,"SmokeShellPurple"
			];
			_foundCharge = _chargeTypes findIf { [_caller, _x] call BIS_fnc_hasItem };
			_foundSmoke = _smokeTypes findIf { [_caller, _x] call BIS_fnc_hasItem };
			private _charges = _vehicle getVariable ["chargesCount", 0];
			private _smokes = _vehicle getVariable ["smokesCount", 0];
			private _sum = _charges + _smokes;
			if(_foundCharge > -1 && _foundSmoke > -1 && _sum < 8) then 
			{
				_caller removeItem (_chargeTypes select _foundCharge);
				_caller removeItem (_smokeTypes select _foundSmoke);
				_vehicle setVariable ["chargesCount", 4];
				_vehicle setVariable ["smokesCount", 4];
				private _hintMessage = format [localize "STR_misc_drone_ammo_remaining", 4, 4];
				[_hintMessage] remoteExec ["hint", _caller];
				//Remove actions
				{
					removeAllActions _x;
				} forEach [gunner _vehicle, driver _vehicle];

				[_vehicle, _handleDrops] spawn _handleDrops;
			}
			else
			{
				private _dumb = 0;	//Don't know why but arma 3 does not show hint if there is no instruction before in else block
				private _hintMessage = format [localize "STR_misc_drone_unable"];
				[_hintMessage] remoteExec ["hint", _caller];
			}
	},[_handleDrops],2,true,true,"","!(_this in _target)",5];
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
[_drone, _handleDrops] spawn _handleResupply;
_drone setVariable ["chargesCount", 4];
_drone setVariable ["smokesCount", 4];
[_drone, _handleDrops] spawn _handleDrops;
[_drone] spawn _explosiveDrone;
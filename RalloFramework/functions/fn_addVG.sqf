/* Adds virtual garage to the given object */
params["_object", "_markerName"];
if(isNil "_object") exitWith { systemChat "fn_vehicleSpawner: _object not defined"; };
if(isNil "_markerName") exitWith { systemChat "fn_vehicleSpawner: _markerName not defined"; };
_object allowDamage false;
//_object addAction ["<t color='#C48214' size='2'>" + localize "STR_misc_garage" + "</t>",{[_this select 3] call FWK_fnc_virtualGarage;}, _markerName];
_icon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa";
[_object, localize 'STR_misc_garage', _icon, _icon, "_this distance _target < 8", "(_caller distance _target < 8)", {}, {}, {[_this select 3] call FWK_fnc_virtualGarage;}, {}, [_markerName], 0.5, 10, false, false, true] call BIS_fnc_holdActionAdd;
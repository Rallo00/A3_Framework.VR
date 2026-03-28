params["_generator", "_radius"];
_generator allowDamage false;

/*this addAction[localize "STR_misc_cutpower", {
	private _lampsInRadius = nearestObjects [player, ["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], _radius];
	{ [_x, false] call BIS_fn2c_switchLamp; } forEach _lampsIn200m;
	playSound "powerout";
}];*/


[
    this,
    localize "STR_misc_cutpower",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
    "_this distance _target < 2", "_caller distance _target < 2",{},{},
    {
		private _lampsInRadius = nearestObjects [player, ["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], _radius];
		{ [_x, false] call BIS_fn2c_switchLamp; } forEach _lampsIn200m;
		playSound "powerout";
    },{},[],5,0,false,false
] call BIS_fnc_holdActionAdd;

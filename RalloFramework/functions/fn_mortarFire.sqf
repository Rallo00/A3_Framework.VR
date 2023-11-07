params["_pos", "_shellSel"];
_shellType = 0;
if (_shellSel == 1) then { _shellType = "8Rnd_82mm_Mo_shells"; };
if (_shellSel == 2) then { _shellType = "32Rnd_155mm_Mo_shells"; };
if (_shellSel == 3) then { _shellType = "12Rnd_230mm_rockets"; };
_shellCount = [1, 8] call BIS_fnc_randomInt;
_radius = 100;
_delay = 5;
[_pos, _shellType, _radius, _shellCount, _delay] spawn BIS_fnc_fireSupportVirtual;

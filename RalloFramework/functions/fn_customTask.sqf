params["_taskID", "_IDnumber"];
private _debug = true;
private _defaultMainString = format ["STR_tsk_%1_main", _IDnumber];
private _defaultDescString = format ["STR_tsk_%1_desc", _IDnumber];

//Debug
if(_debug) then { hint format["Task ID: %1\nTask number: %2\nDefault Main: %3\nDefault Desc: %4", _taskID, _IDnumber, _defaultMainString, _defaultDescString] };

[FWK_PlayerSide, _taskID, [localize _defaultDescString, localize _defaultMainString, ""], objNull, "CREATED", 1, true] call BIS_fnc_taskCreate;

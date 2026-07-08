// Audio
5 fadeSound 0.3;
5 fadeMusic 0.3;
playMusic "BackgroundTrack02_F";

// ==============================
// Intro finale
// ==============================
sleep 8;
// MISSION COMPLETED
[format["<t color='#C48214' size='1.2' font='PuristaBold'>%1</t><br/><t size='.8'>%2 %3</t>", localize "STR_END_miscompleted", localize "STR_END_miscompleted2", localize "STR_INF_scenario_title"], -1, 0.35, 5, 1, 0, 789] spawn BIS_fnc_dynamicText;
sleep 7;
// ==============================
// Cinematica operatori
// ==============================
showCinemaBorder true;
private _players = allPlayers;
{
    private _unit = _x;
    if (alive _unit) then
    {
        _dir = getDir _unit; 
        _camPos = _unit getPos [4, _dir]; 
        _camPos set [2, ((_unit modelToWorld [0,0,0.5]) select 2)]; 
        _targetPos = _unit modelToWorld [0,0,1]; 
        _cam = "camera" camCreate _camPos; 
        _cam cameraEffect ["external","FRONT"]; 
        _cam camSetTarget _targetPos; 
        // Full body  
        _cam camSetFOV 0.75; 
        _cam camCommit 0;
        sleep 1;
        [parseText format["<t font='PuristaBold' size='1.6'>%1</t><br />%2", name _unit, roleDescription _unit], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
        sleep 5;
        _cam camSetTarget _targetPos;
        _cam camCommit 5;
    };
} forEach _players;
// ==============================
// After Action Report
// ==============================
private _nomiGiocatoriArray = [];
{
    _nomiGiocatoriArray pushBack name _x;
}
forEach allPlayers;
[
    format ["<t color='#C48214' size='1'>AFTER ACTION REPORT</t><br/><br/><t size='.8'>%1:<br/>%2</t>",
        localize "STR_END_operators",
        _nomiGiocatoriArray joinString "<br/>"
    ], -1, 0.05, 8, 1, 0, 789
] spawn BIS_fnc_dynamicText;
sleep 15;
10 fadeMusic 0;
10 fadeSound 1;
sleep 10;
endMission "winner";
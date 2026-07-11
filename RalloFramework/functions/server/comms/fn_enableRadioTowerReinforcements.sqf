params ["_pos", "_area"];
private _debug = false;

// Get the closest radio tower to the position
private _tower = [_pos, true] call FWK_fnc_nearestRadioTower;

if (isNull _tower || {!alive _tower}) exitWith {};

//Spawn enemies in tower
[position _tower, 75, 1] spawn FWK_fnc_enemyControlledArea;

//Create a trigger
_trigAttributeFaction = 0;
_trigAttributeFactionDetector = 0;
switch FWK_PlayerSide do
{
    case WEST: { _trigAttributeFaction = "EAST"; };
    case EAST: { _trigAttributeFaction = "WEST"; };
    case INDEPENDENT: { _trigAttributeFaction = "GUER";};
};
switch FWK_EnemySide do
{
    case WEST: { _trigAttributeFactionDetector = "WEST D"; };
    case EAST: { _trigAttributeFactionDetector = "EAST D"; };
    case INDEPENDENT: { _trigAttributeFactionDetector = "GUER D";};
};
private _trigPlayersDetected = createTrigger ["EmptyDetector", _pos];
_trigPlayersDetected setTriggerArea [_area, _area, 0, false];
_trigPlayersDetected setTriggerActivation [_trigAttributeFaction, _trigAttributeFactionDetector, true];

private _waveInterval = 600;
if(_debug) then { _waveInterval = 5; };

while { !isNull _tower && alive _tower } do 
{
    private _playersInside = [_pos, _area, FWK_PlayerSide] call FWK_fnc_getUnitsCount;
    private _enemyHasOwnership = [_pos, _area] call FWK_fnc_getCurrentOwnership;

    if (_playersInside > 0 && (triggerActivated _trigPlayersDetected) && (_enemyHasOwnership == FWK_EnemySide)) then 
    {
        sleep _waveInterval;
        if (_debug) then { systemChat "Reinforcements triggered."; hint format["Players count: %1\nTower alive: %2\nTrigger detected: %3", _playersInside, alive _tower, triggerActivated _trigPlayersDetected];};
        private _reinforcementScript = selectRandom [FWK_fnc_qrfAir, FWK_fnc_qrfLand, FWK_fnc_qrfParatroopers, FWK_fnc_qrfTransport];

        switch _reinforcementScript do 
        {
            case FWK_fnc_qrfAir: {
                [_pos, false] spawn FWK_fnc_qrfAir;
            };
            case FWK_fnc_qrfLand: {
                [_pos, false] spawn FWK_fnc_qrfLand;
            };
            case FWK_fnc_qrfParatroopers: {
                [_pos, false] spawn FWK_fnc_qrfParatroopers;
            };
            case FWK_fnc_qrfTransport: {
                [_pos, false] spawn FWK_fnc_qrfTransport;
            };
        };
    };
};
deleteVehicle _trigPlayersDetected;
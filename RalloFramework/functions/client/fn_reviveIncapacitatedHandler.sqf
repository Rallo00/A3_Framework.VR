FWK_fnc_spawnBlood = 
{
    params["_unit"];
    _blood = ["BloodPool_01_Large_New_F",
		  "BloodSplatter_01_Large_New_F",
	  	  "BloodPool_01_Medium_New_F",
	  	  "BloodSplatter_01_Medium_New_F"
    ] call BIS_fnc_selectRandom;
    _bloodPool = createSimpleObject [_blood, AGLtoASL getpos _unit];
};

private _cameraActive = false;
while {true} do 
{
    if (lifeState player == "INCAPACITATED" && !_cameraActive) then 
    {
        [player] remoteExec ["FWK_fnc_spawnBlood", 2];
        //Camera
        ["Initialize", [player, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
        _cameraActive = true;
    };
    if (!(lifeState player == "INCAPACITATED") && _cameraActive) then
    {
        [player] remoteExec ["FWK_fnc_spawnMedicalTrash", 2];
        ["Terminate"] call BIS_fnc_EGSpectator;
        _cameraActive = false;
    };
    sleep 2;
};
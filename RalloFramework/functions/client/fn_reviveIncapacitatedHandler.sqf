private _cameraActive = false;
while {true} do 
{
    if (lifeState player == "INCAPACITATED" && !_cameraActive) then 
    {
        //Spawn blood
        _blood = ["BloodPool_01_Large_New_F",
		  "BloodSplatter_01_Large_New_F",
	  	  "BloodPool_01_Medium_New_F",
	  	  "BloodSplatter_01_Medium_New_F"
	 	] call BIS_fnc_selectRandom;
         _bloodPool = createSimpleObject [_blood, AGLtoASL getpos player];
        //Camera
        ["Initialize", [player, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
        _cameraActive = true;
    };
    if (!(lifeState player == "INCAPACITATED") && _cameraActive) then
    {
        ["Terminate"] call BIS_fnc_EGSpectator;
        _cameraActive = false;
    };
    sleep 2;
};
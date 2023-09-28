params["_marker","_cratersCount"];

_soilArray = ["Land_ShellCrater_02_extralarge_F","Land_ShellCrater_02_large_F","Land_ShellCrater_02_small_F","Land_ShellCrater_01_F"];
_debrisClass = "Land_ShellCrater_02_debris_F";
_craterClass = "Crater";

//Creating random position and spawning craters
for "_i" from 0 to _cratersCount - 1 do {
  _randomPosAGL = [[_marker], []] call BIS_fnc_randomPos;
  _randomPosAGL set [2, 0];
  _craterClass createVehicle _randomPosAGL;
  _soil = _soilArray call BIS_fnc_selectRandom;
  //Positioning height
  _posHeightAGL = 0;
  switch (_soil) do
  {
	case "Land_ShellCrater_02_extralarge_F": { _posHeightAGL = random[-1.068, -0.534, 0]; };
	case "Land_ShellCrater_02_large_F": { _posHeightAGL = random[-0.717, -0.359, 0]; };
	case "Land_ShellCrater_02_small_F": { _posHeightAGL = random[-0.321, -0.161, 0]; };
  };
  _soilPos = _randomPosAGL;
  _soilPos set [2, _posHeightAGL];
  _soil createVehicle _soilPos;
}
/* It creates a minefield with a random number of mines and IED and positioned in random way. Every mine adds IED explosion effect for better scenery */
params["_area", "_minMinesCount", "_maxMinesCount"];
_minesArray = ["ATMine","APERSBoundingMine","APERSMine","IEDLandBig_F","IEDUrbanBig_F","IEDUrbanSmall_F","IEDLandSmall_F"];
_minesCountInArea = random[_minMinesCount, _maxMinesCount/2, _maxMinesCount];
_areaDimensions = getMarkerSize _markerArea;
_minesPositionRange = _areaDimensions select 0;

//Creating random position and spawning mines
for "_i" from 0 to _minesCountInArea - 1 do {
  _randomPos = [[_markerArea], []] call BIS_fnc_randomPos;
  _randomPos set [2, 0];
  createMine[selectRandom _minesArray, _randomPos, [], 0];
}
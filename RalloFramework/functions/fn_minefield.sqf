/* It creates a minefield with a random number of mines and IED and positioned in random way. Every mine adds IED explosion effect for better scenery */
params ["_position", "_diameter"];
private _debug = true;

_minesArray = ["ATMine", "APERSBoundingMine", "APERSMine", "IEDLandBig_F", "IEDUrbanBig_F", "IEDUrbanSmall_F", "IEDLandSmall_F"];
_density = 0.1;

// Calculate the area of the circle
_area = 3.14159 * _diameter;

// Calculate the number of mines based on area size and density
_numMines = round (_area * _density);

//Debug
if(_debug) then { hint format["Position: %1\nRadius: %2\nMines count: %3", _position, _diameter / 2, _numMines] };

for "_i" from 1 to _numMines do {
    // Randomly select a mine type from the array
    _mineType = selectRandom _minesArray;
    // Generate a random position within the circle
    _angle = random 360;
    _distance = _diameter * sqrt random 1; // sqrt for uniform distribution in the circle
    _xOffset = _distance * cos _angle;
    _yOffset = _distance * sin _angle;
    _minePos = [(_position select 0) + _xOffset, (_position select 1) + _yOffset, 0];
    // Create the mine at the calculated position
    _mine = createMine [_mineType, _minePos, [], 0];
};
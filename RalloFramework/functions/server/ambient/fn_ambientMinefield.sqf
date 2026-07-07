params ["_position", "_diameter"];
if (isNil "_position") exitWith { systemChat "fn_mineField: _position not defined"; };
if (isNil "_diameter") exitWith { systemChat "fn_mineField: _diameter not defined"; };

private _debug = false;

private _minesArray = [
    "ATMine", "APERSBoundingMine", "APERSMine",
    "IEDLandBig_F", "IEDUrbanBig_F", "IEDUrbanSmall_F", "IEDLandSmall_F"
];

// DENSITY (tuning server-friendly)
private _density = 0.0002;
private _maxMines = 500;     // safe hard cap 

// Area
private _area = 3.14159 * (_diameter / 2) ^ 2;

// mines count with limit
private _numMines = round (_area * _density);
_numMines = _numMines min _maxMines;

// Debug
if (_debug) then {
    hint format [
        "Radius: %1\nArea: %2\nMines: %3",
        _diameter / 2,
        _area,
        _numMines
    ];
};

for "_i" from 1 to _numMines do {

    private _mineType = selectRandom _minesArray;

    private _angle = random 360;
    private _distance = (_diameter / 2) * sqrt random 1;

    private _xOffset = _distance * cos _angle;
    private _yOffset = _distance * sin _angle;

    private _minePos = [
        (_position select 0) + _xOffset,
        (_position select 1) + _yOffset,
        0
    ];

    private _mine = createMine [_mineType, _minePos, [], 0];

    if (_debug) then {
        private _marker = createMarker [
            format ["mine_marker_%1", _i],
            _minePos
        ];
        _marker setMarkerType "hd_dot";
        _marker setMarkerColor "ColorRed";
        _marker setMarkerSize [0.5, 0.5];
    };
};
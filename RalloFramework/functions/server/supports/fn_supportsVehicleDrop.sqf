params ["_isFriendly"];
private _pos = [] call FWK_fnc_getMapClickPos;
private _debug = true;
private _faction = FWK_PlayerFaction;
private _side = FWK_PlayerSide;
private _vehicleType = 0;
private _transportType = "B_T_VTOL_01_vehicle_F";

//Creating transport for cargo drop
_transportArray = [[0,0,100], random 360, _transportType, _side] call BIS_fnc_spawnVehicle;
_transportVeh = _transportArray select 0;
_transportGrp = _transportArray select 2;
//Returns a random vehicle and checks if vehicle can fit in cargo
private _cargoVehicle = 0;
private _cargoConfirmed = false;
while {!_cargoConfirmed} do
{
  _vehicleType = selectRandom ([_faction] call FWK_fnc_getFactionLV);
  _cargoVehicle = _vehicleType createVehicle [0,0,1000];
  _canVehicleFitInCargo = _transportVeh canVehicleCargo _cargoVehicle;
  //Loading cargo or deleting if does not fit
  if(_canVehicleFitInCargo select 1) then { _cargoConfirmed = true; _transportVeh setVehicleCargo _cargoVehicle; }
  else { deleteVehicle _cargoVehicle; };
};

//Debug
if(_debug) then { hint format ["Position: %1\nSide: %2\nFaction: %3\nVehicle type: %4\nTransport type: %5", _pos, _side, _faction, _vehicleType, _transportType]; };

_transportVeh allowDamage false;
_transportVeh setCaptive true;
_cargoVehicle allowDamage false;

//Setting waypoints
_waypoint = _transportGrp addWaypoint [_pos, 0];
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "NOCHANGE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointType "MOVE";
_waypoint setWaypointStatements ["_transportVeh flyInHeight 200",""];
_transportVeh sideChat format["%1", localize "STR_support_confirmed"];

//Go to drop zone
_transportGrp setCurrentWaypoint [_transportGrp, 0];
waitUntil { (_transportVeh distance2D _pos) < 100 };
//Drop cargo
_transportVeh sideChat format["%1", localize "STR_support_vehicle_airdrop_unloaded"];
_transportVeh setVehicleCargo objNull;
_cargoVehicle allowDamage true;

//Go away
_pilot = leader _transportGrp;
//_pilot doMove ([0,0,0]);
waitUntil { (getPosATL _cargoVehicle) select 2 < 10 };
Signal = "SmokeShellPurple" createVehicle position _cargoVehicle;
//Cleanup
sleep 40;
{deleteVehicle _x} forEach (crew _transportVeh) + [_transportVeh]; 
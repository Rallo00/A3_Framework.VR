_unit = param[0];
_unitPos = position _unit;
_randomTransportPos = [[_unitPos select 0, _unitPos select 1, 800], 3000, random 360] call BIS_fnc_relPos;
_sideUnit = side _unit;
_factionUnit = faction _unit;
_vehicleType = 0;
_transportType = "B_T_VTOL_01_vehicle_F";
switch(_factionUnit) do
{
  //Vanilla units
  case "BLU_F":   { _vehicleType = ["B_MRAP_01_F","B_LSV_01_unarmed_F"] call BIS_fnc_selectRandom; };
  case "BLU_T_F";
  case "BLU_W_F": { _vehicleType = ["B_T_MRAP_01_F","B_T_LSV_01_unarmed_F"] call BIS_fnc_selectRandom; };
  case "OPF_F": { _vehicleType = "O_LSV_02_unarmed_F"; _transportType = "O_T_VTOL_02_vehicle_dynamicLoadout_F"; };
  case "OPF_T_F";
  case "OPF_R_F": { _vehicleType = "O_T_LSV_02_unarmed_F"; _transportType = "O_T_VTOL_02_vehicle_dynamicLoadout_F"; };
  case "IND_F  ": { _vehicleType = "I_MRAP_03_F"; };
  case "IND_E_F": { _vehicleType = "I_E_Van_02_vehicle_F"; };
  //RHS units
  case "rhs_faction_usarmy_d";
  case "rhs_faction_usmc_d": { _vehicleType = "rhsusf_m1043_d"; _transportType = "RHS_C130J_Cargo"; };
  case "rhs_faction_usarmy_wd";
  case "rhs_faction_usmc_wd": { _vehicleType = "rhsusf_m1043_w"; _transportType = "RHS_C130J_Cargo"; };
  case "rhs_faction_msv";
  case "rhs_faction_vdv": { _vehicleType = "rhs_tigr_msv"; };
};

//Creating transport for cargo drop
_transportArray = [_randomTransportPos, random 360, _transportType, _sideUnit] call BIS_fnc_spawnVehicle;
_transportVeh = _transportArray select 0;
_transportGrp = _transportArray select 2;
//Support call
_unit sideChat format["%1 %2.", localize "STR_support_vehicle_airdrop_call", mapGridPosition _unitPos];
sleep 5;
[_sideUnit, "HQ"] sideChat format["%1", localize "STR_support_vehicle_airdrop_response"];
//Spawning cargo and loading
_cargoVehicle = _vehicleType createVehicle [0,0,1000];
_transportVeh setVehicleCargo _cargoVehicle;
_cargoVehicle2 = _vehicleType createVehicle [20,20,1000];
if ((_transportVeh canVehicleCargo _cargoVehicle2) select 1) then
{ _transportVeh setVehicleCargo _cargoVehicle2; }
else { deleteVehicle _cargoVehicle2; };

//Setting waypoints
_waypoint = _transportGrp addWaypoint [_unitPos, 0];
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "NOCHANGE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointType "MOVE";
_waypoint setWaypointStatements ["_transportVeh flyInHeight 200",""];
//Go to drop zone
_transportGrp setCurrentWaypoint [_transportGrp, 0];
waitUntil { (_transportVeh distance _unitPos) < 200 };
//Drop cargo
_transportVeh sideChat format["%1", localize "STR_support_vehicle_airdrop_dropping"];
_transportVeh setVehicleCargo objNull;
_transportVeh setVehicleCargo objNull;
//Go away
_waypoint2 = _transportGrp addWaypoint [[0,0,1000], 1];
_waypoint2 setWaypointBehaviour "CARELESS";
_waypoint2 setWaypointCombatMode "NOCHANGE";
_waypoint2 setWaypointSpeed "FULL";
_waypoint2 setWaypointType "MOVE";
_waypoint2 setWaypointStatements ["true",""];
_transportGrp setCurrentWaypoint [_transportGrp, 1];
waitUntil { (getPosATL _cargoVehicle) select 2 < 10 };
Signal = "SmokeShellPurple" createVehicle position _cargoVehicle;
Signal = "SmokeShellPurple" createVehicle position _cargoVehicle2;
sleep 30;
//Cleanup
{deleteVehicle _x} forEach (crew _transportVeh) + [_transportVeh];

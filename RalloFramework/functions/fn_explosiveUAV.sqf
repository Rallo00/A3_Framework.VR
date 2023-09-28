_veh = param[0];
if(isNull _veh) exitWith {};

waitUntil {(damage _veh) > 0.8};
bomb = "IEDUrbanBig_Remote_Ammo" createVehicle (_veh modelToWorld [0,0,-0.5]); //Spawn a bomb
bomb setDamage 1;
deleteVehicle _veh ;
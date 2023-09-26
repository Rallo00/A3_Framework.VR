/*	Returns a list of infantry or vehicles or air vehicles per desired faction */
params["_faction"];
_resultArray = [];

//--- VANILLA ---
//NATO (standard)
if (_faction == "BLU_F") then { _resultArray = ["B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_medical_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_Truck_03_fuel_F","O_Truck_03_ammo_F","O_Truck_03_Repair_F","O_Truck_03_medical_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_Truck_02_fuel_F","I_Truck_02_ammo_F","I_Truck_02_Repair_F","I_Truck_02_medical_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_Repair_ghex_F","O_T_Truck_03_medical_ghex_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_Truck_01_fuel_F","B_T_Truck_01_ammo_F","B_T_Truck_01_Repair_F","B_T_Truck_01_medical_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_Truck_01_fuel_F","B_T_Truck_01_ammo_F","B_T_Truck_01_Repair_F","B_T_Truck_01_medical_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_Repair_ghex_F","O_T_Truck_03_medical_ghex_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_E_Truck_02_fuel_F","I_E_Truck_02_Ammo_F","I_E_Truck_02_Box_F","I_E_Truck_02_Medical_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_d","rhsusf_M997A4_AMMO_BKIT_usarmy_d","rhsusf_M978A4_BKIT_usarmy_d"] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_wd","rhsusf_M997A4_AMMO_BKIT_usarmy_wd","rhsusf_M978A4_BKIT_usarmy_wd"] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_d","rhsusf_M997A4_AMMO_BKIT_usarmy_d","rhsusf_M978A4_BKIT_usarmy_d"] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_wd","rhsusf_M997A4_AMMO_BKIT_usarmy_wd","rhsusf_M978A4_BKIT_usarmy_wd"] };
//RHS AFRF (Russia MSV)
//RHS AFRF (Russia VDV)
//Eric J Taliban Units
//RHS SAF (ChDHZ)

_resultArray;
/*	Returns a list of infantry or vehicles or air vehicles per desired faction */
params["_faction"];
_resultArray = [];

//--- VANILLA ---
//NATO (standard)
if (_faction == "BLU_F") then { _resultArray = ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_MBT_02_arty_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_Truck_02_MRL_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_MBT_02_arty_ghex_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_T_MBT_02_arty_ghex_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_E_Truck_02_MRL_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["rhsusf_M142_usarmy_D","rhsusf_m109d_usarmy","RHS_M119_D"] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["rhsusf_M142_usarmy_WD","rhsusf_m109_usarmy","RHS_M119_WD"] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["rhsusf_M142_usarmy_D","rhsusf_m109d_usarmy","RHS_M119_D"] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["rhsusf_M142_usarmy_WD","rhsusf_m109_usarmy","RHS_M119_WD"] };
//RHS AFRF (Russia MSV)
//RHS AFRF (Russia VDV)
//Eric J Taliban Units
//RHS SAF (ChDHZ)

_resultArray;
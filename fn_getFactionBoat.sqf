/*	Returns a list of infantry or vehicles or air vehicles per desired faction */
params["_faction"];
_resultArray = [];

//--- VANILLA ---
//NATO (standard)
if (_faction == "BLU_F") then { _resultArray = ["B_Boat_Armed_01_minigun_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_Boat_Armed_01_hmg_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_Boat_Armed_01_minigun_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_Boat_Armed_01_hmg_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_Boat_Armed_01_minigun_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_Boat_Armed_01_minigun_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_T_Boat_Armed_01_hmg_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_Boat_Armed_01_minigun_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["rhsusf_mkvsoc"] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["rhsusf_mkvsoc"] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["rhsusf_mkvsoc"] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["rhsusf_mkvsoc"] };
//RHS AFRF (Russia MSV)
//RHS AFRF (Russia VDV)
//Eric J Taliban Units
//RHS SAF (ChDHZ)

_resultArray;
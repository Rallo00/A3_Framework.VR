/*	Returns a list of infantry or vehicles or air vehicles per desired faction */
params["_faction"];
_resultArray = [];

//--- VANILLA ---
//NATO (standard)
if (_faction == "BLU_F") then { _resultArray = ["B_Heli_Attack_01_dynamicLoadout_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_Heli_Attack_02_dynamicLoadout_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_Heli_light_03_dynamicLoadout_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_Heli_Attack_02_dynamicLoadout_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_Heli_Attack_01_dynamicLoadout_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_Heli_Attack_01_dynamicLoadout_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_Heli_Attack_02_dynamicLoadout_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_Heli_light_03_dynamicLoadout_F"]; };

//--- MOD ---
///RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["RHS_AH64D","RHS_AH64DGrey"] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["RHS_AH64D"] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["RHS_AH1Z","RHS_AH64DGrey"] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["RHS_AH1Z","RHS_AH64DGrey"] };
//RHS AFRF (Russia MSV)
//RHS AFRF (Russia VDV)
//Eric J Taliban Units
//RHS SAF (ChDHZ)
	
_resultArray;
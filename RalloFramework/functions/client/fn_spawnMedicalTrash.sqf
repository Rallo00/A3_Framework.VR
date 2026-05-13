params["_incapacitatedUnit"];
_generalTrash = ["MedicalGarbage_01_5x5_v1_F",
				 "MedicalGarbage_01_3x3_v1_F",
			 	 "MedicalGarbage_01_3x3_v2_F"	
				] call BIS_fnc_selectRandom;
// field medical bag open
if (random 1 > 0.5) then { randomPos = _incapacitatedUnit getRelPos [1, 45 + random 90]; } // to the right
else { randomPos = _incapacitatedUnit getRelPos [1, -(45 + random 90)]; }; // to the left 
_medBag = createSimpleObject ["Land_FirstAidKit_01_open_F", AGLtoASL randomPos];
_medBag setDir random 359; 
sleep 1;
// blood bag
_randomPos = _incapacitatedUnit getRelPos [0.5 + random 1, random 360]; 
_bloodBag = createSimpleObject ["Land_BloodBag_F", AGLtoASL _randomPos];
_bloodBag setDir random 359;  
sleep 1;
// bandage new
_randomPos = _incapacitatedUnit getRelPos [0.5 + random 1, random 360]; 
_bandage = createSimpleObject ["Land_Bandage_F", AGLtoASL _randomPos];
_bandage setDir random 359;  
sleep 1;
// bandage dirty
_randomPos = _incapacitatedUnit getRelPos [0.5 + random 1, random 360]; 
_bandageDirty = createSimpleObject ["MedicalGarbage_01_Bandage_F", AGLtoASL _randomPos];
_bandageDirty setDir random 359;  
sleep 1;
// medical garbage 3x3
_medGarbage = createSimpleObject [_generalTrash, AGLtoASL getpos _incapacitatedUnit];
_medGarbage setDir random 359; 
params["_unit", "_coef"];		//Coef: 0 = small garbage (heal only), 1 = medium garbage (revive), 2 = large blood (death)

switch (_coef) do {
	//SMALL GARBAGE (HEAL)
	case 0: 
	{
		//Small blood
		_smallBlood = createSimpleObject ["BloodSplatter_01_Small_New_F", AGLtoASL getpos _unit];
		_smallBlood setDir random 359; 
		_generalTrash = ["MedicalGarbage_01_1x1_v1_F","MedicalGarbage_01_1x1_v2_F","MedicalGarbage_01_1x1_v3_F"] call BIS_fnc_selectRandom;
		//Medical garbage
		_medGarbage = createSimpleObject [_generalTrash, AGLtoASL getpos _unit];
		_medGarbage setDir random 359; 
		//Bandage with blood
		for "_i" from 1 to 2 do
		{
			_randomPos = _healer getRelPos [0.5 + random 1, random 360]; 
			_bandageDirty = createSimpleObject ["MedicalGarbage_01_Bandage_F", AGLtoASL _randomPos];
			_bandageDirty setDir random 359;  
		};
	};
	//MEDIUM GARBAGE (REVIVE)
	case 1: 
	{
		_generalTrash = ["MedicalGarbage_01_5x5_v1_F",
					 "MedicalGarbage_01_3x3_v1_F",
				 	 "MedicalGarbage_01_3x3_v2_F"	
		] call BIS_fnc_selectRandom;
		// field medical bag open
		if (random 1 > 0.5) then { randomPos = _unit getRelPos [1, 45 + random 90]; } // to the right
		else { randomPos = _unit getRelPos [1, -(45 + random 90)]; }; // to the left 
		_medBag = createSimpleObject ["Land_FirstAidKit_01_open_F", AGLtoASL randomPos];
		_medBag setDir random 359; 
		// bandage dirty
		_randomPos = _unit getRelPos [0.5 + random 1, random 360]; 
		_bandageDirty = createSimpleObject ["MedicalGarbage_01_Bandage_F", AGLtoASL _randomPos];
		_bandageDirty setDir random 359;  
		sleep 1;
		// medical garbage 3x3
		_medGarbage = createSimpleObject [_generalTrash, AGLtoASL getpos _unit];
		_medGarbage setDir random 359; 
	};
	//LARGE BLOOD (DEATH)
	case 2: 
	{
		// Spawn blood once and bandage
		_bloodPool = createSimpleObject ["BloodPool_01_Large_New_F", AGLtoASL position _unit];
		_bloodPool setDir random 359;
		_randomPos = _unit getRelPos [0.5 + random 1, random 360];
		_bandage = createSimpleObject ["Land_Bandage_F", AGLtoASL _randomPos];
		_bandage setDir random 359;
		// Spawn random dirty bandages (0 to 4)
		_bandageDirtyCount = [2, 4] call BIS_fnc_randomInt;
		for "_i" from 1 to _bandageDirtyCount do
		{
			_randomPos = _unit getRelPos [0.5 + random 1, random 360];
			_bandageDirty = createSimpleObject ["MedicalGarbage_01_Bandage_F", AGLtoASL _randomPos];
			_bandageDirty setDir random 359;
		};
	};
};

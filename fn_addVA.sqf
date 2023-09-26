/* Adds virtual arsenal to the given object */
_object = param[0];
clearMagazineCargo _object;
clearItemCargo _object;
clearWeaponCargo _object;
_object allowDamage false;
_object addAction ["<t color='#C48214' size='2'>" + localize "STR_misc_arsenal" + "</t>","['Open',true] spawn BIS_fnc_arsenal;"];

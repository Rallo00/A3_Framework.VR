_crate = param[0];

if (FWK_isTfarActive) then 
{
	_crate allowDamage false;
	_crate enableSimulation false;
	clearMagazineCargoGlobal _crate; 
	clearItemCargoGlobal _crate; 
	clearWeaponCargoGlobal _crate; 
	if (FWK_PlayerSide == west) then { _crate addWeaponCargoGlobal["TFAR_anprc152", 50]; };
	if (FWK_PlayerSide == east) then { _crate addWeaponCargoGlobal["TFAR_fadak", 50]; };
	if (FWK_PlayerSide == independent) then { _crate addWeaponCargoGlobal["TFAR_anprc148jem", 50]; };
};
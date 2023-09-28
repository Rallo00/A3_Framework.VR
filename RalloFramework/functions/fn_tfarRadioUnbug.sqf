_crate = param[0];

if (FWK_IsTfarActive) then 
{
	_crate allowDamage false;
	_crate enableSimulation false;
	clearMagazineCargo _crate; 
	clearItemCargo _crate; 
	clearWeaponCargo _crate; 

	if (FWK_PlayerSide == west) then 
	{
		_crate addAction["<t color='#37A9E7'>--- " + localize "STR_misc_take" + " AN/PRC-152 ---</t>","player addItemToVest 'tf_anprc152';"];
		_crate addAction["<t color='#37A9E7'>--- " + localize "STR_misc_take" + " RT1523G ---</t>","player addItemToVest 'tf_rt1523g_big_rhs';"];
	};
	if (FWK_PlayerSide == east) then 
	{
		_crate addAction["<t color='#37A9E7'>--- " + localize "STR_misc_take" + " Fadak ---</t>","player addItemToVest 'tf_fadak';"];
		_crate addAction["<t color='#37A9E7'>--- " + localize "STR_misc_take" + " MR3000 ---</t>","player addItemToVest 'tf_mr3000_rhs';"];
	};
	if (FWK_PlayerSide == independent) then 
	{
		_crate addAction["<t color='#37A9E7'>--- " + localize "STR_misc_take" + " AN/PRC-148 ---</t>","player addItemToVest 'tf_anprc148jem';"];
		_crate addAction["<t color='#37A9E7'>--- " + localize "STR_misc_take" + " AN/PRC-155 ---</t>","player addItemToVest 'tf_anprc155';"];
	};
};
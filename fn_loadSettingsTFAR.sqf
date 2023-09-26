/* Sets all clients radios with following settings. Works on MP too */
//Disables automatic distribution of backpack radios to group leaders    NON FUNZIONA, PERCHE?
TF_no_auto_long_range_radio = false;
//Enables distribution of commander radios to squadmates
TF_give_personal_radio_to_regular_soldier = true;
TF_give_microdagr_to_soldier = false;
//Generates identical settings for the entire faction
TF_same_sw_frequencies_for_side = true;
TF_same_lr_frequencies_for_side = true;
//Audio isolation from inside the vehicle (with speaker on)
{ _x setVariable ["tf_isolatedAmount", 0.2, true]; } forEach vehicles;
//Generating frequencies
_settingsSwWest = false call TFAR_fnc_generateSwSettings;
   _settingsSwWest set [2, ["100","500","200","300","400","600","700","800"]];
   tf_freq_west = _settingsSwWest;
_settingsLrWest = false call TFAR_fnc_generateLrSettings;
	_settingsLrWest set [2, ["30","40","50","60","70","80","45","55","65"]];
	tf_freq_west_lr = _settingsLrWest;
params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
// Spawn blood once and bandage
_bloodPool = createSimpleObject ["BloodPool_01_Large_New_F", AGLtoASL position _oldUnit];
_bloodPool setDir random 359;
_randomPos = _oldUnit getRelPos [0.5 + random 1, random 360];
_bandage = createSimpleObject ["Land_Bandage_F", AGLtoASL _randomPos];
_bandage setDir random 359;
// Spawn random dirty bandages (0 to 4)
_bandageDirtyCount = [2, 4] call BIS_fnc_randomInt;
for "_i" from 1 to _bandageDirtyCount do
{
	_randomPos = _oldUnit getRelPos [0.5 + random 1, random 360];
	_bandageDirty = createSimpleObject ["MedicalGarbage_01_Bandage_F", AGLtoASL _randomPos];
	_bandageDirty setDir random 359;
};

// Broadcast remaining respawns if tickets are enabled
if (FWK_RespawnTickets != 0 && FWK_RespawnTickets != 999) then
{
	_ticketsRemaining = [FWK_PlayerSide] call BIS_fnc_respawnTickets;
	systemChat format [localize "STR_respawn_tickets_remaining", name player, _ticketsRemaining];
};
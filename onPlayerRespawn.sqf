params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
[_oldUnit, 2] spawn FWK_fnc_spawnMedicalTrash;

// Broadcast remaining respawns if tickets are enabled
if (FWK_RespawnTickets != 0 && FWK_RespawnTickets != 999) then
{
	_ticketsRemaining = [FWK_PlayerSide] call BIS_fnc_respawnTickets;
	systemChat format [localize "STR_respawn_tickets_remaining", name player, _ticketsRemaining];
};
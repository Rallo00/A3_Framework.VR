/* FUNCTIONS */
class CfgFunctions
{
	class FWK
	{
		tag = "FWK";
		class Framework
		{
			file = "RalloFramework\functions";
			//Actions
			class activateStealth {};			//[0 to 1] spawn FWK_fnc_activateStealth; (allUnits)
			class addVA {};						//[object] spawn FWK_fnc_addVA;
			class allowCustomSupports {};		//[] spawn FWK_fnc_allowCustomSupports;
			class bigExplosion {};				//[object] spawn FWK_fnc_bigExplosion;
			class centerScreenText {}; 			//["TEXT"] spawn FWK_fnc_centerScreenText;
			class craterArea {};				//["markerName", numOfCraters] spawn FWK_fnc_craterArea;
			class customTask {};				//["task1", 1] spawn FWK_fnc_customTask;
			class deleteVehicle {};				//[object] spawn FWK_fnc_deleteVehicle; (also deletes Crew inside)
			class eastWestTruce {};				//[0 or 1] spawn FWK_fnc_eastWestTruce;
			class ending {};					//[] spawn FWK_fnc_ending;
			class enemyControlledArea {};		//[position, areaSize, criticalLevel] spawn FWK_fnc_enemyControlledArea;
			class enemyQrfTransport {};			//[position] spawn FWK_fnc_enemyQrfTransport;
			class enemyQrfLand {};				//[position] spawn FWK_fnc_enemyQrfLand;
			class enemyQrfParatroopers {};		//[position] spawn FWK_fnc_enemyQrfParatroopers;
			class enemyPatrols {};				//[position, range, patrolsCount] spawn FWK_fnc_enemyPatrols;
			class getCurrentOwnership {};		//[position, distanceRange] call FWK_fnc_getCurrentOwnership;
			class getFactionAir {};				//[faction] call FWK_fnc_getFactionAir;
			class getFactionAntiAir {};			//[faction] call FWK_fnc_getFactionAntiAir;
			class getFactionArtillery {};		//[faction] call FWK_fnc_getFactionArtillery;
			class getFactionBoat {};			//[faction] call FWK_fnc_getFactionBoat;
			class getFactionGunship {};			//[faction] call FWK_fnc_getFactionGunship;
			class getFactionHelo {};			//[faction] call FWK_fnc_getFactionHelo;
			class getFactionHV {};				//[faction] call FWK_fnc_getFactionHV;
			class getFactionLV {};				//[faction] call FWK_fnc_getFactionLV;
			class getFactionInfantry {};		//[faction] call FWK_fnc_getFactionInfantry;
			class getFactionStatic {};			//[faction] call FWK_fnc_getFactionStatic;
			class getFactionSupport {};			//[faction] call FWK_fnc_getFactionSupport;
			class getMapClickPos {};			//[] call FWK_fnc_getMapClickPos;
			class getRandomAO {};				//[] call FWK_fnc_getRandomAO;
			class getRandomAOLocation {};		//[AO, minDistanceRange, maxDistanceRange] [] call FWK_fnc_getRandomAOLocation;
			class getUnitsCount {};				//[position, distanceRange, side] spawn FWK_fnc_getUnitsCount;
			class halo {};						//[player] spawn FWK_fnc_halo;
			class isModActive {};				//["mod"] call FWK_fnc_isModActive;
			class isPlayerVanillaFaction {};	//[] call FWK_fnc_isPlayerVanillaFaction;
			class loadSettingsTFAR {};			//[] spawn FWK_fnc_loadSettingsTFAR;
			class localAmbientSounds {};		//[] spawn FWK_fnc_localAmbientSounds;
			class localPlayerInit {};			//[] spawn FWK_fnc_localPlayerInit;
			class mapCleanup {};				//[position, range] spawn FWK_fnc_mapCleanup;
			class mortarFire {};				//[position, shellType] spawn FWK_fnc_mortarFire; (1=82mm/2=155mm/3=230mm)
			class minefield {};					//[position, int minMines, int maxMines] spawn FWK_fnc_minefield;
			class multicapabilitiesUAV {};		//[obj] spawn FWK_fnc_multicapabilitiesUAV;
			class raiseAlarm {};				//[object, int totalNumbersOfAlarmSound] spawn FWK_fnc_raiseAlarm;
			class randomWeather {};				//[] spawn FWK_fnc_randomWeather;
			class reinforcements {};			//[side, spawnPosition, int rangeSpawn, bool spawnVehicle] spawn FWK_fnc_reinfocements;
			class roadblock {};					//[pos] spawn FWK_fnc_roadblock;
			class setDateTime {};				//[int] spawn FWK_fnc_setDateTime;
			class surrenderUnits {};			//[position, distanceRange, side] spawn FWK_fnc_surrenderUnits;
			class vehicleDrop {};				//[position, isFriendlyVehicle] spawn FWK_fnc_vehicleDrop;
			class vehicleRandomStatus{};		//[object, bool forceSomeFuelInVehicle, bool forceSomeAmmoInVehicle] spawn FWK_fnc_vehicleRandomStatus;
			class vehicleUnflip {};				//[vehicle] spawn FWK_fnc_vehicleUnflip;
			class teleportToLeader {};			//[player] spawn FWK_fnc_teleportToLeader;
			class teleportToGrid {};
			class tfarRadioUnbug {};			//[this] spawn FWK_fnc_tfarRadioUnbug;
			class unitKamikaze {};				//[unit] spawn FWK_fnc_unitKamikaze;
		};
	};
};
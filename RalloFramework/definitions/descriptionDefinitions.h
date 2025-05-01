/* FUNCTIONS */
class CfgFunctions
{
	class FWK
	{
		tag = "FWK";
		class Framework
		{
			file = "RalloFramework\functions";

			//Editing
			class activateStealth {};			//[0 to 1] spawn FWK_fnc_activateStealth; (allUnits)
			class centerScreenText {}; 			//["TEXT"] spawn FWK_fnc_centerScreenText;
			class customTask {};				//["task1", 1] spawn FWK_fnc_customTask;
			class deleteVehicle {};				//[object] spawn FWK_fnc_deleteVehicle; (also deletes Crew inside)
			class ending {};					//[] spawn FWK_fnc_ending;
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
			class getFactionTransport {};		//[faction] call FWK_fnc_getFactionTransport;
			class getMapClickPos {};			//[] call FWK_fnc_getMapClickPos;
			class getRandomAO {};				//[] call FWK_fnc_getRandomAO;
			class getRandomAOLocation {};		//[AO, minDistanceRange, maxDistanceRange] [] call FWK_fnc_getRandomAOLocation;
			class getUnitsCount {};				//[position, distanceRange, side] spawn FWK_fnc_getUnitsCount;
			class isModActive {};				//["mod"] call FWK_fnc_isModActive;
			class isPlayerVanillaFaction {};	//[] call FWK_fnc_isPlayerVanillaFaction;
			class localPlayerInit {};			//[] spawn FWK_fnc_localPlayerInit;
			class teleportToLeader {};			//[player] spawn FWK_fnc_teleportToLeader;
			class teleportToGrid {};			//[unit, destinationGrid] spawn FWK_fnc_teleportToGrid;
			class vehicleRandomStatus{};		//[object, bool forceSomeFuelInVehicle, bool forceSomeAmmoInVehicle] spawn FWK_fnc_vehicleRandomStatus;
			class vehicleUnflip {};				//[vehicle] spawn FWK_fnc_vehicleUnflip;

			//Actions
			class bigExplosion {};				//[object] spawn FWK_fnc_bigExplosion;
			class halo {};						//[player] spawn FWK_fnc_halo;
			class multicapabilitiesUAV {};		//[obj] spawn FWK_fnc_multicapabilitiesUAV;
			
			//Terrain areas customization
			class craterArea {};				//["markerName", numOfCraters] spawn FWK_fnc_craterArea;
			class mortarFire {};				//[position, shellType] spawn FWK_fnc_mortarFire; (1=82mm/2=155mm/3=230mm)
			class minefield {};					//[position, int minMines, int maxMines] spawn FWK_fnc_minefield;

			//QRF and reinforcements
			class enemyControlledArea {};		//[position, areaSize, criticalLevel] spawn FWK_fnc_enemyControlledArea;
			class enemyPatrols {};				//[position, range, patrolsGroupCount, hasVehicle] spawn FWK_fnc_enemyPatrols;
			class qrfAir {};					//[position, bool isFriendly] spawn FWK_fnc_qrfAir;
			class qrfLand {};					//[position, bool isFriendly] spawn FWK_fnc_qrfLand;
			class qrfParatroopers {};			//[position, bool isFriendly] spawn FWK_fnc_qrfParatroopers;
			class qrfTransport {};				//[position, bool isFriendly] spawn FWK_fnc_qrfTransport;
			class roadblock {};					//[pos] spawn FWK_fnc_roadblock;
			class surrenderUnits {};			//[position, distanceRange, side] spawn FWK_fnc_surrenderUnits;
			class unitKamikaze {};				//[unit] spawn FWK_fnc_unitKamikaze;

			//Ambient
			class ambientMapCleanup {};			//[position, range] spawn FWK_fnc_ambientMapCleanup;
			class ambientMortarFire {};			//[position, shellType] spawn FWK_fnc_ambientMortarFire; (1=82mm/2=155mm/3=230mm)
			class ambientRaiseAlarm {};			//[object, int totalNumbersOfAlarmSound] spawn FWK_fnc_ambientRaiseAlarm;
			class ambientRandomWeather {};		//[] spawn FWK_fnc_ambientRandomWeather;
			class ambientSetDateTime {};		//[int] spawn FWK_fnc_ambientSetDateTime;
			class ambientSounds {};				//[] spawn FWK_fnc_ambientSounds;

			//Supports
			class supportsAllowCustom {};		//[] spawn FWK_fnc_supportsAllowCustom;
			class supportsVehicleDrop {};		//[position, isFriendlyVehicle] spawn FWK_fnc_supportsVehicleDrop;
			class supportsAmmoCache {};			//[_this] spawn FWK_fnc_supportsAmmoCache; (if used in support module)

			//Virtual
			class virtualArsenal {};			//[object] spawn FWK_fnc_virtualArsenal;
			class virtualGarage {};				//[markerName] spawn FWK_fnc_virtualGarage;
		};
	};
};
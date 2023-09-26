/* Sets random weather and forecasts based on "real" world positioning. It supports add-ons maps.
 * Ombra 12/06/2020
 * latest update 18/02/2022
*/

CONST_MAX_RAIN_LEVEL = 0.6; //To avoid fps issues
CONST_MAX_FOG_LEVEL = 0.6; //To prevent annoying fog
_currentMap = worldName;
_probability = random[0,0.5,1];

//Declaring variables
_currentOvercastCoef = 0;
_forecastOvercastCoef = 0;
_currentRainCoef = 0;
_forecastRainCoef = 0;
_currentFogCoef = 0;
_forecastFogCoef = 0;
_windSpeedN = 0;
_windSpeedE = 0;
_windDirection = 0;

switch (_currentMap) do
{   //Calculating weather for desert terrains
    case "MCN_Aliabad";
    case "takistan";
	case "zargabad";
	case "Mountains_ACR";
	case "fallujah";
	case "kunduz";
	case "Shapur_BAF":
	{
		//Probability of 30% for deserts to encounter overcast (and therefore rain)
		if (_probability > 0.7) then { _currentOvercastCoef = random[0,0.5,1]; } else { _currentOvercastCoef = random[0,0.2,0.5]; };
		_forecastOvercastCoef = random[0,0.5,1];
		//Current rain only if overcast > 0.6
		if (_currentOvercastCoef > 0.6) then { _currentRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL]; } else { _currentRainCoef = 0; };
		_forecastRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL];
		_currentFogCoef = 0;
		_forecastFogCoef = 0;
		//Some wind like sandstorms
		_windSpeedN = random[0,10,30];
		_windSpeedE = random[0,10,30];
		_windDirection = random[0, 180, 360];
	}; 
	//Calculating weather for european terrains (Vanilla and CUP)
	case "Bootcamp_ACR";
	case "Woodland_ACR";
	case "chernarus";
	case "chernarus_summer";
	case "Chernarus_Winter";
	case "ProvingGrounds_PMC";
	case "Enoch":
	{
		//Probability of 60% for northern EU to encounter overcast (and therefore rain)
		if (_probability > 0.4) then { _currentOvercastCoef = random[0,0.5,1]; } else { _currentOvercastCoef = random[0,0.2,0.5]; };
		_currentOvercastCoef = random[0,0.5,1];
		_forecastOvercastCoef = random[0,0.5,1];
		if (_currentOvercastCoef > 0.6) then { _currentRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL]; } else { _currentRainCoef = 0; };
		_forecastRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL];
		_currentFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		_forecastFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		//Not much wind in continental land
		_windSpeedN = random[0,10,20];
		_windSpeedE = random[0,10,20];
		_windDirection = random[0, 180, 360];
	}; 
	//Calculating weather for mediterranean terrains
	case "Stratis";
	case "Altis";
	case "Malden":
	{
		//Probability of 50% for northern EU to encounter overcast (and therefore rain)
		if (_probability > 0.5) then { _currentOvercastCoef = random[0,0.5,1]; } else { _currentOvercastCoef = random[0,0.2,0.5]; };
		_currentOvercastCoef = random[0,0.5,1];
		_forecastOvercastCoef = random[0,0.5,1];
		if (_currentOvercastCoef > 0.6) then { _currentRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL]; } else { _currentRainCoef = 0; };
		_forecastRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL];
		_currentFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		_forecastFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		//Islands are windy
		_windSpeedN = random[0,20,40];
		_windSpeedE = random[0,20,40];
		_windDirection = random[0, 180, 360];
	};
	//Calculating weather for tropical terrains
	case "Tanoa":
	{
		//Probability of 80% for jungle areas to encounter overcast (and therefore rain)
		if (_probability > 0.2) then { _currentOvercastCoef = random[0,0.5,1]; } else { _currentOvercastCoef = random[0,0.2,0.5]; };
		_currentOvercastCoef = random[0,0.5,1];
		_forecastOvercastCoef = random[0,0.5,1];
		if (_currentOvercastCoef > 0.5) then { _currentRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL]; } else { _currentRainCoef = 0; };
		_forecastRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL];
		_currentFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		_forecastFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		//Islands are windy
		_windSpeedN = random[0,20,40];
		_windSpeedE = random[0,20,40];
		_windDirection = random[0, 180, 360];
	};
	default
	{
		//Probability of 50% as default
		if (_probability > 0.5) then { _currentOvercastCoef = random[0,0.5,1]; } else { _currentOvercastCoef = random[0,0.2,0.5]; };
		_currentOvercastCoef = random[0,0.5,1];
		_forecastOvercastCoef = random[0,0.5,1];
		if (_currentOvercastCoef > 0.5) then { _currentRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL]; } else { _currentRainCoef = 0; };
		_forecastRainCoef = random[0, CONST_MAX_RAIN_LEVEL/2, CONST_MAX_RAIN_LEVEL];
		_currentFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		_forecastFogCoef = random[0, CONST_MAX_FOG_LEVEL/2, CONST_MAX_FOG_LEVEL];
		_windSpeedN = random[0,10,20];
		_windSpeedE = random[0,10,20];
		_windDirection = random[0, 180, 360];
	};
};

//Setting weather
0 setOvercast _currentOvercastCoef;
0 setRain _currentRainCoef;
0 setFog _currentFogCoef;
setWind [_windSpeedN, _windSpeedE, false];
0 setWindDir _windDirection;
forceWeatherChange;
//Setting forecast
3600 setOvercast _forecastOvercastCoef;
3600 setRain _forecastRainCoef;
3600 setFog _forecastFogCoef;

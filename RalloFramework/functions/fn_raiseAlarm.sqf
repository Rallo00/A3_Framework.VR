/* Raise alarm sound on given object for _reps times */
params["_alarmSpeaker", "_reps"];
_counter = 0;
while { _counter < _reps } do
{
	_alarmSpeaker say3D "alarm";
	sleep 5;
	_counter = _counter + 1;
};

	//QualificationsCode
	// AT Training
	//---------- OLD CODE ------------
	/*
	_trainingAPC = [getPos apcSpawn,70,"I_APC_tracked_03_cannon_F",west] call BIS_fnc_spawnVehicle;
	sleep 5;
	_trainingAPC select 2 addWaypoint [position apcMove,0];
	sleep 30;
	tempAPC = _trainingAPC select 0;
	tempCrew = _trainingHeli select 1;
	{deleteVehicle _x} forEach tempCrew;
	deleteVehicle tempAPC;
	*/


	//QualificationsCode
	// AT Training
	vehicleArray = ['rhs_btr60_msv','rhs_bmp2k_msv','rhs_t72ba_tv'];

	startPos = trigger_vehicle_start call BIS_fnc_randomPosTrigger;
	trainingVic = [startPos,random 360, selectRandom vehicleArrayAT, east] call BIS_fnc_spawnVehicle;
	trainingVic select 2 setBehaviour "CARELESS";
	endPos = trigger_vehicle_end call BIS_fnc_randomPosTrigger;
	trainingVicGrp = trainingVic select 2;
	wp = trainingVicGrp addWaypoint [endPos,-1,-1,"wayPointDelete"];
	wp setWaypointStatements ["true",  "_vic = vehicle this; deleteVehicleCrew _vic; deleteVehicle _vic;"];
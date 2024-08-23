	//QualificationsCode
	// AA Training
	vehicleArray = ['RHS_Mi24V_vdv','rhs_ka60_c','RHS_Mi8T_vvs'];

	startPos = trigger_helicopter_start call BIS_fnc_randomPosTrigger;
	trainingHeli = [startPos,random 360, selectRandom vehicleArrayAA, east] call BIS_fnc_spawnVehicle;
	trainingHeli select 2 setBehaviour "CARELESS";
	endPos = trigger_helicopter_end call BIS_fnc_randomPosTrigger;
	trainingHeliGrp = trainingHeli select 2;
	wp = trainingHeliGrp addWaypoint [endPos,-1,-1,"wayPointDelete"];
	wp setWaypointStatements ["true",  "_vic = vehicle this; deleteVehicleCrew _vic; deleteVehicle _vic;"];
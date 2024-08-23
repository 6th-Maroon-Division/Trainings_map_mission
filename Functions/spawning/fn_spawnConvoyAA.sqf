tempgroup = [getMarkerPos "convoyStart1",east,selectRandom grouptypesConvoy,[[0,0,0],[10,0,0],[20,0,0],[30,0,0],[40,0,0]]] call BIS_fnc_spawnGroup;
	tempgroup setFormation "COLUMN";
	wp = tempgroup addWaypoint [getMarkerPos "convoyEnd1",500];
	wp setWaypointType "MOVE";
	wp setWaypointStatements ["true","{deleteVehicle _x} forEach ([group this,true] call BIS_fnc_groupVehicles);{deleteVehicle _x} forEach thisList;hint 'Convoy reached its destination and despawned!'"];

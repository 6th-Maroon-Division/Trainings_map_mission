tempgroup = [getmarkerPos selectRandom spawnMarkersStatic, east, selectRandom grouptypesStatic] call BIS_fnc_spawngroup;
    wp = tempgroup addWaypoint [position leader tempgroup, 50];
    wp setwaypointType "HOLD";
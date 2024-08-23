// spawn group(s)
spawnMarkersStatic = ["pilotspawn_1", "pilotspawn_2", "pilotspawn_3", "pilotspawn_4", "pilotspawn_5", "pilotspawn_6", "pilotspawn_7", "pilotspawn_8"];
grouptypesStatic = [
    [
        "rhs_vdv_flora_sergeant",
        "rhs_vdv_flora_junior_sergeant",
        "rhs_vdv_flora_grenadier",
        "rhs_vdv_flora_rifleman",
        "rhs_vdv_flora_machinegunner",
        "rhs_vdv_flora_at",
        "rhs_vdv_flora_strelok_rpg_assist",
        "rhs_vdv_flora_medic"
    ], [
        "rhs_vdv_junior_sergeant",
        "rhs_vdv_efreitor",
        "rhs_vdv_machinegunner",
        "rhs_bmp1p_vdv",
        "rhs_vdv_machinegunner_assistant",
        "rhs_vdv_LAT",
        "rhs_vdv_rifleman"
    ], [
        "rhs_vdv_sergeant",
        "rhs_vdv_junior_sergeant",
        "rhs_vdv_grenadier",
        "rhs_gaz66_vdv",
        "rhs_vdv_machinegunner",
        "rhs_vdv_at",
        "rhs_vdv_strelok_rpg_assist",
        "rhs_vdv_rifleman"
    ]
];
grouptypesConvoy = [["rhs_btr80a_msv",
    				"rhs_kamaz5350_flatbed_cover_msv",
    				"rhs_kamaz5350_msv",
    				"rhs_gaz66_r142_msv"],
					["rhs_bmp3m_msv", 
					"RHS_BM21_MSV_01",
					"RHS_BM21_MSV_01",
					"RHS_BM21_MSV_01",
					"rhs_bmp2d_msv", 
					"rhs_bmp1_msv"], 
					["rhs_t72be_tv",
					"rhs_t72be_tv",
					"rhs_t72be_tv", 
					"rhs_tigr_m_msv"]];

grouptypesConvoyAA = [["rhs_zsu234_aa", 
"rhs_gaz66_ammo_msv", 
"rhs_gaz66_flat_msv", 
"rhs_gaz66o_msv", 
"rhs_gaz66o_flat_msv"],
["rhs_zsu234_aa", 
"rhs_zsu234_aa", 
"rhs_sprut_vdv", 
"rhs_t90sab_tv", 
"rhs_t90_tv", 
"rhs_t14_tv"]];

fnc_spawnStaticgroup =
{
    tempgroup = [getmarkerPos selectRandom spawnMarkersStatic, east, selectRandom grouptypesStatic] call BIS_fnc_spawngroup;
    wp = tempgroup addWaypoint [position leader tempgroup, 50];
    wp setwaypointType "HOLD";
};

fnc_spawnConvoy =
{
	tempgroup = [getMarkerPos "convoyStart1",east,selectRandom grouptypesConvoy,[[0,0,0],[10,0,0],[20,0,0],[30,0,0],[40,0,0]]] call BIS_fnc_spawnGroup;
	tempgroup setFormation "COLUMN";
	wp = tempgroup addWaypoint [getMarkerPos "convoyStart1",500];
	wp setWaypointStatements ["true","{deleteVehicle _x} forEach assignedVehicles group this;"];
};

fnc_spawnConvoyAA = 
{
	tempgroup = [getMarkerPos "convoyStart1",east,selectRandom grouptypesConvoy,[[0,0,0],[10,0,0],[20,0,0],[30,0,0],[40,0,0]]] call BIS_fnc_spawnGroup;
	tempgroup setFormation "COLUMN";
	wp = tempgroup addWaypoint [getMarkerPos "convoyStart1",500];
	wp setWaypointType "MOVE";
	wp setWaypointStatements ["true",  "{ deleteVehicle _x} forEach thisList"];
};

// { deleteVehicle _x} forEach thisList;

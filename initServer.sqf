// Process files
//call compileFinal preprocessFile "qualificationpilot.sqf";



// init Formations Screen

screen_formations addAction ["Clear","screen_formations setObjectTexture [0,'']"];
screen_formations addAction ["360","screen_formations setObjectTexture [0,'images\360LoF.jpg']"];
screen_formations addAction ["ColumnFTL","screen_formations setObjectTexture [0,'images\ColumnFTLoF.jpg']"];
screen_formations addAction ["ColumnSL","screen_formations setObjectTexture [0,'images\ColumnLoF.jpg']"];
screen_formations addAction ["DiamondFTL","screen_formations setObjectTexture [0,'images\DiamondFTLoF.jpg']"];
screen_formations addAction ["Echelon","screen_formations setObjectTexture [0,'images\EchelonFTLoF.jpg']"];
screen_formations addAction ["FiringlineFTL","screen_formations setObjectTexture [0,'images\FiringLineFTLoF.jpg']"];
screen_formations addAction ["Firingline","screen_formations setObjectTexture [0,'images\FiringLineLoF.jpg']"];
screen_formations addAction ["StaggeredColumnFTL","screen_formations setObjectTexture [0,'images\StagColumnFTLoF.jpg']"];
screen_formations addAction ["StagColumn","screen_formations setObjectTexture [0,'images\StagColumnLoF.jpg']"];
screen_formations addAction ["WedgeFTL","screen_formations setObjectTexture [0,'images\WedgeFTLoF.jpg']"];
screen_formations addAction ["Wedge","screen_formations setObjectTexture [0,'images\WedgeLoF.jpg']"];



// init Teleport flags

// NEW
spawnTeleportPole addAction ["Launcher Training", {
    _this select 1 setPos getmarkerPos "launcherTeleport"
}];
spawnTeleportPole addAction ["Support Arms, Artillery, Sniper Training", {
    _this select 1 setPos getmarkerPos "sniperTeleport"
}];
spawnTeleportPole addAction ["Engineer Training", {
    _this select 1 setPos getmarkerPos "engineerTeleport"
}];
spawnTeleportPole addAction ["crew Training", {
    _this select 1 setPos getmarkerPos "crewTeleport"
}];
spawnTeleportPole addAction ["pilot Training", {
    _this select 1 setPos getmarkerPos "pilotTeleport"
}];

/*
formationTeleport addAction ["Base", {
    _this select 1 setPos(getPos spawnTeleport)
}];
rangeTeleport addAction ["Base", {
    _this select 1 setPos(getPos spawnTeleport)
}];
cqbTeleport addAction ["Base", {
    _this select 1 setPos(getPos spawnTeleport)
}];
qualificationTeleport addAction ["Base", {
    _this select 1 setPos(getPos spawnTeleport)
}];
*/
// NEW
sniperTeleportPole addAction ["Base", {
    _this select 1 setPos getmarkerPos "spawnTeleport"
}];
launcherTeleportPole addAction ["Base", {
    _this select 1 setPos getmarkerPos "spawnTeleport"
}];
engineerTeleportPole addAction ["Base", {
    _this select 1 setPos getmarkerPos "spawnTeleport"
}];
pilotTeleportPole addAction ["Base", {
    _this select 1 setPos getmarkerPos "spawnTeleport"
}];
crewTeleportPole addAction ["Base", {
    _this select 1 setPos getmarkerPos "spawnTeleport"
}];

// init AA, AT Training setup
launcher_training addAction ["Heal", {
    _this select 1 setDamage 0
}];
launcher_training addAction ["AA", {
	call Checkers_fnc_qualificationAA;
}];
launcher_training addAction ["AT", {
    call Checkers_fnc_qualificationAT;
}];
launcher_training addAction ["Clear Garbage", {
    {
        deletevehicle _x
    } forEach allDead
}];

// init pilot Training setup
pilot_training addAction ["Heal", {
    _this select 1 setDamage 0
}];
pilot_training addAction ["Static groups", {
    call Checkers_fnc_spawnStaticGroup;
}];
pilot_training addAction ["Convoy", {
    call Checkers_fnc_spawnConvoy;
}];
pilot_training addAction ["Convoy with AA", {
    call Checkers_fnc_spawnConvoyAA;
}];
pilot_training addAction ["Clear Garbage", {
    {
        deletevehicle _x
    } forEach allDead
}];

// Variables
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
    "rhs_kamaz5350_flatbed_cover_msv",
    "rhs_kamaz5350_msv",
"rhs_gaz66_r142_msv"],
["rhs_bmp3m_msv",
    "RHS_BM21_MSV_01",
    "RHS_BM21_MSV_01",
    "RHS_BM21_MSV_01",
    "rhs_bmp2d_msv"],

["rhs_t72be_tv",
    "rhs_t72be_tv",
    "rhs_t72be_tv",
    "rhs_t72be_tv",
"rhs_tigr_m_msv"]];

grouptypesConvoyAA = [["rhs_zsu234_aa",
    "rhs_gaz66_ammo_msv",
    "rhs_gaz66_flat_msv",
    "rhs_gaz66o_msv",
"rhs_gaz66o_flat_msv"],
["rhs_zsu234_aa",
    "rhs_sprut_vdv",
    "rhs_t90sab_tv",
    "rhs_t90_tv",
"rhs_t14_tv"]];

// qualification AT
	vehicleArrayAT = ['rhs_btr60_msv','rhs_bmp2k_msv','rhs_t72ba_tv'];
// qualification AA
	vehicleArrayAA = ['RHS_Mi24V_vdv','rhs_ka60_c','RHS_Mi8T_vvs'];

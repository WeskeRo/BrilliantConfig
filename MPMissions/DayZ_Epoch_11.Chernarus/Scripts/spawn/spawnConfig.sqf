/*  

Spawn Configuration:

1. These spawns are just examples to show what this mod can do. You can add or delete
any spawn in the _spawnPoints list. Don't forget to leave off the last comma for the last
element in the array.

2. Spawn format: 
	[Name, Pos, VIP Level, Humanity Level]
	Name - Each spawn must have a unique name. Can be anything. Do not use double quotes " inside.
	Pos - Coordinates in AboveTerrainLevel Format [x,y,z]
	VIP Level -
		0 - Anyone can pick this spawn
		1 - Only players with UIDs in _spawnLevel1 can pick this spawn
		2 - Only players with UIDs in _spawnLevel2 can pick this spawn
		3 - Only players with UIDs in _spawnLevel3 can pick this spawn​
	Humanity Level -
		0 - Anyone can pick this spawn
		Negative # - Only players with humanity less than this number can pick this spawn
		Positive # - Only players with humanity greater than this number can pick this spawn​

3. _customBase - List of UIDs that own custom bases.
   _customBases - List of custom bases in this format: ["Name",[Pos]]
   Name - Each base must have a unique name. Can be anything. Do not use double quotes " inside.
   Pos - In AboveTerrainLevel [x,y,z] format
   These must match the order of the first list. The first UID in _customBase corresponds with the first base in _customBases and so on. 
   These will only show in the spawn list for the player who owns them. If multiple UIDs share the same base then add the same base multiple times to maintain order, 
   or consider making it a VIP spawn in _spawnPoints instead. Pos is exactly where you will spawn, does not run through findSafePos. These override body check.

*/

_bodyCheck = 4000; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 12000; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = false; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.
_customBase = [
	"76561198014219874", // ebay
	"0",
	"0"
];
_customBases = [ // Do not use a z (height) higher than _autoOpenHeight in haloConfig.sqf if using halo
	["ebay's base",[2324,15365,0]],
	[],
	[]
];

_spawnLevel1 = ["0","0","0"];
_spawnLevel2 = ["0","0","0"];
_spawnLevel3 = ["0","0","0"];
// To give higher level VIPs access to lower level VIP spawns uncomment the two lines below:
// _spawnLevel1 = _spawnLevel1 + _spawnLevel2 + _spawnLevel3;
// _spawnLevel2 = _spawnLevel2 + _spawnLevel3;

_spawnPoints = switch (toLower worldName) do {
	case "chernarus":{
		[
			["Random",[[4523,2444,0],[12037,9100,0],[6723,2562,0],[10417,2120,0],[1896,2242,0],[13470,6306,0]],0,0,1], // Random will never be blocked, so always keep it if using body check.
			["Balota",[4523,2444,0],0,0],
			["Berezino",[12037,9100,0],0,0],
			["Cherno",[6723,2562,0],0,0],
			["Elektro",[10417,2120,0],0,0],
			["Kamenka",[1896,2242,0],0,0],
			["Solnichny",[13470,6306,0],0,0],
			// Above are defaults
			["Devils",[6900,11419,0],0,0],
			["Gorka",[9659,8839,0],0,0],
			["Grishino",[5967,10323,0],0,0],
			["Guglovo",[8472,6754,0],0,0],
			["Gvozdno",[8654,11832,0],0,0],
			["Kabanino",[5346,8630,0],0,0],
			["Kamyshovo",[12073,3490,0],0,0],
			["Komarovo",[3643,2473,0],0,0],
			["Krasnostav",[11342,12232,0],0,0],
			["Krutoy",[13395,4159,0],0,0],
			["Lopatino",[2731,10000,0],0,0],
			["Petrovka",[5035,12459,0],0,0],
			["Pogorevka",[4461,6424,0],0,0],
			["Prigor",[8059,3381,0],0,0],
			["Pusta",[9178,3928,0],0,0],
			["Vybor",[3893,8883,0],0,0],
			["Vyshnoye",[6612,6065,0],0,0],
			["Zelenogorsk",[2858,5313,0],0,0],
			["Bandit Base",[1607,7804,0],0,-2000],
			["Hero Hideout",[12944,12767,0],0,5000]
		]
	};
};
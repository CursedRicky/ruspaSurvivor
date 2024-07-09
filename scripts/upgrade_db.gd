extends Node

const STATS_PATH = "res://art/UI/StatsIcons/"
const WEAPON_PATH = "res://art/UI/SpellIcons/"
const UPGRADES = {
	"healt1" : {
		"icon" : STATS_PATH + "healt.png",
		"displayname" : "Vita",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"healt2" : {
		"icon" : STATS_PATH + "healt.png",
		"displayname" : "Vita",
		"lvl" : 2,
		"prerequisite" : ["healt1"],
		"type" : "stats"
	},
	"healt3" : {
		"icon" : STATS_PATH + "healt.png",
		"displayname" : "Vita",
		"lvl" : 3,
		"prerequisite" : ["healt2"],
		"type" : "stats"
	},
	"healt4" : {
		"icon" : STATS_PATH + "healt.png",
		"displayname" : "Vita",
		"lvl" : 4,
		"prerequisite" : ["healt3"],
		"type" : "stats"
	},
	"healt5" : {
		"icon" : STATS_PATH + "healt.png",
		"displayname" : "Vita",
		"lvl" : 5,
		"prerequisite" : ["healt4"],
		"type" : "stats"
	},
	"healt6" : {
		"icon" : STATS_PATH + "healt.png",
		"displayname" : "Vita",
		"lvl" : 6,
		"prerequisite" : ["healt5"],
		"type" : "stats"
	},
	"ms1" : {
		"icon" : STATS_PATH + "ms.png",
		"displayname" : "Velocita'",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"ms2" : {
		"icon" : STATS_PATH + "ms.png",
		"displayname" : "Velocita'",
		"lvl" : 2,
		"prerequisite" : ["ms1"],
		"type" : "stats"
	},
	"ms3" : {
		"icon" : STATS_PATH + "ms.png",
		"displayname" : "Velocita'",
		"lvl" : 3,
		"prerequisite" : ["ms2"],
		"type" : "stats"
	},
	"ms4" : {
		"icon" : STATS_PATH + "ms.png",
		"displayname" : "Velocita'",
		"lvl" : 4,
		"prerequisite" : ["ms3"],
		"type" : "stats"
	},
	"ms5" : {
		"icon" : STATS_PATH + "ms.png",
		"displayname" : "Velocita'",
		"lvl" : 5,
		"prerequisite" : ["ms4"],
		"type" : "stats"
	},
	"ms6" : {
		"icon" : STATS_PATH + "ms.png",
		"displayname" : "Velocita'",
		"lvl" : 6,
		"prerequisite" : ["ms5"],
		"type" : "stats"
	},
	"armor1" : {
		"icon" : STATS_PATH + "armor.png",
		"displayname" : "Armatura",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"armor2" : {
		"icon" : STATS_PATH + "armor.png",
		"displayname" : "Armatura",
		"lvl" : 2,
		"prerequisite" : ["armor1"],
		"type" : "stats"
	},
	"armor3" : {
		"icon" : STATS_PATH + "armor.png",
		"displayname" : "Armatura",
		"lvl" : 3,
		"prerequisite" : ["armor2"],
		"type" : "stats"
	},
	"armor4" : {
		"icon" : STATS_PATH + "armor.png",
		"displayname" : "Armatura",
		"lvl" : 4,
		"prerequisite" : ["armor3"],
		"type" : "stats"
	},
	"armor5" : {
		"icon" : STATS_PATH + "armor.png",
		"displayname" : "Armatura",
		"lvl" : 5,
		"prerequisite" : ["armor4"],
		"type" : "stats"
	},
	"armor6" : {
		"icon" : STATS_PATH + "armor.png",
		"displayname" : "Armatura",
		"lvl" : 6,
		"prerequisite" : ["armor5"],
		"type" : "stats"
	},
	"damage1" : {
		"icon" : STATS_PATH + "damage.png",
		"displayname" : "Danno",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"damage2" : {
		"icon" : STATS_PATH + "damage.png",
		"displayname" : "Danno",
		"lvl" : 2,
		"prerequisite" : ["damage1"],
		"type" : "stats"
	},
	"damage3" : {
		"icon" : STATS_PATH + "damage.png",
		"displayname" : "Danno",
		"lvl" : 3,
		"prerequisite" : ["damage2"],
		"type" : "stats"
	},
	"damage4" : {
		"icon" : STATS_PATH + "damage.png",
		"displayname" : "Danno",
		"lvl" : 4,
		"prerequisite" : ["damage3"],
		"type" : "stats"
	},
	"damage5" : {
		"icon" : STATS_PATH + "damage.png",
		"displayname" : "Danno",
		"lvl" : 5,
		"prerequisite" : ["damage4"],
		"type" : "stats"
	},
	"damage6" : {
		"icon" : STATS_PATH + "damage.png",
		"displayname" : "Danno",
		"lvl" : 6,
		"prerequisite" : ["damage5"],
		"type" : "stats"
	},
	"projectile1" : {
		"icon" : STATS_PATH + "projectile.png",
		"displayname" : "N. Colpi",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"projectile2" : {
		"icon" : STATS_PATH + "projectile.png",
		"displayname" : "N. Colpi",
		"lvl" : 2,
		"prerequisite" : ["projectile1"],
		"type" : "stats"
	},
	"projectile3" : {
		"icon" : STATS_PATH + "projectile.png",
		"displayname" : "N. Colpi",
		"lvl" : 3,
		"prerequisite" : ["projectile2"],
		"type" : "stats"
	},
	"projectile4" : {
		"icon" : STATS_PATH + "projectile.png",
		"displayname" : "N. Colpi",
		"lvl" : 4,
		"prerequisite" : ["projectile3"],
		"type" : "stats"
	},
	"projectile5" : {
		"icon" : STATS_PATH + "projectile.png",
		"displayname" : "N. Colpi",
		"lvl" : 5,
		"prerequisite" : ["projectile4"],
		"type" : "stats"
	},
	"projectile6" : {
		"icon" : STATS_PATH + "projectile.png",
		"displayname" : "N. Colpi",
		"lvl" : 6,
		"prerequisite" : ["projectile5"],
		"type" : "stats"
	},
	"ah1" : {
		"icon" : STATS_PATH + "ah.png",
		"displayname" : "V. Abilita'",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"ah2" : {
		"icon" : STATS_PATH + "ah.png",
		"displayname" : "V. Abilita'",
		"lvl" : 2,
		"prerequisite" : ["ah1"],
		"type" : "stats"
	},
	"ah3" : {
		"icon" : STATS_PATH + "ah.png",
		"displayname" : "V. Abilita'",
		"lvl" : 3,
		"prerequisite" : ["ah2"],
		"type" : "stats"
	},
	"ah4" : {
		"icon" : STATS_PATH + "ah.png",
		"displayname" : "V. Abilita'",
		"lvl" : 4,
		"prerequisite" : ["ah3"],
		"type" : "stats"
	},
	"ah5" : {
		"icon" : STATS_PATH + "ah.png",
		"displayname" : "V. Abilita'",
		"lvl" : 5,
		"prerequisite" : ["ah4"],
		"type" : "stats"
	},
	"ah6" : {
		"icon" : STATS_PATH + "ah.png",
		"displayname" : "V. Abilita'",
		"lvl" : 6,
		"prerequisite" : ["ah5"],
		"type" : "stats"
	},
	"regen1" : {
		"icon" : STATS_PATH + "regen.png",
		"displayname" : "Rig. Vita",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"regen2" : {
		"icon" : STATS_PATH + "regen.png",
		"displayname" : "Rig. Vita",
		"lvl" : 2,
		"prerequisite" : ["regen1"],
		"type" : "stats"
	},
	"regen3" : {
		"icon" : STATS_PATH + "regen.png",
		"displayname" : "Rig. Vita",
		"lvl" : 3,
		"prerequisite" : ["regen2"],
		"type" : "stats"
	},
	"regen4" : {
		"icon" : STATS_PATH + "regen.png",
		"displayname" : "Rig. Vita",
		"lvl" : 4,
		"prerequisite" : ["regen3"],
		"type" : "stats"
	},
	"regen5" : {
		"icon" : STATS_PATH + "regen.png",
		"displayname" : "Rig. Vita",
		"lvl" : 5,
		"prerequisite" : ["regen4"],
		"type" : "stats"
	},
	"regen6" : {
		"icon" : STATS_PATH + "regen.png",
		"displayname" : "Rig. Vita",
		"lvl" : 6,
		"prerequisite" : ["regen5"],
		"type" : "stats"
	},
	"pick1" : {
		"icon" : STATS_PATH + "pick.png",
		"displayname" : "R. Presa",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"pick2" : {
		"icon" : STATS_PATH + "pick.png",
		"displayname" : "R. Presa",
		"lvl" : 2,
		"prerequisite" : ["pick1"],
		"type" : "stats"
	},
	"pick3" : {
		"icon" : STATS_PATH + "pick.png",
		"displayname" : "R. Presa",
		"lvl" : 3,
		"prerequisite" : ["pick2"],
		"type" : "stats"
	},
	"pick4" : {
		"icon" : STATS_PATH + "pick.png",
		"displayname" : "R. Presa",
		"lvl" : 4,
		"prerequisite" : ["pick3"],
		"type" : "stats"
	},
	"pick5" : {
		"icon" : STATS_PATH + "pick.png",
		"displayname" : "R. Presa",
		"lvl" : 5,
		"prerequisite" : ["pick4"],
		"type" : "stats"
	},
	"pick6" : {
		"icon" : STATS_PATH + "pick.png",
		"displayname" : "R. Presa",
		"lvl" : 6,
		"prerequisite" : ["pick5"],
		"type" : "stats"
	},
	"expB1" : {
		"icon" : STATS_PATH + "expB.png",
		"displayname" : "Exp. Boost",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"expB2" : {
		"icon" : STATS_PATH + "expB.png",
		"displayname" : "Exp. Boost",
		"lvl" : 2,
		"prerequisite" : ["expB1"],
		"type" : "stats"
	},
	"expB3" : {
		"icon" : STATS_PATH + "expB.png",
		"displayname" : "Exp. Boost",
		"lvl" : 3,
		"prerequisite" : ["expB2"],
		"type" : "stats"
	},
	"expB4" : {
		"icon" : STATS_PATH + "expB.png",
		"displayname" : "Exp. Boost",
		"lvl" : 4,
		"prerequisite" : ["expB3"],
		"type" : "stats"
	},
	"expB5" : {
		"icon" : STATS_PATH + "expB.png",
		"displayname" : "Exp. Boost",
		"lvl" : 5,
		"prerequisite" : ["expB4"],
		"type" : "stats"
	},
	"expB6" : {
		"icon" : STATS_PATH + "expB.png",
		"displayname" : "Exp. Boost",
		"lvl" : 6,
		"prerequisite" : ["expB5"],
		"type" : "stats"
	},
	"spell11" : {
		"icon" : STATS_PATH + "spell.png",
		"displayname" : "Scarica",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"spell12" : {
		"icon" : STATS_PATH + "spell.png",
		"displayname" : "Scarica",
		"lvl" : 2,
		"prerequisite" : ["spell11"],
		"type" : "stats"
	},
	"spell13" : {
		"icon" : STATS_PATH + "spell.png",
		"displayname" : "Scarica",
		"lvl" : 3,
		"prerequisite" : ["spell12"],
		"type" : "stats"
	},
	"spell14" : {
		"icon" : STATS_PATH + "spell.png",
		"displayname" : "Scarica",
		"lvl" : 4,
		"prerequisite" : ["spell13"],
		"type" : "stats"
	},
	"spell15" : {
		"icon" : STATS_PATH + "spell.png",
		"displayname" : "Scarica",
		"lvl" : 5,
		"prerequisite" : ["spell14"],
		"type" : "stats"
	},
	"spell16" : {
		"icon" : STATS_PATH + "spell.png",
		"displayname" : "Scarica",
		"lvl" : 6,
		"prerequisite" : ["spell15"],
		"type" : "stats"
	},
	"magnet" : {
		"icon" : STATS_PATH + "magnet.png",
		"displayname" : "Magnete",
		"lvl" : 0,
		"prerequisite" : [],
		"type" : "stats"
	},
	"cone1" : {
		"icon" : STATS_PATH + "cone.png",
		"displayname" : "Coni",
		"lvl" : 1,
		"prerequisite" : [],
		"type" : "stats"
	},
	"cone2" : {
		"icon" : STATS_PATH + "cone.png",
		"displayname" : "Coni",
		"lvl" : 2,
		"prerequisite" : ["cone1"],
		"type" : "stats"
	},
	"cone3" : {
		"icon" : STATS_PATH + "cone.png",
		"displayname" : "Coni",
		"lvl" : 3,
		"prerequisite" : ["cone2"],
		"type" : "stats"
	},
	"cone4" : {
		"icon" : STATS_PATH + "cone.png",
		"displayname" : "Coni",
		"lvl" : 4,
		"prerequisite" : ["cone3"],
		"type" : "stats"
	},
	"cone5" : {
		"icon" : STATS_PATH + "cone.png",
		"displayname" : "Coni",
		"lvl" : 5,
		"prerequisite" : ["cone4"],
		"type" : "stats"
	},
	"food" : {
		"icon" : STATS_PATH + "heal.png",
		"displayname" : "Cura",
		"lvl" : 0,
		"prerequisite" : [],
		"type" : "heal"
	}
}

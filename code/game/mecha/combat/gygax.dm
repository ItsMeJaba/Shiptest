/obj/mecha/combat/gygax
	desc = "Легкий защитный экзоскелет. Популярен среди частных и корпоративных служб безопасности."
	name = "\improper Gygax"
	icon_state = "gygax"
	step_in = 3
	dir_in = 1 //Facing North.
	max_integrity = 250
	deflect_chance = 5
	armor = list("melee" = 25, "bullet" = 20, "laser" = 30, "energy" = 15, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	max_temperature = 25000
	leg_overload_coeff = 80
	infra_luminosity = 6
	force = 25
	wreckage = /obj/structure/mecha_wreckage/gygax
	internal_damage_threshold = 35
	max_equip = 3
	step_energy_drain = 3

/obj/mecha/combat/gygax/mechturn(direction)
	. = ..()
	if(!strafe && !occupant.client.keys_held["Alt"])
		mechstep(direction) //agile mechs get to move and turn in the same step

/obj/mecha/combat/gygax/dark
	desc = "Легкий экзоскелет, перекрашенный в темный цвет. Похоже, что у этой модели есть некоторые модификации."
	name = "\improper Dark Gygax"
	icon_state = "darkgygax"
	max_integrity = 300
	deflect_chance = 20
	armor = list("melee" = 40, "bullet" = 40, "laser" = 50, "energy" = 35, "bomb" = 20, "bio" = 0, "rad" =20, "fire" = 100, "acid" = 100)
	max_temperature = 35000
	leg_overload_coeff = 70
	force = 30
	operation_req_access = list(ACCESS_SYNDICATE)
	internals_req_access = list(ACCESS_SYNDICATE)
	wreckage = /obj/structure/mecha_wreckage/gygax/dark
	max_equip = 5
	destruction_sleep_duration = 20

/obj/mecha/combat/gygax/dark/loaded/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/thrusters/ion(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	ME.attach(src)
	max_ammo()

/obj/mecha/combat/gygax/dark/add_cell(obj/item/stock_parts/cell/C=null)
	if(C)
		C.forceMove(src)
		cell = C
		return
	cell = new /obj/item/stock_parts/cell/bluespace(src)


/obj/mecha/combat/gygax/GrantActions(mob/living/user, human_occupant = 0)
	..()
	overload_action.Grant(user, src)


/obj/mecha/combat/gygax/RemoveActions(mob/living/user, human_occupant = 0)
	..()
	overload_action.Remove(user)

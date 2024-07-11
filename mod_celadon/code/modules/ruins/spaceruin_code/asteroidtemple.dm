// False wall

/obj/machinery/button/door/false_wall
	name = "Skull button"
	desc = "Ancient mechanism, looks like button with shape of skull"
	icon = 'icons/obj/mining.dmi'
	icon_state = "skull"
	use_power = 0

/turf/closed/indestructible/riveted/boss/fake
	var/id = null
	canSmoothWith = list(
	/turf/closed/indestructible/riveted/boss,
	/turf/closed/indestructible/riveted/boss/fake)
	smooth = SMOOTH_TRUE

/turf/closed/indestructible/riveted/boss/fake/proc/open()
	density = 0
	opacity = 0
	icon = 'icons/turf/floors.dmi'
	icon_state = "clockwork_floor"

/turf/closed/indestructible/riveted/boss/fake/proc/close()
	density = 1
	opacity = 1
	icon = 'icons/turf/walls/boss_wall.dmi'
	icon_state = "wall"

/obj/machinery/button/door/false_wall/attack_hand(mob/user as mob)
	for(var/turf/closed/indestructible/riveted/boss/fake/W)
		if(W.id == id)
			playsound (src, 'sound/machines/clockcult/steam_whoosh.ogg')
			if(W.density)
				spawn(10)
					W.open()
					return
			else
				spawn(10)
					W.close()
					return

/client/proc/map_template_load()
	set category = "Debug"
	set name = "Map template - Place"

	var/turf/T = get_turf(mob)
	if(!T)
		return

	var/datum/map_template/template

	var/map = input(usr, "Choose a Map Template to place at your CURRENT LOCATION","Place Map Template") as null|anything in map_templates
	if(!map)
		return

	template = map_templates[map]
	template.load(T)
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] has placed a map template ([template.name]) at <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[T.x];Y=[T.y];Z=[T.z]'>(JMP)</a></span>")

/client/proc/map_template_upload()
	set category = "Debug"
	set name = "Map Template - Upload"

	var/map = input(usr, "Choose a Map Template to upload to template storage","Upload Map Template") as null|file
	if(!map)
		return
	if(copytext("[map]",-4) != ".dmm")
		usr << "Bad map file: [map]"
		return

	var/datum/map_template/M = new(map=map, rename="[map]")
	map_templates[M.name] = M
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] has uploaded a map template ([map])</span>")

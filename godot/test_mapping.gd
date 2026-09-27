extends SceneTree

var checks := 0
var failures := 0

func _initialize() -> void:
	call_deferred("run")

func check(ok: bool, label: String) -> void:
	checks += 1
	if not ok:
		failures += 1
	print("PASS " if ok else "FAIL ", label)

func run() -> void:
	print("CONNECTED DEVICES ", Input.get_connected_joypads())
	var scene: Node = load("res://joypads.tscn").instantiate()
	root.add_child(scene)
	await process_frame
	await process_frame
	if Input.get_joy_name(0).is_empty():
		check(scene.joypad_name.text.contains("No controller detected"), "absent device label")
		check(scene.get_node("JoypadDiagram").modulate.a == 0.5, "absent device diagram dimmed")
	var empty := JoyMapping.new()
	check(str(empty) == "" and empty.to_human_string() == "", "empty mapping")
	var button := JoyMapping.new(JoyMapping.Type.BTN, 3)
	check(str(button) == "b3" and button.to_human_string() == "Button 3", "button mapping")
	for item in [[JoyMapping.Axis.FULL, "a2", "Axis 2"], [JoyMapping.Axis.HALF_PLUS, "+a2", "Axis (+) 2"], [JoyMapping.Axis.HALF_MINUS, "-a2", "Axis (-) 2"]]:
		var axis := JoyMapping.new(JoyMapping.Type.AXIS, 2, item[0])
		check(str(axis) == item[1] and axis.to_human_string() == item[2], "axis mapping " + item[1])
		axis.inverted = true
		check(str(axis) == item[1] + "~" and axis.to_human_string() == item[2] + " (inverted)", "inverted mapping " + item[1])
	var wizard: Node = scene.get_node("RemapWizard")
	# Constructed metadata only: never apply/remove a device mapping or vibrate.
	wizard.joy_guid = "TEST_GUID"
	wizard.joy_name = "Fixture"
	var result: String = wizard.create_mapping_string({"a": button, "b": empty})
	check(result.begins_with("TEST_GUID,Fixture,a:b3,"), "mapping serialization")
	check(not result.contains("b:"), "empty mapping omitted")
	check(result.ends_with("platform:Mac OS X"), "macOS platform tag")
	scene.queue_free()
	await process_frame
	print("RESULT ", checks, " checks, ", failures, " failures; no hardware input or mapping applied")
	quit(1 if failures else 0)

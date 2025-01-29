extends FmodEventEmitter2D

enum secciones {A,B,C,D,E}
var seccionActual = secciones.A

func cambiarSeccion(seccion:String) -> void:
	match seccion:
		"A":
			seccionActual = secciones.A
		"B":
			seccionActual = secciones.B
		"C":
			seccionActual = secciones.C
		"D":
			seccionActual = secciones.D
		"E":
			seccionActual = secciones.E
	actualizarSeccion()

func actualizarSeccion() -> void:
	match seccionActual:
		secciones.A:
			self["fmod_parameters/secciones"] = "A"
		secciones.B:
			self["fmod_parameters/secciones"] = "B"
		secciones.C:
			self["fmod_parameters/secciones"] = "C"
		secciones.D:
			self["fmod_parameters/secciones"] = "D"
		secciones.E:
			self["fmod_parameters/secciones"] = "E"

func _on_juego_cambiar_seccion(seccion: String) -> void:
	cambiarSeccion(seccion)

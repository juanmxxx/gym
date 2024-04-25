import 'dart:convert';

class GymTfgDefaultRtdbExport {
  Map<String, Ejercicio> ejercicios;

  GymTfgDefaultRtdbExport({
    required this.ejercicios,
  });

  factory GymTfgDefaultRtdbExport.fromRawJson(String str) =>
      GymTfgDefaultRtdbExport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GymTfgDefaultRtdbExport.fromJson(Map<String, dynamic> json) =>
      GymTfgDefaultRtdbExport(
        ejercicios: Map.from(json["ejercicios"]).map(
            (k, v) => MapEntry<String, Ejercicio>(k, Ejercicio.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "ejercicios": Map.from(ejercicios)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Ejercicio {
  String? imagen;
  String nombre;
  String tipo;
  String descripcion;
  String gif_ayuda;

  Ejercicio({
    this.imagen,
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    required this.gif_ayuda,
  });

  factory Ejercicio.fromRawJson(String str) =>
      Ejercicio.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        imagen: json["imagen"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        gif_ayuda: json["gif_ayuda"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "nombre": nombre,
        "tipo": tipo,
        "descripcion": descripcion,
        "gif_ayuda": gif_ayuda,
      };

  Ejercicio copy() => Ejercicio(
        imagen: imagen,
        nombre: nombre,
        tipo: tipo,
        descripcion: descripcion,
        gif_ayuda: gif_ayuda,
      );
}

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
  bool polea;
  String tipo;

  Ejercicio({
    this.imagen,
    required this.nombre,
    required this.polea,
    required this.tipo,
  });

  factory Ejercicio.fromRawJson(String str) =>
      Ejercicio.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        imagen: json["imagen"],
        nombre: json["nombre"],
        polea: json["polea"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "nombre": nombre,
        "polea": polea,
        "tipo": tipo,
      };
}

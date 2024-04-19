import 'dart:convert';

class GymTfgDefaultRtdbExport {
  Map<String, EjercicioLocal> ejercicios;

  GymTfgDefaultRtdbExport({
    required this.ejercicios,
  });

  factory GymTfgDefaultRtdbExport.fromRawJson(String str) =>
      GymTfgDefaultRtdbExport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GymTfgDefaultRtdbExport.fromJson(Map<String, dynamic> json) =>
      GymTfgDefaultRtdbExport(
        ejercicios: Map.from(json["ejercicios"]).map((k, v) =>
            MapEntry<String, EjercicioLocal>(k, EjercicioLocal.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "ejercicios": Map.from(ejercicios)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class EjercicioLocal {
  String? imagen;
  String nombre;
  bool polea;
  String tipo;
  String? id;

  EjercicioLocal({
    this.imagen,
    required this.nombre,
    required this.polea,
    required this.tipo,
  });

  factory EjercicioLocal.fromRawJson(String str) =>
      EjercicioLocal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EjercicioLocal.fromJson(Map<String, dynamic> json) => EjercicioLocal(
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

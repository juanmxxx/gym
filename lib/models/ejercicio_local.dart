import 'package:floor/floor.dart';

@entity
class EjercicioLocal {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String nombre;
  final String descripcion;
  final String imagen;

  final int peso;
  final int repeticiones;
  final int series;
  final String dayOfWeek;
  final String gifAyuda;
  final String tipo;

  EjercicioLocal(
      {this.id,
      required this.nombre,
      required this.descripcion,
      required this.imagen,
      required this.peso,
      required this.repeticiones,
      required this.series,
      required this.dayOfWeek,
      required this.gifAyuda,
      required this.tipo});
}

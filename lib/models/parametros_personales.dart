import 'package:floor/floor.dart';

@entity
class ParametrosPersonales {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int peso;
  final int edad;
  final int altura;
  final int sexo;

  ParametrosPersonales(
      {this.id,
      required this.peso,
      required this.edad,
      required this.altura,
      required this.sexo});
}

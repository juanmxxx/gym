import 'package:floor/floor.dart';

@entity
class ParametrosPersonales {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String nombre;
  double peso;
  int edad;
  double altura;
  double sexo;
  int? idMedidasMusculares;

  ParametrosPersonales(
      {this.id,
      required this.nombre,
      required this.peso,
      required this.edad,
      required this.altura,
      required this.sexo,
      this.idMedidasMusculares});

  void setPeso(double peso) {
    this.peso = peso;
  }

  void setEdad(int edad) {
    this.edad = edad;
  }

  void setAltura(double altura) {
    this.altura = altura;
  }

  void setSexo(double sexo) {
    this.sexo = sexo;
  }

  void setName(String nombre) {
    this.nombre = nombre;
  }
}

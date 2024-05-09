import 'package:floor/floor.dart';

@entity
class ParametrosPersonales {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int peso;
  int edad;
  int altura;
  int sexo;
  int? idMedidasMusculares;

  ParametrosPersonales(
      {this.id,
      required this.peso,
      required this.edad,
      required this.altura,
      required this.sexo,
      this.idMedidasMusculares});

  void setPeso(int peso) {
    this.peso = peso;
  }

  void setEdad(int edad) {
    this.edad = edad;
  }

  void setAltura(int altura) {
    this.altura = altura;
  }

  void setSexo(int sexo) {
    this.sexo = sexo;
  }
}

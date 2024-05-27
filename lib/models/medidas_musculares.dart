import 'package:floor/floor.dart';

@entity
class MedidasMusculares {
  @PrimaryKey(autoGenerate: true)
  int? id;
  double brazo;
  double pecho;
  double cintura;
  double torso;
  double gemelos;
  double antebrazo;
  double abdominales;
  double gluteos;

  MedidasMusculares(
      {this.id,
      required this.brazo,
      required this.pecho,
      required this.cintura,
      required this.torso,
      required this.gemelos,
      required this.antebrazo,
      required this.abdominales,
      required this.gluteos});

  void setBrazo(double brazo) {
    this.brazo = brazo;
  }

  void setPecho(double pecho) {
    this.pecho = pecho;
  }

  void setCintura(double cintura) {
    this.cintura = cintura;
  }

  void setTorso(double torso) {
    this.torso = torso;
  }

  void setGemelos(double gemelos) {
    this.gemelos = gemelos;
  }

  void setAntebrazo(double antebrazo) {
    this.antebrazo = antebrazo;
  }

  void setAbs(double abs) {
    this.abdominales = abs;
  }

  void setGluteos(double gluteos) {
    this.gluteos = gluteos;
  }

  void setMusculo(String musculo, double medida) {
    switch (musculo) {
      case 'brazo':
        setBrazo(medida);
        break;
      case 'pecho':
        setPecho(medida);
        break;
      case 'cintura':
        setCintura(medida);
        break;
      case 'torso':
        setTorso(medida);
        break;
      case 'gemelos':
        setGemelos(medida);
        break;
      case 'antebrazo':
        setAntebrazo(medida);
        break;
      case 'abdominales':
        setAbs(medida);
        break;
      case 'gluteos':
        setGluteos(medida);
        break;
    }
  }
}

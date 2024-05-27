import 'package:flutter/material.dart';
import 'package:gym/local/database/database.dart';
import 'package:gym/models/medidas_musculares.dart';

class MuscleMeasureScreen extends StatefulWidget {
  late final DatabaseHelper db;
  MedidasMusculares medidasMusculares;

  MuscleMeasureScreen({required this.medidasMusculares});

  @override
  _MuscleMeasurementScreenState createState() =>
      _MuscleMeasurementScreenState(medidasMusculares: medidasMusculares);
}

class _MuscleMeasurementScreenState extends State<MuscleMeasureScreen> {
  MedidasMusculares medidasMusculares;

  _MuscleMeasurementScreenState({required this.medidasMusculares});

  void initState() {
    super.initState();
    Future.microtask(() async {
      await initializeDatabase();
    });
  }

  Future<void> initializeDatabase() async {
    widget.db =
        await $FloorDatabaseHelper.databaseBuilder('database.db').build();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medidas Musculares'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20), // Add this line (1/2)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Aqui podras registrar tus medidas musculares, para que puedas llevar un control de tu progreso',
              style: TextStyle(fontSize: 14),
            ),
          ),
          MuscleCard(
            musculo: 'brazo',
            medida: medidasMusculares.brazo,
            medidasMusculares: medidasMusculares,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('brazo', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),
          MuscleCard(
            musculo: 'pecho',
            medida: medidasMusculares.pecho,
            medidasMusculares: medidasMusculares,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('pecho', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),
          MuscleCard(
            musculo: 'cintura',
            medida: medidasMusculares.cintura,
            medidasMusculares: medidasMusculares,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('cintura', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),
          MuscleCard(
            musculo: 'torso',
            medida: medidasMusculares.torso,
            medidasMusculares: medidasMusculares,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('torso', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),
          MuscleCard(
            musculo: 'gemelos',
            medida: medidasMusculares.gemelos,
            medidasMusculares: medidasMusculares,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('gemelos', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),
          MuscleCard(
            musculo: 'antebrazo',
            medida: medidasMusculares.antebrazo,
            medidasMusculares: medidasMusculares,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('antebrazo', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),
          MuscleCard(
            musculo: 'abdominales',
            medida: medidasMusculares.abdominales,
            medidasMusculares: medidasMusculares,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('abdominales', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),
          MuscleCard(
            musculo: 'gluteos',
            medidasMusculares: medidasMusculares,
            medida: medidasMusculares.gluteos,
            onUpdate: (newValue) async {
              medidasMusculares.setMusculo('gluteos', newValue);
              await widget.db.medidasMuscularesDao
                  .updateMedidas(medidasMusculares);
              setState(() {});
            },
          ),

          SizedBox(height: 20), // Add this line (2/2)
        ],
      ),
    );
  }
}

class MuscleCard extends StatelessWidget {
  final String musculo;
  final MedidasMusculares medidasMusculares;
  final Function(double) onUpdate;
  double medida;

  MuscleCard({
    required this.musculo,
    required this.medidasMusculares,
    required this.onUpdate,
    required this.medida,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController medidaController = TextEditingController();
              return AlertDialog(
                title: Text('Medida muscular'),
                content: TextField(
                  controller: medidaController,
                  decoration: InputDecoration(
                    labelText:
                        'Por favor introduce la medida del musculo $musculo',
                  ),
                  keyboardType: TextInputType.number,
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      double medida = double.parse(medidaController.text);
                      onUpdate(medida);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: ListTile(
          title: Text('$musculo: $medida cm'),
        ),
      ),
    );
  }
}

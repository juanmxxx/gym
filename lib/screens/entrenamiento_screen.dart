import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'package:gym/screens/ejercicio_screen_local.dart';
import 'package:gym/screens/screens.dart';
import 'package:gym/local/database/database.dart';
import 'package:gym/screens/ejercicio_card_local.dart';

class EntrenamientoScreen extends StatefulWidget {
  @override
  _EntrenamientoScreenState createState() => _EntrenamientoScreenState();
}

class _EntrenamientoScreenState extends State<EntrenamientoScreen> {
  List<EjercicioLocal> ejercicios = [];
  late final DatabaseHelper db;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    Future.microtask(() async {
      await initializeDatabase();
      db.ejercicioDao
          .readAll()
          .then((value) => setState(() => ejercicios = value));
    });
  }

  Future<void> initializeDatabase() async {
    db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
  }

  @override
  Widget build(BuildContext context) {
    List<String> diasSemana =
        ejercicios.map((e) => e.dayOfWeek).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Entrenamiento'),
      ),
      body: ListView.builder(
          itemCount: diasSemana.length,
          itemBuilder: (BuildContext context, int index) {
            final diaSemana = diasSemana[index];
            final ejerciciosDia =
                ejercicios.where((e) => e.dayOfWeek == diaSemana).toList();

            if (ejercicios.isEmpty) {
              print("No hay ejercicios");
              return Center(child: Text('No exercises here'));
            } else {
              print(" hay ejercicios");
              return Column(
                children: [
                  Card(
                    child: ExpansionTile(
                      title: Text(diaSemana),
                      children: List.generate(
                          ejerciciosDia.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EjercicioScreenLocal(
                                        nombrEjercicio:
                                            ejerciciosDia[index].nombre,
                                        gifAyuda: ejerciciosDia[index].gifAyuda,
                                        descripcion:
                                            ejerciciosDia[index].descripcion,
                                      ),
                                    ),
                                  );
                                },
                                child: ExercicesLocalScreen(
                                  ejercicio: ejerciciosDia[index],
                                ),
                              )),
                    ),
                  ),
                ],
              );
            }
          }),
      bottomNavigationBar: MenuScreen(
          onTap: (index) {
            switch (index) {
              case 1:
                Navigator.pushReplacementNamed(context, 'administrar',
                    arguments: index);
                break;
              case 2:
                Navigator.pushReplacementNamed(context, 'tips',
                    arguments: index);
                break;
              case 3:
                Navigator.pushReplacementNamed(context, 'configuracion',
                    arguments: index);
                break;
            }
          },
          index: 0),
    );
  }
}

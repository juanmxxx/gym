import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'package:gym/models/parametros_personales.dart';
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
  late ParametrosPersonales? parametrosUsuario;

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
    parametrosUsuario = await db.parametrosPersonalesDao.readFirst();
  }

  @override
  Widget build(BuildContext context) {
    List<String> diasSemana =
        ejercicios.map((e) => e.dayOfWeek).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${parametrosUsuario?.nombre}'),
        automaticallyImplyLeading: false,
      ),
      body: ejercicios.isEmpty
          ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No hay ejercicios registrados, empieza añadiendo!'),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      // Handle the button press here
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Procedimiento'),
                            content: Text(
                                'Para añadir un ejercicio, ve a la pantalla de administracion.\n\n Luego abre el desplegable sobre el musculo a entrenar y selecciona un ejercicio, pulsa el icono "+" rellena los parametros y añade!'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: diasSemana.length,
              itemBuilder: (BuildContext context, int index) {
                final diaSemana = diasSemana[index];
                final ejerciciosDia =
                    ejercicios.where((e) => e.dayOfWeek == diaSemana).toList();

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
                                          gifAyuda:
                                              ejerciciosDia[index].gifAyuda,
                                          descripcion:
                                              ejerciciosDia[index].descripcion,
                                          id: ejerciciosDia[index].id ?? 0,
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

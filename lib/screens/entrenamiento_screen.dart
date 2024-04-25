import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio_local.dart';
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

            return Column(
              children: [
                Card(
                  child: ExpansionTile(
                    title: Text(diaSemana),
                    children: List.generate(
                        ejerciciosDia.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'ejercicio');
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
      bottomNavigationBar: MenuScreen(onTap: (index) {
        switch (index) {
          case 1:
            Navigator.pushNamed(context, 'administrar');
            break;
          case 2:
            Navigator.pushNamed(context, 'ayuda');
            break;
          case 3:
            Navigator.pushNamed(context, 'configuracion');
            break;
        }
      }),
    );
  }
}

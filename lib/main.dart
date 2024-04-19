import 'package:flutter/material.dart';
import 'package:gym/screens/administracion_screen.dart';
import 'package:gym/screens/entrenamiento_screen.dart';
import 'package:provider/provider.dart';
import 'package:gym/services/ejercicios_services.dart';
import 'package:gym/screens/prueba.dart';
import 'package:gym/local/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final db;

  MyApp({this.db});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LightWeight Gym',
      initialRoute: 'prueba',
      routes: {
        'entrenamiento': (_) => EntrenamientoScreen(),
        'administrar': (_) => AdministracionScreen(),
        'prueba': (context) => PruebaEjerScreen(db: db)
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo)),
      home: EntrenamientoScreen(),
    );
  }
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EjerciciosServices()),
      ],
      child: MyApp(),
    );
  }
}

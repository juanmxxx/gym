import 'package:flutter/material.dart';
import 'package:gym/screens/administracion_screen.dart';
import 'package:gym/screens/entrenamiento_screen.dart';
import 'package:provider/provider.dart';
import 'package:gym/services/ejercicios_services.dart';
import 'package:gym/screens/prueba.dart';
import 'package:gym/screens/ejercicio_screen.dart';
import 'package:gym/screens/login/main_screen.dart';
import 'package:gym/screens/user_screen.dart';

void main() async {
  runApp(AppState());
}

class MyApp extends StatelessWidget {
  final db;

  MyApp({this.db});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LightWeight Gym',
      //initialRoute: 'entrenamiento',
      routes: {
        'entrenamiento': (_) => EntrenamientoScreen(),
        'administrar': (_) => AdministracionScreen(),
        'prueba': (context) => PruebaEjerScreen(db: db),
        'ejercicio': (context) => EjercicioScreen(),
        'mainScreenLogin': (context) => MainLoginScreen(),
        'configuracion': (context) => UsuarioScreen(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo)),
      home: MainLoginScreen(),
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

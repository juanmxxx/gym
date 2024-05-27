import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:gym/screens/administracion_screen.dart';
import 'package:gym/screens/entrenamiento_screen.dart';
import 'package:provider/provider.dart';
import 'package:gym/services/ejercicios_services.dart';
import 'package:gym/screens/ejercicio_screen.dart';
import 'package:gym/screens/login/main_screen.dart';
import 'package:gym/screens/user_screen.dart';
import 'package:gym/screens/tips_screen.dart';
import 'package:gym/screens/ejercicio_screen_local.dart';
import 'package:gym/local/database/database.dart';
import '../../common/color_extension.dart';
// to do leer primer registro personal, si hay empezar en entrenamiento, si no en configuracion

void main() async {
  runApp(MyApp());
  //runApp(MyApp(db: db));
  runApp(AppState());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DatabaseHelper? db;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
    if (await db?.parametrosPersonalesDao.getRowCount() != 0) {
      setState(() {
        isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(
        scaffoldBackgroundColor: TColor.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: TColor.primary,
          titleTextStyle: TextStyle(
              color: TColor.white, fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      dark: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[850],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: TColor.primary,
          titleTextStyle: TextStyle(
              color: TColor.white, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        textTheme: ThemeData.dark()
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        routes: {
          'entrenamiento': (_) => EntrenamientoScreen(),
          'administrar': (_) => AdministracionScreen(),
          'ejercicio': (context) => EjercicioScreen(),
          'mainScreenLogin': (context) => MainLoginScreen(),
          'configuracion': (context) => UsuarioScreen(),
          'tips': (context) => TipsScreen(),
        },
        darkTheme: darkTheme,
        home: isInitialized ? EntrenamientoScreen() : MainLoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
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

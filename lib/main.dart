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
import 'package:gym/local/database/database.dart';
import '../../common/color_extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
  runApp(AppState(db: db));
}

class AppState extends StatelessWidget {
  final DatabaseHelper db;

  AppState({required this.db});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EjerciciosServices()),
      ],
      child: MyApp(db: db),
    );
  }
}

class MyApp extends StatefulWidget {
  final DatabaseHelper db;

  MyApp({required this.db});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    if (await widget.db.parametrosPersonalesDao.getRowCount() != 0) {
      setState(() {
        isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(239, 255, 255, 255),
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

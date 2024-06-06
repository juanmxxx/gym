import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym/main.dart';
import 'package:gym/models/parametros_personales.dart';
import 'package:gym/screens/menu_screen.dart';
import 'package:gym/screens/user/user_params_screen.dart';
import 'package:gym/screens/user/TBM_calculator_screen.dart';
import 'package:gym/local/database/database_helper.dart';
import 'package:gym/screens/user/muscle_measure_screen.dart';
import 'package:gym/models/medidas_musculares.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:gym/screens/user/privacy_screen.dart';

class UsuarioScreen extends StatefulWidget {
  const UsuarioScreen({Key? key}) : super(key: key);

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  late ParametrosPersonales? parametrosUsuario;
  late MedidasMusculares? medidasMusculares;
  late final DatabaseHelper db;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    Future.microtask(() async {
      await initializeDatabase();
    });
  }

  Future<void> initializeDatabase() async {
    db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
    parametrosUsuario = await db.parametrosPersonalesDao.readFirst();

    if ((await db.medidasMuscularesDao.getRowCount()) == 0) {
      await initializeMusculos();
    }

    medidasMusculares = await db.medidasMuscularesDao.readFirst();
  }

  Future<void> initializeMusculos() async {
    medidasMusculares = MedidasMusculares(
        brazo: 0,
        cintura: 0,
        pecho: 0,
        gemelos: 0,
        gluteos: 0,
        abdominales: 0,
        torso: 0,
        antebrazo: 0);

    await db.medidasMuscularesDao.insertMedidas(medidasMusculares!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          SizedBox(height: 5),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsuarioParametrosScreen(
                    parametrosUsuario: parametrosUsuario!),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.person, size: 30),
                SizedBox(width: 20),
                Text(
                  'Usuario',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MuscleMeasureScreen(
                  medidasMusculares: medidasMusculares!,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.format_size, size: 30),
                SizedBox(width: 20),
                Text(
                  'Medidas musculares',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TBMCalculatorScreen(parametrosUsuario: parametrosUsuario!),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.calculate, size: 30),
                SizedBox(width: 20),
                Text(
                  'Calculadora TMB (Basal)',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PrivacyScreen(),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.privacy_tip, size: 30),
                SizedBox(width: 20),
                Text(
                  'Privacidad',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ThemeModeWidget(),
        ]),
      ),
      bottomNavigationBar: MenuScreen(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, 'entrenamiento');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, 'administrar');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, 'tips');
              break;
          }
        },
        index: 3,
      ),
    );
  }
}

class AdaptativeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        home: UsuarioScreen(),
      ),
    );
  }
}

class ThemeModeWidget extends StatefulWidget {
  @override
  _ThemeModeWidgetState createState() => _ThemeModeWidgetState();
}

class _ThemeModeWidgetState extends State<ThemeModeWidget> {
  int _selectedTheme = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Temas'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile<int>(
                    title: Text('Claro'),
                    value: 0,
                    groupValue: _selectedTheme,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedTheme = value ?? 0;
                        AdaptiveTheme.of(context).setLight();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Oscuro'),
                    value: 1,
                    groupValue: _selectedTheme,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedTheme = value ?? 0;
                        AdaptiveTheme.of(context).setDark();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Predeterminado del sistema'),
                    value: 2,
                    groupValue: _selectedTheme,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedTheme = value ?? 0;
                        AdaptiveTheme.of(context).toggleThemeMode();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Row(
        children: <Widget>[
          Icon(Icons.dark_mode, size: 30),
          SizedBox(width: 20),
          Text(
            'Tema del sistema',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

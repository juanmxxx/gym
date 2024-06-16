import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:gym/models/parametros_personales.dart';
import 'package:gym/local/database/database.dart';

class UsuarioParametrosScreen extends StatefulWidget {
  ParametrosPersonales parametrosUsuario;
  late final DatabaseHelper db;

  UsuarioParametrosScreen({required this.parametrosUsuario});

  @override
  _UsuarioParametrosScreenState createState() =>
      _UsuarioParametrosScreenState(parametrosUsuario: parametrosUsuario);
}

class _UsuarioParametrosScreenState extends State<UsuarioParametrosScreen> {
  ParametrosPersonales parametrosUsuario;

  _UsuarioParametrosScreenState({required this.parametrosUsuario});

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
    double peso = parametrosUsuario?.peso ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Parametros generales'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ParamRow(
                icon: Icons.monitor_weight,
                title: 'Peso',
                hintText: 'Introduce nuevo peso en kg',
                value: parametrosUsuario.peso,
                lastWeightUpdate: DateTime.now(),
                onUpdate: (newValue) async {
                  parametrosUsuario.setPeso(newValue);

                  await widget.db.parametrosPersonalesDao
                      .updateParametros(parametrosUsuario);
                  setState(() {});
                },
              ),
              SizedBox(height: 10),
              ParamRow(
                icon: Icons.height,
                title: 'Altura',
                hintText: 'Introduce nueva altura en cm',
                value: parametrosUsuario.altura,
                lastHeightUpdate: DateTime.now(),
                onUpdate: (newValue) async {
                  parametrosUsuario.setAltura(newValue);
                  await widget.db.parametrosPersonalesDao
                      .updateParametros(parametrosUsuario);
                  setState(() {});
                },
              ),
              SizedBox(height: 10),
              ParamRow(
                icon: Icons.timelapse,
                title: 'Edad',
                hintText: 'Introduce nueva edad',
                value: parametrosUsuario.edad.toDouble(),
                lastAgeUpdate: DateTime.now(),
                onUpdate: (newValue) async {
                  parametrosUsuario.setEdad(newValue.toInt());
                  await widget.db.parametrosPersonalesDao
                      .updateParametros(parametrosUsuario);
                  setState(() {});
                },
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Icon(Icons.male, size: 30),
                  SizedBox(width: 20),
                  Text(
                    'Sexo: ${parametrosUsuario?.sexo == 1 ? 'Másculino' : 'Femenino'}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          )),
    );
  }
}

class ParamRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String hintText;
  final double value;
  final Function(double) onUpdate;
  DateTime? lastWeightUpdate;
  DateTime? lastHeightUpdate;
  DateTime? lastAgeUpdate;

  ParamRow({
    required this.icon,
    required this.title,
    required this.hintText,
    required this.value,
    required this.onUpdate,
    this.lastAgeUpdate,
    this.lastHeightUpdate,
    this.lastWeightUpdate,
  });

  void UpdateWeightDate() {
    lastWeightUpdate = DateTime.now();
  }

  void UpdateHeightDate() {
    lastHeightUpdate = DateTime.now();
  }

  void UpdateAgeDate() {
    lastAgeUpdate = DateTime.now();
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, size: 30),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController controller = TextEditingController();
                return AlertDialog(
                  title: Text(title),
                  content: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: hintText),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Aceptar'),
                      onPressed: () {
                        onUpdate(double.parse(controller.text));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: title == 'Peso'
                      ? '$title: $value kg '
                      : (title == 'Altura'
                          ? '$title: $value cm '
                          : '$title: ${value.toInt()} años '),
                  style: TextStyle(fontSize: 20),
                ),
                TextSpan(
                  text: title == 'Peso'
                      ? '  (Actualizado el ${formatDate(lastWeightUpdate!)})'
                      : (title == 'Altura'
                          ? '  (Actualizado el ${formatDate(lastHeightUpdate!)})'
                          : '  (Actualizado el ${formatDate(lastAgeUpdate!)})'),
                  style:
                      TextStyle(fontSize: 11), // smaller font size for the date
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

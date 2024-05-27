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
    int peso = parametrosUsuario?.peso ?? 0;
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
                value: parametrosUsuario.edad,
                onUpdate: (newValue) async {
                  parametrosUsuario.setEdad(newValue);
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
                    'Sexo: ${parametrosUsuario?.sexo == 1 ? 'Varón' : 'Hembra'}',
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
  final int value;
  final Function(int) onUpdate;

  ParamRow({
    required this.icon,
    required this.title,
    required this.hintText,
    required this.value,
    required this.onUpdate,
  });

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
                        onUpdate(int.parse(controller.text));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            '$title: $value',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

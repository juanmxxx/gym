import 'package:flutter/material.dart';
import 'package:gym/models/parametros_personales.dart';
import 'package:gym/local/database/database.dart';

class UsuarioParametrosScreen extends StatefulWidget {
  ParametrosPersonales parametrosUsuario;

  UsuarioParametrosScreen({required this.parametrosUsuario});

  @override
  _UsuarioParametrosScreenState createState() =>
      _UsuarioParametrosScreenState(parametrosUsuario: parametrosUsuario);
}

class _UsuarioParametrosScreenState extends State<UsuarioParametrosScreen> {
  ParametrosPersonales parametrosUsuario;

  _UsuarioParametrosScreenState({required this.parametrosUsuario});

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
              Row(
                children: <Widget>[
                  Icon(Icons.person, size: 30),
                  SizedBox(width: 20),
                  Text(
                    'Peso: $peso kg',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Icon(Icons.height, size: 30),
                  SizedBox(width: 20),
                  Text(
                    'Altura: ${parametrosUsuario?.altura} cm',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Icon(Icons.height, size: 30),
                  SizedBox(width: 20),
                  Text(
                    'Edad: ${parametrosUsuario?.edad}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Icon(Icons.height, size: 30),
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

import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'package:gym/screens/ejercicio_screen.dart';

class EjercicioScreenLocal extends StatelessWidget {
  final EjercicioLocal ejercicio;

  EjercicioScreenLocal({required this.ejercicio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ButtonsRow(nombre: ejercicio.nombre),
                EjerciseImage(url: ejercicio.gifAyuda),
                Description(descripcion: ejercicio.descripcion),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

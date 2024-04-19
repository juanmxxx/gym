import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio_local.dart';

class PruebaLeerEjerScreen extends StatefulWidget {
  final db;
  PruebaLeerEjerScreen({required this.db});

  @override
  State<PruebaLeerEjerScreen> createState() => _PruebaLeerEjerScreenState();
}

class _PruebaLeerEjerScreenState extends State<PruebaLeerEjerScreen> {
  List<EjercicioLocal> ejercicios = [];

  @override
  void initState() {
    super.initState();
    widget.db.ejercicioDao
        .readAll()
        .then((value) => setState(() => ejercicios = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: ejercicios.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(ejercicios[index].nombre),
              subtitle: Text(ejercicios[index].descripcion),
            );
          },
        ),
      ),
    );
  }
}

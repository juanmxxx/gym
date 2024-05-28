import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'package:gym/screens/ejercicio_screen.dart';
import 'package:gym/services/manage_local.dart';

class EjercicioScreenLocal extends StatelessWidget {
  final int id;
  final String nombrEjercicio;
  final String gifAyuda;
  final String descripcion;

  EjercicioScreenLocal({
    required this.id,
    required this.nombrEjercicio,
    required this.gifAyuda,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ButtonsRow(nombre: nombrEjercicio),
                EjerciseImage(url: gifAyuda),
                Description(descripcion: descripcion),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: DeleteEjercise(id: id),
    );
  }
}

class DeleteEjercise extends StatelessWidget {
  int id;

  DeleteEjercise({required this.id});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmacion'),
              content: Text('¿Estas seguro de eliminar este ejercicio?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Dismiss the dialog
                  },
                ),
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    ManageLocal().deleteEjercise(id);
                    Navigator.pushReplacementNamed(context, 'entrenamiento');
                  },
                ),
              ],
            );
          },
        );
      },
      child: Icon(Icons.delete),
    );
  }
}

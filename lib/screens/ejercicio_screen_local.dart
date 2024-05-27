import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'package:gym/screens/ejercicio_screen.dart';

class EjercicioScreenLocal extends StatelessWidget {
  final String nombrEjercicio;
  final String gifAyuda;
  final String descripcion;

  EjercicioScreenLocal({
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
      floatingActionButton: DeleteEjercise(),
    );
  }
}

class DeleteEjercise extends StatelessWidget {
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
                    Navigator.of(context).pop(); // Dismiss the dialog

                    Navigator.pop(context); // Navigate back
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

import 'package:flutter/material.dart';
import 'package:gym/services/services.dart';
import 'screens.dart';
import 'package:provider/provider.dart';

class AdministracionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ejerciciosServices = Provider.of<EjerciciosServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios'),
      ),
      body: ListView.builder(
          itemCount: ejerciciosServices.ejercicios.length,
          itemBuilder: (BuildContext context, int index) => ExercicesCard(
                ejercicio: ejerciciosServices.ejercicios[index],
              )),
      bottomNavigationBar: MenuScreen(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, 'entrenamiento');
              break;
            case 2:
              Navigator.pushNamed(context, 'ayuda');
              break;
            case 3:
              Navigator.pushNamed(context, 'configuracion');
              break;
          }
        },
      ),
    );
  }
}

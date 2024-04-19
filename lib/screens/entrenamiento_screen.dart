import 'package:flutter/material.dart';
import 'package:gym/screens/screens.dart';

class EntrenamientoScreen extends StatefulWidget {
  @override
  _EntrenamientoScreenState createState() => _EntrenamientoScreenState();
}

class _EntrenamientoScreenState extends State<EntrenamientoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrenamiento-Workout Semanal'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
                'Parece que no tienes entrenamiento asignado aún, ve a Administrar para asignar uno.')
          ],
        ),
      ),
      bottomNavigationBar: MenuScreen(onTap: (index) {
        switch (index) {
          case 1:
            Navigator.pushNamed(context, 'administrar');
            break;
          case 2:
            Navigator.pushNamed(context, 'ayuda');
            break;
          case 3:
            Navigator.pushNamed(context, 'configuracion');
            break;
        }
      }),
    );
  }
}

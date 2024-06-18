import 'package:flutter/material.dart';
import 'package:gym/services/ejercicios_services.dart';
import 'screens.dart';
import 'package:provider/provider.dart';

class AdministracionScreen extends StatefulWidget {
  @override
  _AdministracionScreenState createState() => _AdministracionScreenState();
}

class _AdministracionScreenState extends State<AdministracionScreen> {
  @override
  Widget build(BuildContext context) {
    final ejerciciosServices = Provider.of<EjerciciosServices>(context);
    List<String> tipos =
        ejerciciosServices.ejercicios.map((e) => e.tipo).toSet().toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: tipos.length,
        itemBuilder: (BuildContext context, int index) {
          final tipo = tipos[index];
          final ejercicios = ejerciciosServices.ejercicios
              .where((e) => e.tipo == tipo)
              .toList();
          return Card(
            child: ExpansionTile(
              title: Text('${tipo[0].toUpperCase()}${tipo.substring(1)}'),
              children: List.generate(
                ejercicios.length,
                (index) => GestureDetector(
                  onTap: () {
                    ejerciciosServices.selectedEjercicio =
                        ejercicios[index].copy();
                    Navigator.pushNamed(context, 'ejercicio');
                  },
                  child: ExercicesCard(
                    ejercicio: ejercicios[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: MenuScreen(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, 'entrenamiento');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, 'tips');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, 'configuracion');
              break;
          }
        },
        index: 1,
      ),
    );
  }
}

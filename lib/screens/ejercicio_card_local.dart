import 'package:flutter/material.dart';
import 'package:gym/local/database/database.dart';
import 'package:gym/models/ejercicio_local.dart';

class ExercicesLocalScreen extends StatefulWidget {
  final EjercicioLocal ejercicio;

  const ExercicesLocalScreen({Key? key, required this.ejercicio})
      : super(key: key);

  @override
  _ExercicesLocalScreenState createState() =>
      _ExercicesLocalScreenState(ejercicio: ejercicio);
}

class _ExercicesLocalScreenState extends State<ExercicesLocalScreen> {
  final EjercicioLocal ejercicio;
  _ExercicesLocalScreenState({required this.ejercicio});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Stack(children: [
                  _backgroundImage(url: ejercicio.imagen),
                  _ProductDetails(nombre: ejercicio.nombre)
                ]),
              ),
            ),
            SelectParameters(ejercicio: ejercicio),
          ],
        ));
  }
}

class _ProductDetails extends StatelessWidget {
  final String nombre;

  const _ProductDetails({
    required this.nombre,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          nombre,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              overflow: TextOverflow.ellipsis),
        ),
      ]),
    );
  }
}

class _backgroundImage extends StatelessWidget {
  final String? url;

  const _backgroundImage({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          child: FadeInImage(
            placeholder: AssetImage('assets/gym.gif'),
            image: NetworkImage(url!),
            fit: BoxFit.cover,
          ),
        ));
  }
}

class SelectParameters extends StatefulWidget {
  final EjercicioLocal ejercicio;

  SelectParameters({required this.ejercicio});

  @override
  _SelectParametersState createState() =>
      _SelectParametersState(ejercicio: ejercicio);
}

class _SelectParametersState extends State<SelectParameters> {
  late DatabaseHelper db;

  TextEditingController seriesController = TextEditingController();
  TextEditingController repetitionsController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  EjercicioLocal ejercicio;
  _SelectParametersState({required this.ejercicio});

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await initializeDatabase();
    });

    seriesController.text = ejercicio.series.toString();
    repetitionsController.text = ejercicio.repeticiones.toString();
    weightController.text = ejercicio.peso.toString();
  }

  Future<void> initializeDatabase() async {
    db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.fitness_center),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Selecciona un nuevo numero de series'),
                        content: TextField(
                          controller: seriesController,
                          decoration: InputDecoration(
                            labelText: 'Series',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () async {
                              int seriesValue =
                                  int.tryParse(seriesController.text) ?? -1;
                              if (seriesValue <= 0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          'El número de series no puede ser 0 o negativo.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the error dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                updateEjercicio();
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 10),
              Text(seriesController.text),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.repeat),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            Text('Selecciona un nuevo numero de repeticiones'),
                        content: TextField(
                          controller: repetitionsController,
                          decoration: InputDecoration(
                            labelText: 'Repeticiones',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () async {
                              int repetitionsValue =
                                  int.tryParse(repetitionsController.text) ??
                                      -1;
                              if (repetitionsValue <= 0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          'El número de repeticiones no puede ser 0 o negativo.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                updateEjercicio();
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 10),
              Text(repetitionsController.text),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.line_weight),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Selecciona un nuevo peso (kg)'),
                        content: TextField(
                          controller: weightController,
                          decoration: InputDecoration(
                            labelText: 'Peso',
                          ),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () async {
                              double weightValue =
                                  double.tryParse(weightController.text) ??
                                      -1; // Default to -1 if parsing fails
                              if (weightValue <= 0) {
                                // If weightValue is negative, show an error dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          'El peso no puede ser 0 o negativo.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the error dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                // If weightValue is not negative, proceed with the update
                                updateEjercicio();
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 10),
              Text(weightController.text),
            ],
          ),
        ],
      ),
    ]);
  }

  void updateEjercicio() async {
    final updatedEjercicio = EjercicioLocal(
      id: ejercicio.id,
      nombre: ejercicio.nombre,
      imagen: ejercicio.imagen,
      descripcion: ejercicio.descripcion,
      repeticiones: int.parse(repetitionsController.text),
      series: int.parse(seriesController.text),
      peso: int.parse(weightController.text),
      dayOfWeek: ejercicio.dayOfWeek,
      gifAyuda: ejercicio.gifAyuda,
      tipo: ejercicio.tipo,
    );

    await db.ejercicioDao.updateEjercicio(updatedEjercicio);
    setState(() {});
    Navigator.of(context).pop();
  }
}

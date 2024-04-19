import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio.dart';

class ExercicesCard extends StatefulWidget {
  final Ejercicio ejercicio;

  const ExercicesCard({super.key, required this.ejercicio});

  @override
  _ExercicesCardState createState() =>
      _ExercicesCardState(ejercicio: ejercicio);
}

class _ExercicesCardState extends State<ExercicesCard> {
  final Ejercicio ejercicio;

  final TextEditingController seriesController = TextEditingController();
  final TextEditingController repetitionsController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  _ExercicesCardState({required this.ejercicio});

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
                              title: Text('Select number of series'),
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
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(
                                        () {}); // Refresh the state to update the UI
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
                              title: Text('Select repetitions'),
                              content: TextField(
                                controller: repetitionsController,
                                decoration: InputDecoration(
                                  labelText: 'Weight',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(
                                        () {}); // Refresh the state to update the UI
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
                              title: Text('Select Weight'),
                              content: TextField(
                                controller: weightController,
                                decoration: InputDecoration(
                                  labelText: 'Weight',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(
                                        () {}); // Refresh the state to update the UI
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
          ],
        ));
  }
}

class _ProductDetails extends StatelessWidget {
  final String nombre;

  const _ProductDetails({
    required this.nombre,
    super.key,
  });

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
    super.key,
    this.url,
  });

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

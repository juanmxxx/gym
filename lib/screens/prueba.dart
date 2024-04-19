import 'package:flutter/material.dart';
import 'package:gym/local/database/database.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'prueba_leer_ejercicios.dart';

class PruebaEjerScreen extends StatefulWidget {
  final DatabaseHelper db;
  PruebaEjerScreen({required this.db});

  @override
  State<PruebaEjerScreen> createState() => _PruebaEjerScreenState();
}

class _PruebaEjerScreenState extends State<PruebaEjerScreen> {
  TextEditingController nombre = TextEditingController();
  TextEditingController imagen = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController repeticiones = TextEditingController();
  TextEditingController series = TextEditingController();
  TextEditingController peso = TextEditingController();
  TextEditingController diaSemana = TextEditingController();
  List<EjercicioLocal> ejercicios = [];
  final controller = TextEditingController();

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
          child: Column(children: [
            TextField(
              controller: nombre,
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            TextField(
              controller: imagen,
              decoration: InputDecoration(
                labelText: 'Imagen',
              ),
            ),
            TextField(
              controller: descripcion,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
            ),
            TextField(
              controller: repeticiones,
              decoration: InputDecoration(
                labelText: 'Repeticiones',
              ),
            ),
            TextField(
              controller: series,
              decoration: InputDecoration(
                labelText: 'Series',
              ),
            ),
            TextField(
              controller: peso,
              decoration: InputDecoration(
                labelText: 'Peso',
              ),
            ),
            TextField(
              controller: diaSemana,
              decoration: InputDecoration(
                labelText: 'Día de la semana',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final String nombre1 = nombre.text;
                final imagen1 = imagen.text;
                final descripcion1 = descripcion.text;
                final repeticiones1 = repeticiones.text;
                final series1 = series.text;
                final peso1 = peso.text;
                final diaSemana1 = diaSemana.text;

                EjercicioLocal ejercicio = EjercicioLocal(
                  nombre: nombre1,
                  imagen: imagen1,
                  descripcion: descripcion1,
                  repeticiones: int.parse(repeticiones1),
                  series: int.parse(series1),
                  peso: int.parse(peso1),
                  dayOfWeek: diaSemana1,
                );

                final id =
                    await widget.db.ejercicioDao.insertEjercicio(ejercicio);

                ejercicio = EjercicioLocal(
                  id: id,
                  nombre: nombre1,
                  imagen: imagen1,
                  descripcion: descripcion1,
                  repeticiones: int.parse(repeticiones1),
                  series: int.parse(series1),
                  peso: int.parse(peso1),
                  dayOfWeek: diaSemana1,
                );

                setState(() {
                  ejercicios.add(ejercicio);
                });

                await widget.db.ejercicioDao.insertEjercicio(ejercicio);
              },
              child: Text('Save'),
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PruebaLeerEjerScreen(db: widget.db)));
                },
                child: const Text('Leer ejercicios')),
          ]),
        ));
  }
}

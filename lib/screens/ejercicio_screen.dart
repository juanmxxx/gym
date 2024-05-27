import 'package:flutter/material.dart';
import 'package:gym/services/services.dart';
import 'package:provider/provider.dart';
import 'package:gym/models/ejercicio.dart';
import 'package:gym/services/submit_to_local.dart';

class EjercicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ejercicioService = Provider.of<EjerciciosServices>(context);
    String nombre = ejercicioService.selectedEjercicio!.nombre;
    String gif = ejercicioService.selectedEjercicio!.gif_ayuda;
    String descripcion = ejercicioService.selectedEjercicio!.descripcion;
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ButtonsRow(nombre: nombre),
                EjerciseImage(url: gif),
                Description(descripcion: descripcion),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SubmitEjercise(),
    );
  }
}

class EjerciseImage extends StatelessWidget {
  final String url;

  EjerciseImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: url == null
            ? Image(image: AssetImage('assets/no_image.png'), fit: BoxFit.cover)
            : FadeInImage(
                image: NetworkImage(url),
                placeholder: AssetImage('assets/gym.gif'),
              ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  final String nombre;

  ButtonsRow({required this.nombre});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60, left: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10), // Add some space between the buttons
          Text(nombre, style: TextStyle(fontSize: 25)),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String descripcion;

  Description({required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 15),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Title(
            color: Colors.black,
            child: Text('Descripción', style: TextStyle(fontSize: 20))),
        Text(
          '\n$descripcion',
          style: TextStyle(fontSize: 15),
        ),
      ]),
    );
  }
}

class SubmitEjercise extends StatelessWidget {
  FloatingActionButton build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ExerciseForm();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}

class ExerciseForm extends StatefulWidget {
  @override
  _ExerciseFormState createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  String dropdownValue = 'Lunes';
  TextEditingController peso = TextEditingController();
  TextEditingController repeticiones = TextEditingController();
  TextEditingController series = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ejercicioService = Provider.of<EjerciciosServices>(context);
    Ejercicio ejercicioFinal = ejercicioService.selectedEjercicio!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Peso (kg):'),
          TextField(
            controller: peso,
            keyboardType: TextInputType.number,
          ),
          Text('Series:'),
          TextField(
            controller: series,
            keyboardType: TextInputType.number,
          ),
          Text('Repeticiones:'),
          TextField(
            controller: repeticiones,
            keyboardType: TextInputType.number,
          ),
          Text('Día:'),
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Lunes',
              'Martes',
              'Miercoles',
              'Jueves',
              'Viernes',
              'Sabado',
              'Domingo'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle the form submission
              print('Peso: ${peso.text}');
              print('Series: ${series.text}');
              print('Repetitions: ${repeticiones.text}');
              print('Dia: $dropdownValue');

              SubmitToLocalEjercise(
                  ejercicio: ejercicioFinal,
                  repeticiones: int.parse(repeticiones.text),
                  series: int.parse(series.text),
                  peso: int.parse(peso.text),
                  diaSemana: dropdownValue);
              Navigator.pop(context);
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}

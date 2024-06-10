import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym/models/parametros_personales.dart';

class TBMCalculatorScreen extends StatefulWidget {
  ParametrosPersonales parametrosUsuario;

  TBMCalculatorScreen({required this.parametrosUsuario});

  @override
  _TBMCalculatorScreenState createState() =>
      _TBMCalculatorScreenState(parametrosUsuario: parametrosUsuario);
}

class _TBMCalculatorScreenState extends State<TBMCalculatorScreen> {
  ParametrosPersonales parametrosUsuario;
  _TBMCalculatorScreenState({required this.parametrosUsuario});

  int calculateTBMNoFactor() {
    int tmb = 0;

    switch (parametrosUsuario.sexo) {
      case 0:
        tmb = (65 + (9.6 * parametrosUsuario.peso)).toInt() +
            ((1.8 * parametrosUsuario.altura) - (4.7 * parametrosUsuario.edad))
                .toInt();
        break;
      case 1:
        tmb = (66 + (13.7 * parametrosUsuario.peso)).toInt() +
            ((5 * parametrosUsuario.altura) - (6.8 * parametrosUsuario.edad))
                .toInt();
        break;
    }
    return tmb;
  }

  @override
  Widget build(BuildContext context) {
    int recomendado = calculateTBMNoFactor();

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Tasa Metabolica Basal (TMB)'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20), // Add this line (1/2)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Aqui selecciona la frecuencia con la cual realiza usted ejercicio, si quiere saber a cerca que es el indice de tasa metabolica presione el botton abajo a la derecha', // Replace with your actual explanation
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(height: 20), // Add this line (2/2)
          CardEjerciseFrequency(
              frase: 'Persona sedentaria. Poco o ningun ejercicio.',
              recomendado: (recomendado * 1.2).toInt()), // Add this line

          SizedBox(height: 12),
          CardEjerciseFrequency(
              frase:
                  'Persona moderadamente activa. Ejercicio ligero de 1 a 3 veces por semana.',
              recomendado: (recomendado * 1.375).toInt()), // Add this line
          // Add this line
          SizedBox(height: 12),
          CardEjerciseFrequency(
              frase:
                  'Persona muy activa. Ejercicio moderado de 3 a 5 veces por semana.',
              recomendado: (recomendado * 1.55).toInt()), // Add this line
          SizedBox(height: 12),
          CardEjerciseFrequency(
              frase:
                  'Persona super activa. Ejercicio intenso 6 o 7 veces por semana.',
              recomendado: (recomendado * 1.725).toInt()), // Add this line
          SizedBox(height: 12),
          CardEjerciseFrequency(
              frase:
                  'Persona extremadamente activa. Ejercicio intenso dos veces al dia.',
              recomendado: (recomendado * 1.9).toInt()), // Add this line
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('¿Qué es la Tasa Metabólica Basal?'),
                content: Text(
                    'La Tasa Metabólica Basal (TMB) es la cantidad mínima de energía que nuestro cuerpo necesita para mantener funciones vitales básicas como respirar, procesos digestivos, control de la temperatura, entre otros. En otras palabras, es la medida del gasto energético de un organismo cuando está en reposo.'), // Replace with your explanation
                actions: <Widget>[
                  TextButton(
                    child: Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.info),
      ),
    );
  }
}

class CardEjerciseFrequency extends StatelessWidget {
  String frase;
  int? resultado;
  int recomendado;

  CardEjerciseFrequency({required this.frase, required this.recomendado});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Calorias diarias recomendables',
                  style: TextStyle(fontSize: 15),
                ),

                content: Text(
                  recomendado.toString(),
                  style: TextStyle(fontSize: 30),
                ), //Meter resultado
                actions: <Widget>[
                  TextButton(
                    child: Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: ListTile(
          title: Text(frase),
        ),
      ),
    );
  }
}

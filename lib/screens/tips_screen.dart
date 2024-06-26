import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym/screens/menu_screen.dart';
import 'package:gym/screens/tips/suplements/protein_tips_screen.dart';
import 'package:gym/screens/tips/suplements/creatine_tips_screen.dart';
import 'package:gym/screens/tips/suplements/shark_cartilage_tips_screen.dart';
import 'package:gym/screens/tips/trainings/strenght_training_tips_screen.dart';
import 'package:gym/screens/tips/trainings/resistance_training_tips_screen.dart';
import 'package:gym/screens/tips/trainings/flexibility_training_tips_screen.dart';
import 'package:gym/screens/tips/suplements/aminoacids_tips_screen.dart';
import 'package:gym/screens/tips/general_tips_screen.dart';
import 'package:marquee/marquee.dart';

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TipsGeneralScreen(),
                SizedBox(height: 40),
                Text(
                  'Suplementación',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                SuplementsScreenBar(),
                SizedBox(height: 5),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 30),
                Text(
                  'Entrenamiento',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                TrainingsScreenBar(),
                Container(
                  height: 20,
                  child: Marquee(
                    text:
                        '¡ Estos consejos nunca deben ser tomados como una verdad absoluta, siempre consulta con un profesional !',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 30.0,
                    velocity: 70.0,
                    pauseAfterRound: Duration(seconds: 1),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MenuScreen(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, 'entrenamiento');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, 'administrar');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, 'configuracion');
              break;
          }
        },
        index: 2,
      ),
    );
  }
}

class TipsGeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GeneralTipsScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 170,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/gym.gif'),
                        image:
                            AssetImage('assets/tips/general_tips_portrait.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8.0,
                    top: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tips generales',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class SuplementsScreenBar extends StatelessWidget {
  List<String> suplementos = [
    "Proteina",
    "Creatina",
    "Cartilago de tiburon",
    "Aminoácidos"
  ];
  List<String> suplementos_imagenes = [
    "protein.jpg",
    "creatine.jpg",
    "shark_cartilage.jpg",
    "aminoacids.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    // Poner este container en un ListView.builder para que se repita 2 veces y no de error de overflow
    return Container(
      height: 170,
      child: ListView.builder(
          itemCount: suplementos.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProteinTipsScreen()),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatineTipsScreen()),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SharkCartilageTipsScreen()),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AminoacidsTipsScreen()),
                        );
                        break;
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/tips/${suplementos_imagenes[index]}'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
                SizedBox(
                    width: 10), // Add some space between the card and the text
                Text(suplementos[index], style: TextStyle(fontSize: 20)),
              ],
            );
          }),
    );
  }
}

class TrainingsScreenBar extends StatelessWidget {
  List<String> trainings = ["Fuerza", "Resistencia", "Flexibilidad"];
  List<String> trainings_imagenes = [
    "strength_training.jpg",
    "resistance_training.jpg",
    "elasticity_training.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StrengthTrainingTipsScreen()),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResistanceTrainingTipsScreen()),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FlexibilityTrainingTipsScreen()),
                        );
                        break;
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 75,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/tips/${trainings_imagenes[index]}'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 10), // Add some space between the card and the text
                Text(trainings[index], style: TextStyle(fontSize: 20)),
              ],
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym/screens/tips/tips_text.dart';

class StrengthTrainingTipsScreen extends StatelessWidget {
  var pObj;

  @override
  Widget build(BuildContext context) {
    pObj = TipsText().getTrainings()[1] as Map? ?? {};

    return Scaffold(
        appBar: AppBar(
          title: Text('Consejos para entrenamiento de fuerza'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/tips/str.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Change this to height
                  Text(
                    pObj["Parrafo 1"].toString(),
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    pObj["Parrafo 2"].toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

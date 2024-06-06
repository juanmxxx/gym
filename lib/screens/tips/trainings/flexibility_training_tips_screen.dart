import 'package:flutter/material.dart';
import 'package:gym/screens/tips/tips_text.dart';

class FlexibilityTrainingTipsScreen extends StatelessWidget {
  var pObj;

  @override
  Widget build(BuildContext context) {
    pObj = TipsText().getTrainings()[2] as Map? ?? {};

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
                AspectRatio(
                  aspectRatio:
                      16 / 10, // Adjust this value to change the aspect ratio
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/tips/flexibility_training_portrait.jpg'),
                        fit: BoxFit.fill,
                      ),
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
      ),
    );
  }
}

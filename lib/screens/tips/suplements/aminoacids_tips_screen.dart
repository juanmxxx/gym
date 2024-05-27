import 'package:flutter/material.dart';
import 'package:gym/screens/tips/tips_text.dart';

class AminoacidsTipsScreen extends StatelessWidget {
  var pObj;
  @override
  Widget build(BuildContext context) {
    pObj = TipsText().getSuplements()[3] as Map? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Tips para aminoacidos'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              // Change this to Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/tips/aminoacidos_portrait_tips.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Change this to height
                Text(
                  pObj["Sustancia"].toString(),
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  pObj["Obtencion"].toString(),
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 30),
                Text(
                  pObj["Funcion"].toString(),
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 30),
                Text(
                  pObj["Ventajas"].toString(),
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 30),
                Text(
                  pObj["Moraleja"].toString(),
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

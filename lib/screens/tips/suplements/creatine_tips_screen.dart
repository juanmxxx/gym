import 'package:flutter/material.dart';
import 'package:gym/screens/tips/tips_text.dart';

class CreatineTipsScreen extends StatelessWidget {
  var pObj;
  @override
  Widget build(BuildContext context) {
    pObj = TipsText().getSuplements()[1] as Map? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Tips para creatina en polvo'),
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
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/tips/creatine_portrait.jpg'),
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

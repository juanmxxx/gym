import 'package:flutter/material.dart';
import 'package:gym/screens/tips/tips_text.dart';

class GeneralTipsScreen extends StatelessWidget {
  var pObj;
  @override
  Widget build(BuildContext context) {
    pObj = TipsText().getGeneralTips()[0] as Map? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Tips generales'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              // Change this to Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio:
                      16 / 8.5, // Adjust this value to change the aspect ratio
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/tips/YouAreNumeroUnoGuidance.png'),
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
                SizedBox(height: 30),
                Text(
                  pObj["Parrafo 3"].toString(),
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 30),
                Text(
                  pObj["Parrafo 4"].toString(),
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 30),
                Text(
                  pObj["Parrafo 5"].toString(),
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

import 'package:flutter/material.dart';
import 'package:gym/screens/tips/tips_text.dart';

class SharkCartilageTipsScreen extends StatelessWidget {
  var pObj;

  @override
  Widget build(BuildContext context) {
    pObj = TipsText().getSuplements()[2] as Map? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Cartilago de tiburón'),
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
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/tips/shark_cartilage_portrait_tips.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildExpansionTile('Sustancia', pObj["Sustancia"].toString()),
                _buildExpansionTile('Obtención', pObj["Obtencion"].toString()),
                _buildExpansionTile('Función', pObj["Funcion"].toString()),
                _buildExpansionTile('Ventajas', pObj["Ventajas"].toString()),
                _buildExpansionTile('Moraleja', pObj["Moraleja"].toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      children: <Widget>[
        ListTile(
          title: Text(content, style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

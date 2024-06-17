import 'package:flutter/material.dart';
import 'package:gym/screens/tips/tips_text.dart';

class AminoacidsTipsScreen extends StatefulWidget {
  @override
  _AminoacidsTipsScreenState createState() => _AminoacidsTipsScreenState();
}

class _AminoacidsTipsScreenState extends State<AminoacidsTipsScreen> {
  late final List<Map> supplements;

  @override
  void initState() {
    super.initState();
    supplements = TipsText().getSuplements().cast<Map>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aminoacidos'),
      ),
      body: PageView.builder(
        itemCount: supplements.length,
        itemBuilder: (context, index) {
          var pObj = TipsText().getSuplements()[3] as Map? ?? {};
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/tips/aminoacidos_portrait_tips.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildExpansionTile(
                        'Sustancia', pObj["Sustancia"].toString()),
                    _buildExpansionTile(
                        'Obtención', pObj["Obtencion"].toString()),
                    _buildExpansionTile('Función', pObj["Funcion"].toString()),
                    _buildExpansionTile(
                        'Ventajas', pObj["Ventajas"].toString()),
                    _buildExpansionTile(
                        'Moraleja', pObj["Moraleja"].toString()),
                  ],
                ),
              ),
            ),
          );
        },
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

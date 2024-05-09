import 'package:flutter/material.dart';
import 'package:gym/screens/menu_screen.dart';

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TipsGeneralScreen(),
              SizedBox(height: 50),
              SuplementsScreenBar(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MenuScreen(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, 'entrenamiento');
              break;
            case 1:
              Navigator.pushNamed(context, 'administrar');
              break;
            case 3:
              Navigator.pushNamed(context, 'configuracion');
              break;
          }
        },
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
      child: Container(
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  placeholder: AssetImage('assets/gym.gif'),
                  image: AssetImage('assets/tips/general_tips_portrait.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Tips generales',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class SuplementsScreenBar extends StatelessWidget {
  List<String> suplementos = ["Proteinas", "Creatina", "Cartilago de tiburon"];
  List<String> suplementos_imagenes = [
    "protein.jpg",
    "creatine.jpg",
    "shark_cartilage.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    // Poner este container en un ListView.builder para que se repita 2 veces y no de error de overflow
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/tips/${suplementos_imagenes[index]}'))),
                  ),
                ),
                SizedBox(
                    width: 10), // Add some space between the card and the text
                Text(suplementos[index],
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ],
            );
          }),
    );
  }
}

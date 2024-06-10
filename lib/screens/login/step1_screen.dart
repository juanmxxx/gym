import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/round_button.dart';
import 'step2_screen.dart';

class Step1View extends StatefulWidget {
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  TextEditingController nombre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.white,
          centerTitle: true,
          title: Text(
            "Paso 1 de 2",
            style: TextStyle(
                color: TColor.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height:
                      30), // Add some space between the AppBar and the Image
              Image.asset(
                "assets/step_1.png",
                width: media.width * 0.6,
                height: media.width * 0.6,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Le damos la bienvenida a \nYou Are Numero Uno",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "El agua es esencial durante el entrenamiento, al igual que llevar ropa comoda y buen calzado\n pero no menos importante un control sobre tu entrenamiento. \n\n!A partir de ahora ya podras tenerlo todo!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Primero dinos tu nombre: ',
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                        width:
                            10), // Add some space between the Text and TextField
                    Expanded(
                      child: TextField(
                          keyboardType: TextInputType.name,
                          controller: nombre,
                          decoration:
                              InputDecoration(border: InputBorder.none)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: media.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2].map((pObj) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: 1 == pObj
                            ? TColor.primary
                            : TColor.gray.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ),
              // Add some space between the TextField and the Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: RoundButton(
                  title: "Siguiente",
                  onPressed: () {
                    RegExp regExp = new RegExp(r'^[^0-9]+$');
                    if (nombre.text.length > 3 &&
                        nombre.text.length < 16 &&
                        regExp.hasMatch(nombre.text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Step2View(
                                  nombre: nombre.text,
                                )),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'El nombre debe tener entre 4 y 15 caracteres. No se permiten números.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}

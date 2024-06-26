import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/round_button.dart';
import '../../screens/entrenamiento_screen.dart';
import 'package:gym/services/submit_to_local.dart';
import 'package:gym/models/parametros_personales.dart';

class Step2View extends StatefulWidget {
  final String nombre;

  const Step2View({required this.nombre});

  @override
  State<Step2View> createState() => _Step2ViewState(nombre: nombre);
}

class _Step2ViewState extends State<Step2View> {
  int? selectHeight;
  int? selectWeight;
  int? selectAge;
  bool isMale = true;
  bool asignado = false;
  String nombre;

  _Step2ViewState({required this.nombre});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    TextEditingController pesoCorporal = TextEditingController();
    TextEditingController altura = TextEditingController();
    TextEditingController edad = TextEditingController();
    ValueNotifier<bool> isMaleNotifier = ValueNotifier<bool>(true);

    if (asignado) {
      pesoCorporal.text = selectWeight.toString();
      altura.text = selectHeight.toString();
      edad.text = selectAge.toString();
    }

    void setPesoCorporal(int peso) {
      selectWeight = peso;
    }

    void setAltura(int altura) {
      selectHeight = altura;
    }

    void setEdad(int edad) {
      selectAge = edad;
    }

    void updateParameters() {
      if (pesoCorporal.text.isEmpty ||
          altura.text.isEmpty ||
          edad.text.isEmpty) {
        return;
      }

      try {
        if (selectWeight == null ||
            pesoCorporal.text != selectWeight.toString()) {
          setPesoCorporal(int.parse(pesoCorporal.text));
        }

        if (selectHeight == null || altura.text != selectHeight.toString()) {
          setAltura(int.parse(altura.text));
        }

        if (selectAge == null || edad.text != selectAge.toString()) {
          setEdad(int.parse(edad.text));
        }
      } catch (e) {
        // Handle the exception, e.g., show an error message
        print('Error: ${e.toString()}');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/back.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Paso 2 de 2",
          style: TextStyle(
              color: TColor.primary, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Detalles personales",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Estos detalles seran importantes para poder personalizar su dieta y tener un mejor control de su progreso",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.secondaryText, fontSize: 16),
              ),
            ),
            SizedBox(
              height: media.width * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: media.width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'Peso o masa corporal (kg):',
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
                                keyboardType: TextInputType.number,
                                controller: pesoCorporal,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                        ],
                      ),
                      Divider(color: TColor.divider, height: 1),
                      Row(
                        children: [
                          Text(
                            'Altura (cm):',
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                                keyboardType: TextInputType.number,
                                controller: altura,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                        ],
                      ),
                      Divider(color: TColor.divider, height: 1),
                      Row(
                        children: [
                          Text(
                            'Edad (años):',
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                                keyboardType: TextInputType.number,
                                controller: edad,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: TColor.divider, height: 1),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: media.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sexo",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: isMaleNotifier,
                          builder: (context, isMaleValue, child) {
                            return CupertinoSegmentedControl<bool>(
                              groupValue: isMaleValue,
                              selectedColor: TColor.primary,
                              unselectedColor: TColor.white,
                              borderColor: TColor.primary,
                              children: const {
                                true: Text(" Hombre ",
                                    style: TextStyle(fontSize: 18)),
                                false: Text(" Mujer ",
                                    style: TextStyle(fontSize: 18)),
                              },
                              onValueChanged: (isMaleVal) {
                                isMaleNotifier.value =
                                    isMaleVal; // This will automatically update the UI
                                isMale =
                                    isMaleVal; // Update the isMale variable to reflect the new value
                                asignado = true;
                              },
                              padding: EdgeInsets.zero,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: media.width * 0.6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2].map((pObj) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: 2 == pObj
                          ? TColor.primary
                          : TColor.gray.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6)),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: RoundButton(
                title: "Comenzemos!",
                onPressed: () {
                  // First, parse the inputs to ensure they are in the correct format for comparison
                  double peso = double.tryParse(pesoCorporal.text) ??
                      -1; // Default to -1 if parsing fails
                  double _altura = double.tryParse(altura.text) ?? -1;
                  int _edad = int.tryParse(edad.text) ?? -1;

                  // Check if any of the parameters is less than 0
                  if (peso <= 0 ||
                      _altura <= 0 ||
                      _edad <= 0 ||
                      _edad > 140 ||
                      _altura > 250 ||
                      peso > 500) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'Los parámetros personales no pueden ser negativos o exagerados'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return; // Stop execution if any parameter is invalid
                  }

                  // Existing logic if all parameters are valid
                  updateParameters(); // Call updateParameters here
                  ParametrosPersonales parametrosPersonales =
                      ParametrosPersonales(
                          nombre: nombre,
                          peso: peso,
                          altura: _altura,
                          edad: _edad,
                          sexo: isMale ? 1 : 0);

                  SubmitToLocalParametros(parametros: parametrosPersonales);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EntrenamientoScreen()),
                      (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(),
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
              Text(
                "El agua es esencial durante el entrenamiento, al igual que llevar ropa comoda y buen calzado\n pero no menos importante un control sobre tu entrenamiento. \n\n!A partir de ahora ya podras tenerlo todo!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              const Spacer(),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: RoundButton(
                  title: "Siguiente",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Step2View()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

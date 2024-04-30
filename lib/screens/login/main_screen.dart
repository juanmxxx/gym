import 'package:flutter/material.dart';
import 'package:gym/common/color_extension.dart';
import 'package:gym/common_widgets/round_button.dart';
import 'package:gym/screens/login/step1_screen.dart';

class MainLoginScreen extends StatefulWidget {
  @override
  _MainLoginScreenState createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  PageController? controller = PageController();
  int selectPage = 0;

  List pageArray = [
    {
      "title": "You Are Numero Uno",
      "subtitle":
          "La salud y el orden lo es TODO. \nAqui estamos para ayudarte a lograrlo.",
      "image": "assets/on_board_1.png"
    },
    {
      "title": "Fuerza, volumen y salud",
      "subtitle":
          "Organiza rutinas, ejercicios y mucho mas. \nTodo en un solo lugar.",
      "image": "assets/on_board_2.png"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/on_board_bg.png",
          fit: BoxFit.cover,
          width: media.width,
          height: media.height,
        ),
        SafeArea(
            child: PageView.builder(
                itemCount: pageArray.length,
                itemBuilder: (context, index) {
                  var pObj = pageArray[index] as Map? ?? {};
                  return Column(
                    children: [
                      Text(
                        pObj["title"].toString(),
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.25,
                      ),
                      Image.asset(
                        pObj["image"].toString(),
                        width: media.width * 0.8,
                        height: media.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: media.width * 0.3,
                      ),
                      Text(
                        pObj["subtitle"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: TColor.white, fontSize: 14),
                      ),
                    ],
                  );
                })),
        SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageArray.map((pObj) {
                  var index = pageArray.indexOf(pObj);
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: selectPage == index
                            ? TColor.white
                            : TColor.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: RoundButton(
                  title: "Adelante!",
                  type: RoundButtonType.primaryText,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Step1View()),
                        (route) => false);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

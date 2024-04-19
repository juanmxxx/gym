import 'package:flutter/material.dart';
import 'package:gym/screens/screens.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class EntrenamientoScreen extends StatefulWidget {
  @override
  _EntrenamientoScreenState createState() => _EntrenamientoScreenState();
}

class _EntrenamientoScreenState extends State<EntrenamientoScreen> {
  bool isCreated = false;

  @override
  void initState() {
    super.initState();
    createFile();
    isCreated = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrenamiento-Workout Semanal'),
      ),
      body: Center(),
      bottomNavigationBar: MenuScreen(onTap: (index) {
        switch (index) {
          case 1:
            Navigator.pushNamed(context, 'administrar');
            break;
          case 2:
            Navigator.pushNamed(context, 'ayuda');
            break;
          case 3:
            Navigator.pushNamed(context, 'configuracion');
            break;
        }
      }),
    );
  }

  Future<void> createFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/routine.txt';
    final file = File(filePath);

    // Check if the file exists
    bool fileExists = await file.exists();

    if (fileExists) {
      await file.writeAsString('Hello, world!');
      // Read the file
      String contents = await file.readAsString();
      print('File contents: $contents');
    } else {
      print('File does not exist');
    }
  }
}

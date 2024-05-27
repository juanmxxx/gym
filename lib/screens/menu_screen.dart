import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final Function(int) onTap;
  int index;

  MenuScreen({required this.onTap, required this.index});

  @override
  _MenuScreenState createState() => _MenuScreenState(index: index);
}

class _MenuScreenState extends State<MenuScreen> {
  int index;

  _MenuScreenState({required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      unselectedItemColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey
          : Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Entrenamiento',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports),
          label: 'Administrar',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.bubble_chart), label: 'Tips'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mi perfil',
        ),
      ],
      onTap: (index) {
        setState(() {
          widget.onTap(index);
        });
      },
      currentIndex: index,
    );
  }
}

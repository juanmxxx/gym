import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final Function(int) onTap;

  MenuScreen({required this.onTap});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Entrenamiento',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.model_training),
          label: 'Administrar',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.bubble_chart), label: 'Tips'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mi perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTap(index);
      },
      selectedItemColor: Colors.black, // color of the selected item
      unselectedItemColor: Colors.grey,
    );
  }
}

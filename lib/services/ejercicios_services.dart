import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:gym/models/ejercicio.dart';

class EjerciciosServices extends ChangeNotifier {
  final String _baseURL =
      'gym-tfg-default-rtdb.europe-west1.firebasedatabase.app';

  final List<Ejercicio> _ejercicios = [];
  Ejercicio? _selectedEjercicio;
  bool _isLoading = true;

  EjerciciosServices() {
    loadEjercicios();
  }
  // Ahora esto no fufa
  Future<List<Ejercicio>> loadEjercicios() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'ejercicios.json');
    final response = await https.get(url);
    final Map<String, dynamic> ejerciciosMap = json.decode(response.body);
    ejerciciosMap.forEach((key, value) {
      final tempEjercicio = Ejercicio.fromJson(value);

      _ejercicios.add(tempEjercicio);
    });
    notifyListeners();
    return _ejercicios;
  }

  List<Ejercicio> get ejercicios => _ejercicios;

  Ejercicio? get selectedEjercicio => _selectedEjercicio;

  set selectedEjercicio(Ejercicio? ejercicio) {
    _selectedEjercicio = ejercicio;
    notifyListeners();
  }
}

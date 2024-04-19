import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gym/models/models.dart';

class EjerciciosServices extends ChangeNotifier {
  final String _baseURL =
      'gym-tfg-default-rtdb.europe-west1.firebasedatabase.app';

  final List<EjercicioLocal> _ejercicios = [];
  bool _isLoading = true;

  EjerciciosServices() {
    this.loadEjercicios();
  }

  Future<List<EjercicioLocal>> loadEjercicios() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'ejercicios.json');
    final response = await http.get(url);

    final Map<String, dynamic> ejerciciosMap = json.decode(response.body);
    ejerciciosMap.forEach((key, value) {
      final tempEjercicio = EjercicioLocal.fromJson(value);
      tempEjercicio.id = key;

      _ejercicios.add(tempEjercicio);
    });

    //this._isLoading = false;
    notifyListeners();

    return this._ejercicios;
  }

  List<EjercicioLocal> get ejercicios => this._ejercicios;
}

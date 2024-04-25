import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio.dart';
import 'package:gym/local/database/database.dart';
import 'package:gym/models/ejercicio_local.dart';

class SubmitToLocal {
  final Ejercicio ejercicio;
  final int repeticiones;
  final int series;
  final int peso;
  final String diaSemana;
  late final DatabaseHelper db;

  SubmitToLocal(
      {required this.ejercicio,
      required this.repeticiones,
      required this.series,
      required this.peso,
      required this.diaSemana}) {
    WidgetsFlutterBinding.ensureInitialized();
    Future.microtask(() async {
      await initializeDatabase();
      await submitEjercicio();
    });
  }

  Future<void> initializeDatabase() async {
    db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
  }

  Future<void> submitEjercicio() async {
    print("Guardando ejercicio en la base de datos local");
    final ejercicioLocal = EjercicioLocal(
      imagen: ejercicio.imagen!,
      nombre: ejercicio.nombre,
      descripcion: ejercicio.descripcion,
      gifAyuda: ejercicio.gif_ayuda,
      tipo: ejercicio.tipo,
      repeticiones: repeticiones,
      series: series,
      peso: peso,
      dayOfWeek: diaSemana,
    );
    await db.ejercicioDao.insertEjercicio(ejercicioLocal);
  }
}

import 'package:flutter/material.dart';
import 'package:gym/models/ejercicio.dart';
import 'package:gym/local/database/database.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'package:gym/models/parametros_personales.dart';

class SubmitToLocalEjercise {
  final Ejercicio ejercicio;
  final int repeticiones;
  final int series;
  final int peso;
  final String diaSemana;
  late final DatabaseHelper db;

  SubmitToLocalEjercise(
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

class SubmitToLocalParametros {
  final ParametrosPersonales parametros;
  late final DatabaseHelper db;

  SubmitToLocalParametros({required this.parametros}) {
    WidgetsFlutterBinding.ensureInitialized();
    Future.microtask(() async {
      await initializeDatabase();
      await submitParametros();
    });
  }

  Future<void> initializeDatabase() async {
    db = await $FloorDatabaseHelper.databaseBuilder('database.db').build();
  }

  Future<void> submitParametros() async {
    print("Guardando parametros personales en la base de datos local");
    await db.parametrosPersonalesDao.insertParametros(parametros);
  }
}

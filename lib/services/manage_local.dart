import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:gym/local/database/database.dart';

class ManageLocal {
  Future<void> deleteEjercise(int id) async {
    DatabaseHelper ejer =
        await $FloorDatabaseHelper.databaseBuilder('database.db').build();

    await ejer.ejercicioDao.deleteEjercicioById(id);
  }
}

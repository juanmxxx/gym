import 'package:flutter/material.dart';
import 'package:gym/local/database/database.dart';

class ManageLocal {
  late final DatabaseHelper db;
  static ManageLocal? _instance;
  static DatabaseHelper? _database;

  factory ManageLocal() {
    _instance ??= ManageLocal._internal();
    return _instance!;
  }

  ManageLocal._internal() {
    WidgetsFlutterBinding.ensureInitialized();
    Future.microtask(() async {
      await initializeDatabase();
    });
  }

  Future<void> initializeDatabase() async {
    if (_database == null) {
      _database =
          await $FloorDatabaseHelper.databaseBuilder('database.db').build();
    }
    db = _database!;
  }

  Future<void> deleteEjercise(int id) async {
    await db.ejercicioDao.deleteEjercicioById(id);
  }
}

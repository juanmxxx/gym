import 'dart:async';
import 'package:gym/models/ejercicio_local.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:gym/local/dao/dao.dart';

part 'database_helper.g.dart';

@Database(version: 2, entities: [EjercicioLocal])
abstract class DatabaseHelper extends FloorDatabase {
  EjercicioDao get ejercicioDao;
}

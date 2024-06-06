import 'dart:async';
import 'package:gym/local/controller/parametros_personales_dao.dart';
import 'package:gym/models/ejercicio_local.dart';
import 'package:gym/models/medidas_musculares.dart';
import 'package:gym/models/parametros_personales.dart';
import 'package:gym/local/controller/medidas_musculares_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:gym/local/controller/dao.dart';

part 'database_helper.g.dart';

@Database(
    version: 3,
    entities: [EjercicioLocal, ParametrosPersonales, MedidasMusculares])
abstract class DatabaseHelper extends FloorDatabase {
  EjercicioDao get ejercicioDao;
  ParametrosPersonalesDao get parametrosPersonalesDao;
  MedidasMuscularesDao get medidasMuscularesDao;
}

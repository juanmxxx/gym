import 'package:floor/floor.dart';
import 'package:gym/models/ejercicio_local.dart';

@dao
abstract class EjercicioDao {
  @Query('SELECT * FROM Ejercicio')
  Future<List<EjercicioLocal>> readAll();

  @Query('SELECT COUNT(*) FROM Ejercicio')
  Future<int> getRowCount();

  @insert
  Future<int> insertEjercicio(EjercicioLocal ejercicio);

  @update
  Future<void> updateEjercicio(EjercicioLocal ejercicio);

  @delete
  Future<void> deleteEjercicio(EjercicioLocal ejercicio);

  @Query('DELETE FROM Ejercicio WHERE id = :id')
  Future<void> deleteEjercicioById(int id);
}

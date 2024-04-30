import 'package:floor/floor.dart';
import 'package:gym/models/parametros_personales.dart';

@dao
abstract class ParametrosPersonalesDao {
  @Query('SELECT * FROM ParametrosPersonales')
  Future<List<ParametrosPersonales>> readAll();

  @Query('SELECT * FROM ParametrosPersonales ORDER BY id ASC LIMIT 1')
  Future<ParametrosPersonales?> readFirst();

  @insert
  Future<int> insertParametros(ParametrosPersonales parametros);

  @update
  Future<void> updateParametros(ParametrosPersonales parametros);

  @delete
  Future<void> deleteParametros(ParametrosPersonales parametros);
}

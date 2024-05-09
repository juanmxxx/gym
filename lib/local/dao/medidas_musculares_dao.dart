import 'package:floor/floor.dart';
import 'package:gym/models/medidas_musculares.dart';

@dao
abstract class MedidasMuscularesDao {
  @Query('SELECT * FROM MedidasMusculares')
  Future<List<MedidasMusculares>> readAll();

  @Query('SELECT * FROM MedidasMusculares ORDER BY id ASC LIMIT 1')
  Future<MedidasMusculares?> readFirst();

  @Query('SELECT COUNT(*) FROM MedidasMusculares')
  Future<int?> getRowCount();

  @insert
  Future<int> insertMedidas(MedidasMusculares medidas);

  @update
  Future<void> updateMedidas(MedidasMusculares medidas);

  @delete
  Future<void> deleteMedidas(MedidasMusculares medidas);
}

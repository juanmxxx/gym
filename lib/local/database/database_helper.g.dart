// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_helper.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseHelper {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseHelperBuilder databaseBuilder(String name) =>
      _$DatabaseHelperBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseHelperBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseHelperBuilder(null);
}

class _$DatabaseHelperBuilder {
  _$DatabaseHelperBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseHelperBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseHelperBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseHelper> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseHelper();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseHelper extends DatabaseHelper {
  _$DatabaseHelper([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EjercicioDao? _ejercicioDaoInstance;
  ParametrosPersonalesDao? _parametrosPersonalesDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        //Meter otro create table con un await
        await database.execute(
          'CREATE TABLE IF NOT EXISTS `Ejercicio` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `image` TEXT NOT NULL, `reps` INTEGER NOT NULL, `sets` INTEGER NOT NULL, `weight` INTEGER NOT NULL, `dayOfWeek` TEXT NOT NULL, `type` TEXT NOT NULL, `gifhelp` TEXT NOT NULL)',
        );

        await database.execute(
          'CREATE TABLE IF NOT EXISTS `MedidasMusculares` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `brazo` DOUBLE, `pecho` DOUBLE, `cintura` DOUBLE, `torso` DOUBLE, `gemelos` DOUBLE, `antebrazo` DOUBLE, `abdominales` DOUBLE, `gluteos` DOUBLE)',
        );

        await database.execute(
          'CREATE TABLE IF NOT EXISTS `ParametrosPersonales` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `peso` INTEGER, `altura` INTEGER, `edad` INTEGER, `sexo` INTEGER, `medidasMuscularesId` INTEGER, FOREIGN KEY(`medidasMuscularesId`) REFERENCES `MedidasMusculares`(`id`))',
        );
        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EjercicioDao get ejercicioDao {
    return _ejercicioDaoInstance ??= _$EjerciseDao(database, changeListener);
  }

  @override
  ParametrosPersonalesDao get parametrosPersonalesDao {
    return _parametrosPersonalesDaoInstance ??=
        _$ParametrosPersonalesDao(database, changeListener);
  }

  @override
  MedidasMuscularesDao get medidasMuscularesDao {
    return _$MedidasMuscularesDao(database, changeListener);
  }
}

class _$MedidasMuscularesDao extends MedidasMuscularesDao {
  _$MedidasMuscularesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _medidasMuscularesInsertionAdapter = InsertionAdapter(
            database,
            'MedidasMusculares',
            (MedidasMusculares item) => <String, Object?>{
                  'id': item.id,
                  'brazo': item.brazo,
                  'pecho': item.pecho,
                  'cintura': item.cintura,
                  'torso': item.torso,
                  'gemelos': item.gemelos,
                  'antebrazo': item.antebrazo,
                  'abdominales': item.abdominales,
                  'gluteos': item.gluteos
                }),
        _medidasMuscularesUpdateAdapter = UpdateAdapter(
            database,
            'MedidasMusculares',
            ['id'],
            (MedidasMusculares item) => <String, Object?>{
                  'id': item.id,
                  'brazo': item.brazo,
                  'pecho': item.pecho,
                  'cintura': item.cintura,
                  'torso': item.torso,
                  'gemelos': item.gemelos,
                  'antebrazo': item.antebrazo,
                  'abdominales': item.abdominales,
                  'gluteos': item.gluteos
                }),
        _medidasMuscularesDeletionAdapter = DeletionAdapter(
            database,
            'MedidasMusculares',
            ['id'],
            (MedidasMusculares item) => <String, Object?>{
                  'id': item.id,
                  'brazo': item.brazo,
                  'pecho': item.pecho,
                  'cintura': item.cintura,
                  'torso': item.torso,
                  'gemelos': item.gemelos,
                  'antebrazo': item.antebrazo,
                  'abdominales': item.abdominales,
                  'gluteos': item.gluteos
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MedidasMusculares> _medidasMuscularesInsertionAdapter;

  final UpdateAdapter<MedidasMusculares> _medidasMuscularesUpdateAdapter;

  final DeletionAdapter<MedidasMusculares> _medidasMuscularesDeletionAdapter;

  @override
  Future<List<MedidasMusculares>> readAll() async {
    return _queryAdapter.queryList('SELECT * FROM MedidasMusculares',
        mapper: (Map<String, Object?> row) => MedidasMusculares(
            id: row['id'] as int?,
            brazo: row['brazo'] as double,
            pecho: row['pecho'] as double,
            cintura: row['cintura'] as double,
            torso: row['torso'] as double,
            gemelos: row['gemelos'] as double,
            antebrazo: row['antebrazo'] as double,
            abdominales: row['abdominales'] as double,
            gluteos: row['gluteos'] as double));
  }

  @override
  Future<MedidasMusculares?> readFirst() async {
    return _queryAdapter.query(
        'SELECT * FROM MedidasMusculares ORDER BY id ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => MedidasMusculares(
            id: row['id'] as int?,
            brazo: row['brazo'] as double,
            pecho: row['pecho'] as double,
            cintura: row['cintura'] as double,
            torso: row['torso'] as double,
            gemelos: row['gemelos'] as double,
            antebrazo: row['antebrazo'] as double,
            abdominales: row['abdominales'] as double,
            gluteos: row['gluteos'] as double));
  }

  Future<int?> getRowCount() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM MedidasMusculares',
        mapper: (Map<String, Object?> row) => row['COUNT(*)'] as int);
  }

  @override
  Future<int> insertMedidas(MedidasMusculares medidas) {
    return _medidasMuscularesInsertionAdapter.insertAndReturnId(
        medidas, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMedidas(MedidasMusculares medidas) async {
    await _medidasMuscularesUpdateAdapter.update(
        medidas, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMedidas(MedidasMusculares medidas) async {
    await _medidasMuscularesDeletionAdapter.delete(medidas);
  }
}

class _$ParametrosPersonalesDao extends ParametrosPersonalesDao {
  _$ParametrosPersonalesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _parametrosPersonalesInsertionAdapter = InsertionAdapter(
            database,
            'ParametrosPersonales',
            (ParametrosPersonales item) => <String, Object?>{
                  'id': item.id,
                  'peso': item.peso,
                  'edad': item.edad,
                  'altura': item.altura,
                  'sexo': item.sexo,
                  'medidasMuscularesId': item.idMedidasMusculares
                }),
        _parametrosPersonalesUpdateAdapter = UpdateAdapter(
            database,
            'ParametrosPersonales',
            ['id'],
            (ParametrosPersonales item) => <String, Object?>{
                  'id': item.id,
                  'peso': item.peso,
                  'edad': item.edad,
                  'altura': item.altura,
                  'sexo': item.sexo,
                  'medidasMuscularesId': item.idMedidasMusculares
                }),
        _parametrosPersonalesDeletionAdapter = DeletionAdapter(
            database,
            'ParametrosPersonales',
            ['id'],
            (ParametrosPersonales item) => <String, Object?>{
                  'id': item.id,
                  'peso': item.peso,
                  'edad': item.edad,
                  'altura': item.altura,
                  'sexo': item.sexo,
                  'medidasMuscularesId': item.idMedidasMusculares
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ParametrosPersonales>
      _parametrosPersonalesInsertionAdapter;

  final UpdateAdapter<ParametrosPersonales> _parametrosPersonalesUpdateAdapter;

  final DeletionAdapter<ParametrosPersonales>
      _parametrosPersonalesDeletionAdapter;

  @override
  Future<List<ParametrosPersonales>> readAll() async {
    return _queryAdapter.queryList('SELECT * FROM ParametrosPersonales',
        mapper: (Map<String, Object?> row) => ParametrosPersonales(
            id: row['id'] as int?,
            peso: row['peso'] as int,
            edad: row['edad'] as int,
            altura: row['altura'] as int,
            sexo: row['sexo'] as int,
            idMedidasMusculares: row['medidasMuscularesId'] as int?));
  }

  @override
  Future<ParametrosPersonales?> readFirst() async {
    return _queryAdapter.query(
        'SELECT * FROM ParametrosPersonales ORDER BY id ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => ParametrosPersonales(
            id: row['id'] as int?,
            peso: row['peso'] as int,
            edad: row['edad'] as int,
            altura: row['altura'] as int,
            sexo: row['sexo'] as int,
            idMedidasMusculares: row['medidasMuscularesId'] as int?));
  }

  @override
  Future<int> insertParametros(ParametrosPersonales parametros) {
    return _parametrosPersonalesInsertionAdapter.insertAndReturnId(
        parametros, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateParametros(ParametrosPersonales parametros) async {
    await _parametrosPersonalesUpdateAdapter.update(
        parametros, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteParametros(ParametrosPersonales parametros) async {
    await _parametrosPersonalesDeletionAdapter.delete(parametros);
  }

  @override
  Future<int> getRowCount() async {
    final result = await _queryAdapter.query(
        'SELECT COUNT(*) FROM ParametrosPersonales',
        mapper: (Map<String, Object?> row) => row['COUNT(*)'] as int?);
    return result ?? 0;
  }
}

class _$EjerciseDao extends EjercicioDao {
  _$EjerciseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _ejercicioInsertionAdapter = InsertionAdapter(
            database,
            'Ejercicio',
            (EjercicioLocal item) => <String, Object?>{
                  'id': item.id,
                  'name': item.nombre,
                  'description': item.descripcion,
                  'image': item.imagen,
                  'reps': item.repeticiones,
                  'sets': item.series,
                  'weight': item.peso,
                  'dayOfWeek': item.dayOfWeek,
                  'type': item.tipo,
                  'gifhelp': item.gifAyuda
                }),
        _ejercicioUpdateAdapter = UpdateAdapter(
            database,
            'Ejercicio',
            ['id'],
            (EjercicioLocal item) => <String, Object?>{
                  'id': item.id,
                  'name': item.nombre,
                  'description': item.descripcion,
                  'image': item.imagen,
                  'reps': item.repeticiones,
                  'sets': item.series,
                  'weight': item.peso,
                  'dayOfWeek': item.dayOfWeek,
                  'type': item.tipo,
                  'gifhelp': item.gifAyuda
                }),
        _ejercicioDeletionAdapter = DeletionAdapter(
            database,
            'Ejercicio',
            ['id'],
            (EjercicioLocal item) => <String, Object?>{
                  'id': item.id,
                  'name': item.nombre,
                  'description': item.descripcion,
                  'image': item.imagen,
                  'reps': item.repeticiones,
                  'sets': item.series,
                  'weight': item.peso,
                  'dayOfWeek': item.dayOfWeek,
                  'type': item.tipo,
                  'gifhelp': item.gifAyuda
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EjercicioLocal> _ejercicioInsertionAdapter;

  final UpdateAdapter<EjercicioLocal> _ejercicioUpdateAdapter;

  final DeletionAdapter<EjercicioLocal> _ejercicioDeletionAdapter;

  @override
  Future<List<EjercicioLocal>> readAll() async {
    return _queryAdapter.queryList('SELECT * FROM Ejercicio',
        mapper: (Map<String, Object?> row) => EjercicioLocal(
            id: row['id'] as int?,
            nombre: row['name'] as String,
            descripcion: row['description'] as String,
            imagen: row['image'] as String,
            dayOfWeek: row['dayOfWeek'] as String,
            peso: row['weight'] as int,
            repeticiones: row['reps'] as int,
            series: row['sets'] as int,
            gifAyuda: row['gifhelp'] as String,
            tipo: row['type'] as String));
  }

  @override
  Future<int> insertEjercicio(EjercicioLocal ejercicio) {
    return _ejercicioInsertionAdapter.insertAndReturnId(
        ejercicio, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateEjercicio(EjercicioLocal ejercicio) async {
    await _ejercicioUpdateAdapter.update(ejercicio, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteEjercicio(EjercicioLocal ejercicio) async {
    await _ejercicioDeletionAdapter.delete(ejercicio);
  }

  @override
  Future<int> getRowCount() async {
    final result = await _queryAdapter.query('SELECT COUNT(*) FROM Ejercicio',
        mapper: (Map<String, Object?> row) => row['COUNT(*)'] as int?);
    return result ?? 0;
  }
}

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

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EjercicioDao get ejercicioDao {
    return _ejercicioDaoInstance ??= _$EjerciseDao(database, changeListener);
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
}

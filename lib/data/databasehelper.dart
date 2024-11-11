import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "UserDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'users';

  static final columnId = '_id';
  static final columnFullName = 'name';
  static final columnEmail = 'email';
  static final columnCNIC = 'cnic';
  static final columnPhone = 'phone';
  static final columnPassword = 'password';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnFullName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL UNIQUE,
            $columnCNIC TEXT NOT NULL,
            $columnPhone TEXT NOT NULL,
            $columnPassword TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<Map<String, dynamic>?> getUser(String email) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query(table, where: "$columnEmail = ?", whereArgs: [email]);
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<int> updateUser(String email, Map<String, dynamic> values) async {
    final db = await database;
    return await db.update(
      'users',
      values,
      where: 'email = ?',
      whereArgs: [email],
    );
  }
}
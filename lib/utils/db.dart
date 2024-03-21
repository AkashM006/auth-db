import 'package:auth/db/database.dart';

class AppDb {
  static AppDatabase? _db;

  static void init() {
    _db = AppDatabase();
  }

  static AppDatabase? get database {
    _db ??= AppDatabase();
    return _db;
  }

  static void close() {
    _db?.close();
    _db = null;
  }
}

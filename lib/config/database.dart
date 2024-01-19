import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
  Database? db;
  Future<void> open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''create table if not exists categories(
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
                title varchar(50) not null,
                active boolean default true,
                unique(title)
        )''');
      },
    );
  }
}

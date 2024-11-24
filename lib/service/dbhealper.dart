import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hopeflow/service/user.dart';

class Dbhealper {
  late Database _database;
  Dbhealper() {
    openDb();
  }
  Future<void> openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "User.db"),
        version: 1, onCreate: (Database db, int version) {
      db.execute(
          "create table usertable(id integer PRIMARY KEY AUTOINCREMENT,name TEXT,ph TEXT,age TEXT,blood TEXT,gender TEXT,donated TEXT,weight TEXT)");
    });
  }

  Future<int?> insertuser(User user) async {
    await openDb();
    return await _database.insert("usertable", user.toMap());
  }

  Future<int?> Updateuser(User user) async {
    await openDb();
    return await _database
        .update("usertable", user.toMap(), where: "id=?", whereArgs: [user.id]);
  }

  Future<int?> deleteuser(User user) async {
    await openDb();
    return await _database
        .delete("usertable", where: "id=?", whereArgs: [user.id]);
  }

  Future<List<User>?> getall() async {
    await openDb();
    List<Map<String, dynamic>> map = await _database.query("usertable");
    return List.generate(map.length, (i) {
      return User(
          id: map[i]["id"].toString(),
          name: map[i]["name"],
          ph: map[i]["ph"],
          age: map[i]["age"],
          blood: map[i]["blood"],
          gender: map[i]["gender"],
          donated: map[i]["donated"],
          weight: map[i]["weight"]);
    });
  }
}

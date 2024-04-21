import 'package:dj_app/model/model_hospital_sqlite.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class HospitalNameHandler {
  Future<Database> initiallizeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      p.join(path, 'hospitalName.db'),
      onCreate: (db, version) async {
        await db.execute(
            'create table hospitalName (seq integer primary key autoincrement, dutyName text)');
      },
      version: 1,
    );
  }

  // SQLite에서 mustgo table의 데이터를 가져옴
  Future<List<ModelHospitalSqlite>> queryHospitalName() async {
    final Database db = await initiallizeDB();
    // C언어로 되어있어서 Object로 받아와야 함
    final List<Map<String, Object?>> queryResults =
        await db.rawQuery('select * from hospitalName');
    return queryResults.map((e) => ModelHospitalSqlite.fromMap(e)).toList();
  }

  // SQLite의 mustgo table에 data를 insert
  Future<int> insertHospitalName(ModelHospitalSqlite hospitalName) async {
    int result = 0;
    final Database db = await initiallizeDB();
    result = await db.rawInsert(
      'insert into hospitalName (dutyName) values (?)',
      [
        hospitalName.dutyName,
      ],
    );
    return result;
  }


  // SQLite의 mustgo table중 seq를 조건으로 data를 delete
  Future<void> deleteHospitalName(int seq) async {
    final Database db = await initiallizeDB();
    await db.rawDelete(
      'delete from hospitalName where seq=?',
      [seq],
    );
  }
}

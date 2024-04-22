import 'package:dj_app/model/model_diagnosis.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initalizeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'dangjin.db'),
      onCreate: (db, version) async{
        await db.execute(
          'CREAT TABLE dangjin '
          '(seq integer primary key autoincrement,'
          'alcohol numeric(10),'
          'consent numeric(10),'
          'fruit numeric(10),'
          'genhlth numeric(10),'
          'heart numeric(10),'
          'highBp numeric(10),'
          'initdate date'
        );
      },
      version: 1,
    );
  }

  Future<int> insertDiagnosis(Diagnosis diagnosis) async {
    final Database db = await initalizeDB();
    int result;
    result = await db.rawInsert(
      'INSERT INTO dangjin '
      '(alcohol,consent,fruit,genhlth,heart,highBp,initdate) '
      'VALUES (?,?,?,?,?,?,?)',
      [diagnosis.alcohol, diagnosis.consent, diagnosis.fruit, diagnosis.genhlth, diagnosis.heart, diagnosis.highBp, diagnosis.initdate]
    );
    return result;
  }




}
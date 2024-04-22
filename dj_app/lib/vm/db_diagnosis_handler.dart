import 'package:dj_app/model/model_diagnosis.dart';
import 'package:dj_app/model/model_dignosis_result.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initalizeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'dangjin.db'),
      onCreate: (db, version) async{
        await db.execute(
          'CREATE TABLE dangjin '
          '(seq integer primary key autoincrement,'
          'email TEXT(30),'
          'alcohol numeric(10),'
          'consent numeric(10),'
          'fruit numeric(10),'
          'genhlth numeric(10),'
          'heart numeric(10),'
          'highBp numeric(10),'
          'result numeric(100),'
          'initdate date)'
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
      '(email, alcohol, consent, fruit, genhlth, heart, highBp, result, initdate) '
      'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [diagnosis.email, diagnosis.alcohol, diagnosis.consent, diagnosis.fruit, diagnosis.genhlth, diagnosis.heart, diagnosis.highBp, diagnosis.result, diagnosis.initdate]
    );
    return result;
  }

  Future<List<DiagnosisResult>> queryDiagnosis(email) async{
    final Database db = await initalizeDB();
    final List<Map<String, Object?>> queryResult 
      = await db.rawQuery('select * from dangjin where email = ?',
      [email]);
    // 맵 형식인 result를 List로 변환하여 card로 사용한다.
    return queryResult.map((e) => DiagnosisResult.fromMap(e)).toList();
  }




}
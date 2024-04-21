class ModelHospitalSqlite {
  // --- Field ---
  int? seq;
  String dutyName;

  // Constructor
  ModelHospitalSqlite({
    this.seq,
    required this.dutyName,
  });

  // Factory
  ModelHospitalSqlite.fromMap(Map<String, dynamic> res) // 컬럼명, data형식
      : seq = res['seq'],
        dutyName = res['dutyName'];

}

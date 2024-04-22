class Diagnosis{
  int? seq;
  int? alcohol;
  int? consent;
  int? fruit;
  int? genhlth;
  int? heart;
  int? highBp;
  String initdate;
  String? result;

Diagnosis ({
  this.seq,
  this.result,
  required this.alcohol,
  required this.consent,
  required this.fruit,
  required this.genhlth,
  required this.heart,
  required this.highBp,
  required this.initdate

});

Diagnosis.fromMap(Map<String, dynamic> res)
  : seq = res['seq'],
    alcohol = res['alcohol'],
    consent = res['consent'],
    fruit = res['fruit'],
    genhlth = res['genhlth'],
    heart = res['heart'],
    highBp = res['highBp'],
    result = res['result'],
    initdate = res['initdate'];

}
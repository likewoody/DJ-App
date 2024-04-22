class Diagnosis{
  int? seq;
  String email;
  int? alcohol;
  int? consent;
  int? fruit;
  int? genhlth;
  int? heart;
  int? highBp;
  String initdate;
  double result;

Diagnosis ({
  this.seq,
  required this.email,
  required this.alcohol,
  required this.consent,
  required this.fruit,
  required this.genhlth,
  required this.heart,
  required this.highBp,
  required this.initdate,
  required this.result,
});

Diagnosis.fromMap(Map<String, dynamic> res)
  : seq = res['seq'],
    email = res['email'],
    alcohol = res['alcohol'],
    consent = res['consent'],
    fruit = res['fruit'],
    genhlth = res['genhlth'],
    heart = res['heart'],
    highBp = res['highBp'],
    result = res['result'],
    initdate = res['initdate'];

}

class DiagnosisResult{
  final String result;
  final String initdate;

  DiagnosisResult({
    required this.result,
    required this.initdate
  });

  DiagnosisResult.fromMap(Map<String, dynamic> res)
  : result = res['result'].toString().substring(2,4),
    initdate = res['initdate'].toString().substring(0,10);
}
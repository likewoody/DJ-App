class DiagnosisResult{
  final String result;
  final String initdate;

  DiagnosisResult({
    required this.result,
    required this.initdate
  });

  DiagnosisResult.fromMap(Map<String, dynamic> res)
  : result = res['result'],
    initdate = res['initdate'];
}
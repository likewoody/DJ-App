class ModelEnquire{
  String? id;
  String title = '';
  String context = '';
  String date = '';
  String image = '';

  ModelEnquire({
    id,
    required this.title,
    required this.context,
    required this.date,
    required this.image
  });
}
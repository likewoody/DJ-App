class ModelEnquire{
  String? id;
  String title, context, date, image = '';

  ModelEnquire({
    id,
    required this.title,
    required this.context,
    required this.date,
    required this.image
  });
}
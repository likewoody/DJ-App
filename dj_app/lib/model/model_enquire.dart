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

  ModelEnquire.fromMap(Map<String, dynamic> res)
    : id = res['id'],
      title = res['title'],
      context = res['context'],
      date = res['date'],
      image = res['image'];
}
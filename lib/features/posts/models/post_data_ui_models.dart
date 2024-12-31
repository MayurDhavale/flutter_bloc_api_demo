class PostDataUiModels {
  final int id;
  final String title;
  final String body;

  PostDataUiModels({
    required this.id,
    required this.title,
    required this.body,
  });

  // Add the fromMap method to convert JSON to PostDataUiModels
  factory PostDataUiModels.fromMap(Map<String, dynamic> map) {
    return PostDataUiModels(
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  // Optionally, you can add a toMap method if you need to convert the object back to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

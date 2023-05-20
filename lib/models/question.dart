class Question {
  final String id;
  final String text;
  final String? imageUrl;
  final String categoryId;

  Question({required this.id, required this.text, this.imageUrl, required this.categoryId});

  Question.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        text = item["text"],
        imageUrl = item["image_url"],
        categoryId = item["category_id"];

  Map<String, Object> toMap() {
    return {'id': id, 'text': text, 'imageUrl': imageUrl!, 'categoryId': categoryId};
  }
}

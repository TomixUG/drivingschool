import 'answer.dart';

class Question {
  final String id;
  final String text;
  final String? imageUrl;
  final String categoryId;
  final List<Answer> answers;
  final bool flagged;

  Question({
    required this.id,
    required this.text,
    this.imageUrl,
    required this.categoryId,
    required this.answers,
    required this.flagged,
  });
}

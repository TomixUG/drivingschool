import 'package:drivingschool/models/answer.dart';
import 'package:drivingschool/models/question.dart';

List<Question> parseQuestions(List<Map<String, Object?>> data) {
  final questionMap = <String, Question>{};

  for (final row in data) {
    // Extract the question attributes from the row
    final questionId = row['question_id'] as String;
    final questionText = row['question_text'] as String;
    final questionImageUrl = row['question_image_url'] as String?;
    final categoryId = row['question_category_id'] as String;

    // Check if the question has been created already
    if (!questionMap.containsKey(questionId)) {
      // If not, create a new question instance and add it to the map
      final question = Question(
        id: questionId,
        text: questionText,
        imageUrl: questionImageUrl,
        categoryId: categoryId,
        answers: [],
      );
      questionMap[questionId] = question;
    }

    // Extract the answer attributes from the row
    final answerId = row['answer_id'] as String;
    final answerText = row['answer_text'] as String;
    final answerIsCorrect = row['answer_is_correct'] != 0 ? true : false;

    // Create a new answer instance
    final answer = Answer(
      id: answerId,
      text: answerText,
      isCorrect: answerIsCorrect,
    );

    // Add the answer to the corresponding question's answer list
    final question = questionMap[questionId]!;
    question.answers.add(answer);
  }

  // Return the list of questions
  return questionMap.values.toList();
}

import 'package:drivingschool/models/answer.dart';
import 'package:drivingschool/models/question.dart';

class TestResultModel {
  final List<Answer> showedAnswers;
  final List<Question> answeredQuestions;

  final List<Question> correctQuestions;
  final List<Question> incorrectQuestions;

  TestResultModel(
      {required this.showedAnswers,
      required this.answeredQuestions,
      required this.correctQuestions,
      required this.incorrectQuestions});
}

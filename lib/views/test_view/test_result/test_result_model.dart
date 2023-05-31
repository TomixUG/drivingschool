import 'package:drivingschool/models/answer.dart';
import 'package:drivingschool/models/question.dart';

class TestResultModel {
  final List<Answer> showedAnswers;
  final List<Question> answeredQuestions;

  final int correct;
  final int incorrect;

  TestResultModel(
      {required this.showedAnswers, required this.answeredQuestions, required this.correct, required this.incorrect});
}

import 'package:flutter/material.dart';

import 'data/quiz_brian.dart';

class QuestionMe {
  QuizBrain questions = QuizBrain();
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  bool noMoreQuestion = false;

  void correct() =>
      scoreKeeper.add(const Icon(color: Colors.green, Icons.check));
  void wrong() => scoreKeeper.add(const Icon(color: Colors.red, Icons.close));
  void reset() {
    scoreKeeper = [];
    questionNumber = 0;
    noMoreQuestion = false;
  }

  String getQuestionQuestion() => questions.getQuestionText(questionNumber);
  void nextQuestion(as) {
    bool? nextQuestion = (questionNumber < questions.getQuestionsLength() - 1);
    if (scoreKeeper.length < questions.getQuestionsLength()) {
      if (questions.getQuestionAnswer(questionNumber) == as) {
        correct();
      } else {
        wrong();
      }
    } else {
      noMoreQuestion = true;
    }
    if (nextQuestion) {
      questionNumber++;
    } else {
      noMoreQuestion = true;
    }
  }
}

import 'package:flutter/material.dart';

import 'classes/question_me.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuestionMe question = QuestionMe();
  Widget answerButton({
    required buttonColor,
    required String buttonText,
    required callBack,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              callBack();
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question.getQuestionQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        if (question.noMoreQuestion)
          answerButton(
            buttonColor: Colors.red,
            buttonText: 'Reset',
            callBack: () => question.reset(),
          ),
        if (!question.noMoreQuestion)
          answerButton(
            buttonColor: Colors.green,
            buttonText: 'True',
            callBack: () => question.nextQuestion(true),
          ),
        if (!question.noMoreQuestion)
          answerButton(
            buttonColor: Colors.red,
            buttonText: 'False',
            callBack: () => question.nextQuestion(false),
          ),
        Row(
          children: question.scoreKeeper,
        )
      ],
    );
  }
}

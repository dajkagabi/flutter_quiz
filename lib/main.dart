import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List> loadQuestions() async {
  String jsonString = await rootBundle.loadString('assets/data.json');
  final data = json.decode(jsonString);
  return data;
}

void main() {
  runApp(const MaterialApp(
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List questions = [];
  int currentQuestionIndex = 0;
  bool isAnswered = false;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    loadQuestions().then((data) {
      setState(() {
        questions = data;
      });
    });
  }

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = questions[currentQuestionIndex]['correct_answer'];
    setState(() {
      isAnswered = true;
      isCorrect = selectedAnswer == correctAnswer;
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      isAnswered = false;
      isCorrect = false;
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      isAnswered = false;
      isCorrect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final totalQuestions = questions.length;
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Kérdések száma
            Text(
              'Total Questions: $totalQuestions',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20),
            ...currentQuestion['answers'].map<Widget>((answer) {
              return ElevatedButton(
                onPressed: isAnswered
                    ? null
                    : () {
                        checkAnswer(answer);
                      },
                child: Text(answer),
              );
            }).toList(),
            const SizedBox(height: 20),
            if (isAnswered)
              Text(
                isCorrect ? "Correct!" : "Wrong!",
                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            if (isAnswered && currentQuestionIndex < totalQuestions - 1)
              ElevatedButton(
                onPressed: nextQuestion,
                child: const Text("Next Question"),
              ),
            if (isAnswered && currentQuestionIndex == totalQuestions - 1)
              Column(
                children: [
                  const Text(
                    "You've completed the quiz!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: restartQuiz,
                    child: const Text("Restart Quiz"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

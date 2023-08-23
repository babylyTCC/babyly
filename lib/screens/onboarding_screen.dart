import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clientScreens/login.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> _questions = [
    {
      'question':
          'Qual a faixa etária da criança? (Vocẽ poderá especificar no app mais tarde.)',
      'answers': ['0-3 anos', '4-7 anos', '8+ anos'],
      'correctIndex': 2,
    },
    {
      'question': 'De forma geral, como você avalia o temperamento da criança?',
      'answers': [
        'Calmo',
        'Agitado',
      ],
      'correctIndex': 1,
    },
    {
      'question': 'A criança necessita de cuidados especiais?',
      'answers': [
        'Sim',
        'Não',
      ],
      'correctIndex': 0,
    },
  ];

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Aqui você pode navegar para outra tela após o quiz
        // Navigator.push(context, MaterialPageRoute(builder: (context) => OtherScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
            ),
            SizedBox(height: 20),
            Text(
              'Pergunta ${_currentQuestionIndex + 1}:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              currentQuestion['question'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ...List.generate(
              currentQuestion['answers'].length,
              (index) => RadioListTile<int>(
                title: Text(currentQuestion['answers'][index]),
                value: index,
                groupValue:
                    null, // Substitua pelo valor da resposta selecionada
                onChanged: (value) {
                  // Lógica para verificar a resposta
                },
              ),
            ),
            Spacer(),
            if (_currentQuestionIndex == _questions.length - 1)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text('Vamos iniciar!'),
                ),
              ),
            if (_currentQuestionIndex < _questions.length - 1)
              Center(
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text('Próximo'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:Pedagodino/screens/babysitterScreens/login_babysitter.dart';
import 'package:Pedagodino/screens/babysitterScreens/registration_babysitter.dart';
import 'package:Pedagodino/screens/clientScreens/registration_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clientScreens/login.dart';
import 'onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String userType = ""; // Variável global para armazenar o tipo de usuário

  void _setUserType(String type) {
    setState(() {
      userType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha o Tipo de Usuário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(),
                  ),
                );
              },
              child: Text('Sou Mãe/Pai'),
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginBabyScreen(),
                  ),
                );
              },
              child: Text('Sou babá'),
            ),
            SizedBox(height: 20),
            Text(
              userType.isNotEmpty
                  ? "Tipo de usuário selecionado: $userType"
                  : "Nenhum tipo de usuário selecionado",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:babyly/screens/babysitterScreens/login_babysitter.dart';
import 'package:babyly/screens/babysitterScreens/registration_babysitter.dart';
import 'package:babyly/screens/clientScreens/registration_client.dart';
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
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              color: Colors.purple,
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text(
                  "Sou mãe/pai",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              color: Colors.purple,
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginBabyScreen()));
                },
                child: const Text(
                  "Sou babá     ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

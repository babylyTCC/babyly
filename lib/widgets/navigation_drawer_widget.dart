import 'package:Pedagodino/screens/clientScreens/chat_screen.dart';
import 'package:Pedagodino/screens/clientScreens/chat_selection.dart';
import 'package:Pedagodino/screens/clientScreens/home_screen.dart';
import 'package:Pedagodino/screens/clientScreens/person_screen.dart';
import 'package:Pedagodino/screens/clientScreens/profile_screen.dart';
import 'package:Pedagodino/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Pedagodino/models/user_model.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import '../screens/login.dart';

class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = '${loggedInUser.firstName} ${loggedInUser.secondName}';
    final email = '${loggedInUser.email}';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => selectedItem(context, 9),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  buildMenuItem(
                    text: 'Minhas crianças',
                    icon: Icons.people,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonScreen(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Babás',
                    icon: Icons.workspaces_outline,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BabysitterListScreen(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Chat',
                    icon: Icons.message,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatSelectionScreen(),
                    )),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Configurações',
                    icon: Icons.settings,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => settingsScreen(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Sair',
                    icon: Icons.logout,
                    onClicked: () => MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => settingsScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => settingsScreen(),
        ));
        break;
    }
  }
}

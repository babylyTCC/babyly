import 'package:Pedagodino/screens/clientScreens/chat_selection.dart';
import 'package:Pedagodino/screens/clientScreens/componentesClient/babas_details/bdetails_3.dart';
import 'package:Pedagodino/screens/clientScreens/componentesClient/babas_details/bdetails_4.dart';
import 'package:Pedagodino/screens/clientScreens/login.dart';
import 'package:Pedagodino/screens/clientScreens/person_screen.dart';
import 'package:Pedagodino/screens/clientScreens/profile_screen.dart';
import 'package:Pedagodino/screens/settings_screen.dart';
import 'package:Pedagodino/screens/clientScreens/componentesClient/baba_cards/baba2.dart';
import 'package:Pedagodino/screens/clientScreens/componentesClient/baba_cards/baba3.dart';
import 'package:Pedagodino/screens/clientScreens/componentesClient/baba_cards/baba4.dart';
import 'package:flutter/material.dart';
import 'package:Pedagodino/screens/clientScreens/componentesClient/baba_cards/baba1.dart';

import 'componentesClient/babas_details/bdetails_1.dart';
import 'componentesClient/babas_details/bdetails_2.dart';

class BabysitterListScreen extends StatefulWidget {
  const BabysitterListScreen({Key? key}) : super(key: key);
  @override
  _BabysitterListScreenState createState() => _BabysitterListScreenState();
}

class _BabysitterListScreenState extends State<BabysitterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.purple,
      ),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              'Profissionais na sua área agora:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  height: 110.0,
                  margin: const EdgeInsets.all(0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const baba1(),
                    shrinkWrap: true,
                    itemCount: 1,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bdetails1(),
                ));
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  height: 110.0,
                  margin: const EdgeInsets.all(0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const baba2(),
                    shrinkWrap: true,
                    itemCount: 1,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bdetails2(),
                ));
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  height: 110.0,
                  margin: const EdgeInsets.all(0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const baba3(),
                    shrinkWrap: true,
                    itemCount: 1,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bdetails3(),
                ));
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  height: 110.0,
                  margin: const EdgeInsets.all(0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const baba4(),
                    shrinkWrap: true,
                    itemCount: 1,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bdetails4(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.child_care),
            title: Text('Minhas Crianças'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersonScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services),
            title: Text('Babás'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BabysitterListScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatSelectionScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Security(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}

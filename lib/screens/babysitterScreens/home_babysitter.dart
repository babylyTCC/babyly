import 'package:Pedagodino/main.dart';
import 'package:Pedagodino/screens/babysitterScreens/profile_babysitter.dart';
import 'package:Pedagodino/screens/clientScreens/chat_selection.dart';
import 'package:Pedagodino/screens/clientScreens/person_screen.dart';
import 'package:Pedagodino/screens/clientScreens/profile_screen.dart';
import 'package:Pedagodino/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'chat_selection_babysitter.dart';

void main() => runApp(BabysitterApp());

class BabysitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      color: Colors.purple,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ChildListScreen(),
    );
  }
}

class ChildListScreen extends StatelessWidget {
  final List<Babysitter> babysitters = [
    Babysitter(
      name: 'Enzo',
      age: 2,
      location: 'Santa Bárbara dOeste',
    ),
    Babysitter(
      name: 'Valentina',
      age: 5,
      location: 'Americana',
    ),
    Babysitter(
      name: 'Ana',
      age: 3,
      location: 'Campinas',
    ),
    Babysitter(
      name: 'Bernardo',
      age: 1,
      location: 'Sumaré',
    ),
    Babysitter(
      name: 'Théo',
      age: 10,
      location: 'Campinas',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.purple,
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemCount: babysitters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BabysitterDetailScreen(babysitter: babysitters[index]),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      babysitters[index].name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text('Age: ${babysitters[index].age}'),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 4.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Babysitter {
  final String name;
  final int age;
  final String location;

  Babysitter({
    required this.name,
    required this.age,
    required this.location,
  });
}

class BabysitterDetailScreen extends StatelessWidget {
  final Babysitter babysitter;

  BabysitterDetailScreen({required this.babysitter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(babysitter.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Age: ${babysitter.age}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 4.0),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Bio:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Location:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(babysitter.location),
            SizedBox(height: 32.0),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatSelectionScreen(),
                  ));
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Text('Start Chat'),
                  //       content: Text(
                  //           'Chat functionality will be implemented here.'),
                  //       actions: <Widget>[
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: Text('OK'),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                },
                child: Icon(Icons.chat),
              ),
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
            title: Text('Crianças'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChildListScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatSelectionBBScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreenBabysitter(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Security(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}

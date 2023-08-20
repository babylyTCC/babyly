import 'package:Pedagodino/main.dart';
import 'package:Pedagodino/screens/clientScreens/chat_selection.dart';
import 'package:Pedagodino/screens/clientScreens/person_screen.dart';
import 'package:Pedagodino/screens/clientScreens/profile_screen.dart';
import 'package:Pedagodino/screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BabysitterApp());

class BabysitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BabysitterListScreen(),
    );
  }
}

class BabysitterListScreen extends StatelessWidget {
  final List<Babysitter> babysitters = [
    Babysitter(
      name: 'vinicius',
      age: 17,
      rating: 4.5,
      bio: 'teste bio1: blablabla',
      location: 'Santa Bárbara dOeste',
    ),
    Babysitter(
      name: 'rian',
      age: 17,
      rating: 5.0,
      bio: 'teste bio2: blablabla',
      location: 'Americana',
    ),
    Babysitter(
      name: 'fulano',
      age: 25,
      rating: 4.2,
      bio: 'teste usuario blablablabla',
      location: 'Campinas',
    ),
    Babysitter(
      name: 'ciclano',
      age: 20,
      rating: 4.2,
      bio: 'teste usuario blablablabla',
      location: 'Sumaré',
    ),
    Babysitter(
      name: 'Nova Odessa',
      age: 30,
      rating: 4.2,
      bio: 'teste usuario blablablabla',
      location: 'Campinas',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
                        Text(babysitters[index].rating.toString()),
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
  final double rating;
  final String bio;
  final String location;

  Babysitter({
    required this.name,
    required this.age,
    required this.rating,
    required this.bio,
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
                Text(babysitter.rating.toString()),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Bio:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(babysitter.bio),
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
              color: Colors.blue,
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
            leading: Icon(Icons.add_circle),
            title: Text('Minhas crianças'),
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
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => settingsScreen(),
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

// import 'dart:ui';

// import 'package:Pedagodino/models/user_model.dart';
// import 'package:Pedagodino/screens/numeros_screen.dart';
// import 'package:Pedagodino/screens/letras_screen.dart';
// import 'package:Pedagodino/screens/rimas_screen.dart';
// import 'package:Pedagodino/screens/sons_screen.dart';
// import 'package:Pedagodino/widgets/primeira_medalha.dart';
// import 'package:Pedagodino/widgets/segunda_medalha.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_profile_picture/flutter_profile_picture.dart';
// import 'package:get/get_navigation/src/snackbar/snackbar.dart';

// import '../main.dart';
// import '../widgets/button_widget.dart';
// import '../widgets/drawer.dart';
// import '../widgets/navigation_drawer_widget.dart';
// import '../widgets/quarta_medalha.dart';
// import '../widgets/terceira_medalha.dart';

// class homeScreen extends StatefulWidget {
//   const homeScreen({Key? key}) : super(key: key);

//   @override
//   _FeaturedScreenState createState() => _FeaturedScreenState();
// }

// class _FeaturedScreenState extends State<homeScreen> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: AppBar(),
//       drawer: NavigationDrawerWidget(),
//       // endDrawer: NavigationDrawerWidget(),
//       body: Builder(
//         builder: (context) => Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.symmetric(horizontal: 5),
//           child: Column(
//             children: [
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.only(top: 25),
//                 child: Column(
//                   children: [
//                     InkWell(
//                         onTap: (() {
//                           //       Navigator.push(
//                           //         context,
//                           //         MaterialPageRoute(
//                           //           builder: (context) => const letrasScreen(),
//                           //         ),
//                           //       );
//                         }),
//                         child: primeiraMedalha()),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 25),
//                 child: Column(
//                   children: [
//                     InkWell(
//                         onTap: (() {
//                           //       Navigator.push(
//                           //         context,
//                           //         MaterialPageRoute(
//                           //           builder: (context) => const letrasScreen(),
//                           //         ),
//                           //       );
//                         }),
//                         child: primeiraMedalha()),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 25),
//                 child: Column(
//                   children: [
//                     InkWell(
//                         onTap: (() {
//                           //       Navigator.push(
//                           //         context,
//                           //         MaterialPageRoute(
//                           //           builder: (context) => const letrasScreen(),
//                           //         ),
//                           //       );
//                         }),
//                         child: primeiraMedalha()),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 25),
//                 child: Column(
//                   children: [
//                     InkWell(
//                         onTap: (() {
//                           //       Navigator.push(
//                           //         context,
//                           //         MaterialPageRoute(
//                           //           builder: (context) => const letrasScreen(),
//                           //         ),
//                           //       );
//                         }),
//                         child: primeiraMedalha()),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 25),
//                 child: Column(
//                   children: [
//                     InkWell(
//                         onTap: (() {
//                           //       Navigator.push(
//                           //         context,
//                           //         MaterialPageRoute(
//                           //           builder: (context) => const letrasScreen(),
//                           //         ),
//                           //       );
//                         }),
//                         child: primeiraMedalha()),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ));
// }
import 'package:Pedagodino/main.dart';
import 'package:Pedagodino/screens/chat_selection.dart';
import 'package:Pedagodino/screens/person_screen.dart';
import 'package:Pedagodino/screens/profile_screen.dart';
import 'package:Pedagodino/screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BabysitterApp());

class BabysitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Babysitter App',
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
      name: 'Anna',
      age: 28,
      rating: 4.5,
      bio:
          'Experienced and reliable babysitter with a passion for childcare. Loves engaging in creative activities with children.',
      location: 'New York',
    ),
    Babysitter(
      name: 'Emily',
      age: 32,
      rating: 5.0,
      bio:
          'Highly skilled and dedicated babysitter. Excellent at creating a safe and nurturing environment for children.',
      location: 'Los Angeles',
    ),
    Babysitter(
      name: 'Sophia',
      age: 25,
      rating: 4.2,
      bio:
          'Enthusiastic and caring babysitter with a gentle approach to childcare. Loves building strong connections with children.',
      location: 'Chicago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Babysitters'),
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

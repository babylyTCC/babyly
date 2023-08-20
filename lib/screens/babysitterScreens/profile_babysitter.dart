import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:Pedagodino/widgets/primeira_medalha.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(ProfileApp());

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreenBabysitter(),
    );
  }
}

class ProfileScreenBabysitter extends StatefulWidget {
  @override
  _ProfileScreenBabysitterState createState() =>
      _ProfileScreenBabysitterState();
}

class _ProfileScreenBabysitterState extends State<ProfileScreenBabysitter> {
  late SharedPreferences _prefs;
  String _name = '';
  String _email = '';
  Uint8List? _photo;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  List<Person> _persons = [];

  Future<void> _loadProfile() async {
    _prefs = await SharedPreferences.getInstance();
    _name = _prefs.getString('name') ?? '';
    _email = _prefs.getString('email') ?? '';
    String? photoPath = _prefs.getString('photoPath');
    if (photoPath != null) {
      setState(() {
        _photo = File(photoPath).readAsBytesSync();
      });
    }
    _nameController.text = _name;
    _emailController.text = _email;

    String? personsJson = _prefs.getString('persons');
    if (personsJson != null) {
      List<dynamic> jsonList = jsonDecode(personsJson);
      List<Person> loadedPersons =
          jsonList.map((json) => Person.fromJson(json)).toList();
      setState(() {
        _persons = loadedPersons;
      });
    }
  }

  Future<void> _saveProfile() async {
    _prefs.setString('name', _nameController.text);
    _prefs.setString('email', _emailController.text);
    if (_photo != null) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String photoPath = '${appDocDir.path}/profile_photo.jpg';
      await File(photoPath).writeAsBytes(_photo!);
      _prefs.setString('photoPath', photoPath);
    }

    List<String> personsJson =
        _persons.map((person) => jsonEncode(person.toJson())).toList();
    await _prefs.setStringList('persons', personsJson);
  }

  // Future<void> _updatePhoto() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _photo = File(pickedFile.path).readAsBytesSync();
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  // onTap: _updatePhoto,
                  child: CircleAvatar(
                    radius: 64.0,
                    backgroundImage: _photo != null
                        ? MemoryImage(_photo!)
                        : AssetImage('assets/default_profile.png')
                            as ImageProvider,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _saveProfile();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Profile Saved'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
          primeiraMedalha()
        ],
      ),
    );
  }

  Widget _buildCards() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _persons.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: _persons[index].photo != null
                ? CircleAvatar(
                    backgroundImage: MemoryImage(_persons[index].photo!),
                  )
                : CircleAvatar(child: Icon(Icons.person)),
            title: Text(_persons[index].name),
            subtitle: Text('Age: ${_persons[index].age}'),
          ),
        );
      },
    );
  }
}

class Person {
  final String name;
  final String age;
  Uint8List? photo;

  Person({required this.name, required this.age, this.photo});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
      photo: json['photo'] != null ? base64Decode(json['photo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'photo': photo != null ? base64Encode(photo!) : null,
    };
  }
}

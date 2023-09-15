import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:Pedagodino/screens/clientScreens/componentesClient/baba_cards/baba1.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
        title: Text(''),
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
                        : AssetImage('icons/default_profile.png')
                            as ImageProvider,
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{1,}$');
                    if (value!.isEmpty) {
                      return ("Por favor informe o sobrenome");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("O sobrenome deve ter mais de 1 caracter");
                    }
                    return null;
                  },
                  // onSaved: (value) {
                  //   secondNameEditingController.text = value!;
                  // },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(100, 235, 237, 239),
                    // prefixIcon: const Icon(Icons.account_circle,
                    //     color: Color.fromARGB(255, 138, 0, 236)),
                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    hintText: "Sobrenome",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
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
          //baba1()
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

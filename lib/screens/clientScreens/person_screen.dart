import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(PersonApp());

class PersonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PersonScreen(),
    );
  }
}

class PersonScreen extends StatefulWidget {
  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  List<Person> _persons = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPersons();
  }

  Future<void> _loadPersons() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? personsJsonList = prefs.getStringList('persons');
    if (personsJsonList != null) {
      List<Person> loadedPersons = personsJsonList
          .map((json) => Person.fromJson(jsonDecode(json)))
          .toList();
      setState(() {
        _persons = loadedPersons;
      });
    }
  }

  Future<void> _savePersons() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> personsJsonList =
        _persons.map((person) => jsonEncode(person.toJson())).toList();
    await prefs.setStringList('persons', personsJsonList);
  }

  void _addPerson() {
    String name = _nameController.text;
    String age = _ageController.text;

    Person newPerson = Person(name: name, age: age);

    setState(() {
      _persons.add(newPerson);
    });

    _nameController.clear();
    _ageController.clear();

    _savePersons(); // Wait for the data to be saved before proceeding
  }

  Future<void> _deletePerson(int index) async {
    setState(() {
      _persons.removeAt(index);
    });

    _savePersons(); // Wait for the data to be saved before proceeding
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
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
              subtitle: Text('Idade: ${_persons[index].age}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deletePerson(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Adicionar crianças'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                    ),
                    TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        labelText: 'Idade',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      _addPerson();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
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

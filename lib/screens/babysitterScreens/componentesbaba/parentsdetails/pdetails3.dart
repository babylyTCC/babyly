import 'package:babyly/screens/babysitterScreens/chat_selection_babysitter.dart';
import 'package:babyly/screens/babysitterScreens/home_babysitter.dart';
import 'package:babyly/screens/clientScreens/chat_selection.dart';
import 'package:babyly/screens/clientScreens/home_screen.dart';
import 'package:flutter/material.dart';

import '../parentsChats/parentChat3.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xff6D6D6D),
    ),
    home: pdetails3(),
  ));
}

class pdetails3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5, 100.0),
                            bottomRight: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5, 100.0),
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/icons/background.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.call,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: Text(
                                          "A função de chamadas será implementada futuramente! Acompanhe-nos para futuras novidades!"),
                                    );
                                  });
                            },
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage('assets/icons/parent3.jpg'),
                          ),
                          InkWell(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green,
                              child: Icon(Icons.chat,
                                  size: 30, color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PChat3(),
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    'Angélica Silva',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'Preciso de uma babá no período noturno :)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Helena - 6 anos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Limeira - SP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Noturno',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.purple,
                  child: MaterialButton(
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ChildListScreen()));
                    },
                    child: const Text(
                      "Voltar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

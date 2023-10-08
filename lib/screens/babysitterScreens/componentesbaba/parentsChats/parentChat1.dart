import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PChat1 extends StatefulWidget {
  @override
  _PChat1State createState() => _PChat1State();
}

class _PChat1State extends State<PChat1> {
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );
  ChatUser user2 = ChatUser(
    id: '2',
    firstName: 'Teste',
    lastName: 'User2',
  );

  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: 'Olá! está disponível para hoje?',
      user: ChatUser(id: '2'),
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: DashChat(
        inputOptions: InputOptions(
            inputDecoration:
                defaultInputDecoration(hintText: 'Digite sua mensagem:')),
        currentUser: user,
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        messages: messages,
      ),
    );
  }
}

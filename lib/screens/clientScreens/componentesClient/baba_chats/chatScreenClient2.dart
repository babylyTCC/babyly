import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicChat2 extends StatefulWidget {
  @override
  _BasicChat2State createState() => _BasicChat2State();
}

class _BasicChat2State extends State<BasicChat2> {
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
      text: 'Olá',
      user: ChatUser(id: '2'),
      createdAt: DateTime.parse("2023-06-03 15:04:00"),
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

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PChat3 extends StatefulWidget {
  @override
  _PChat3State createState() => _PChat3State();
}

class _PChat3State extends State<PChat3> {
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
      text: 'Poderia vir no período da tarde??',
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

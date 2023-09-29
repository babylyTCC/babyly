import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicChat3 extends StatefulWidget {
  @override
  _BasicChat3State createState() => _BasicChat3State();
}

class _BasicChat3State extends State<BasicChat3> {
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
      text: 'Não conseguirei te atender neste horário :(',
      user: ChatUser(id: '2'),
      createdAt: DateTime.parse("2023-09-03 21:30:00"),
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

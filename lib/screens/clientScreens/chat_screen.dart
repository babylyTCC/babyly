// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<Message> _messages = [];

//   TextEditingController _textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: Column(
//         children: [
//           Flexible(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return _buildMessage(_messages[index]);
//               },
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//             ),
//             child: _buildTextComposer(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessage(Message message) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: EdgeInsets.only(right: 8.0),
//             child: CircleAvatar(
//               child: Text(message.sender.substring(0, 1)),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 message.sender,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 5.0),
//                 child: Text(message.text),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextComposer() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: [
//           Flexible(
//             child: TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration.collapsed(
//                 hintText: 'Digite uma mensagem',
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 4.0),
//             child: IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () {
//                 String text = _textEditingController.text;
//                 if (text.isNotEmpty) {
//                   _sendMessage(text);
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _sendMessage(String text) {
//     Message message = Message(sender: 'Me', text: text);
//     setState(() {
//       _messages.add(message);
//     });
//     _textEditingController.clear();
//   }
// }

// class Message {
//   final String sender;
//   final String text;

//   Message({required this.sender, required this.text});
// }

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final String room;

  const ChatPage({
    Key? key,
    required this.name,
    required this.room,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room: ${widget.room}'),
      ),
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type your text',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

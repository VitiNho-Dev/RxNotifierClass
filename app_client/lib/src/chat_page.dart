import 'package:app_client/src/chat_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

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
  late ChatController controller;

  @override
  void initState() {
    super.initState();
    controller = ChatController(widget.name, widget.room);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room: ${widget.room}'),
      ),
      extendBody: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            RxBuilder(
              builder: (context) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.listEvents.length,
                    itemBuilder: (context, index) {
                      final event = controller.listEvents[index];

                      if (event.type == SocketEventType.enterRoom) {
                        return ListTile(
                          title: Text('${event.name} ENTROU NA SALA!'),
                        );
                      } else if (event.type == SocketEventType.leaveRoom) {
                        return ListTile(
                          title: Text('${event.name} SAIU DA SALA!'),
                        );
                      }

                      return ListTile(
                        title: Text(event.name),
                        subtitle: Text(event.text),
                      );
                    },
                  ),
                );
              },
            ),
            TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                hintText: 'Type your text',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: controller.send,
                  icon: const Icon(
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

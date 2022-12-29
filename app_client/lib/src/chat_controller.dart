// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatController {
  late Socket socket;
  final String name;
  final String room;
  final listEvents = RxList<SocketEvent>([]);
  final textController = TextEditingController(text: '');

  ChatController(this.name, this.room) {
    _init();
  }

  void _init() {
    socket = io(
      'http://localhost:3000',
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.connect();

    socket.onConnect((_) {
      socket.emit('enter_room', {'room': room, 'name': name});
    });

    socket.on('message', (json) {
      final event = SocketEvent.fromJson(json);
      listEvents.add(event);
    });
  }

  void send() {
    final event = SocketEvent(
      name: name,
      room: room,
      type: SocketEventType.message,
    );
    listEvents.add(event);
    socket.emit('message', event.toJson());
    textController.clear();
  }

  void dispose() {
    socket.clearListeners();
    socket.close();
    textController.dispose();
  }
}

import 'package:socket_io/socket_io.dart';
import 'package:common/common.dart';

void main(List<String> arguments) {
  final server = Server();

  server.on('connection', (client) {
    onConnection(client);
  });

  server.listen(3000);
}

void onConnection(Socket socket) {
  socket.on('enter_room', (data) {
    final name = data['name'];
    final room = data['room'];

    socket.join(room);
    socket.to(room).broadcast.emit(
          'message',
          SocketEvent(
            name: name,
            room: room,
            type: SocketEventType.enterRoom,
          ).toJson(),
        );

    socket.on('disconnect', (data) {
      socket.to(room).broadcast.emit(
            'message',
            SocketEvent(
              name: name,
              room: room,
              type: SocketEventType.leaveRoom,
            ).toJson(),
          );
    });

    socket.on('message', (json) {
      socket.to(room).broadcast.emit('message', json);
    });
  });
}

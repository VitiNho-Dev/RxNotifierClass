import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('from json toJson', () {
    final json = {
      'name': 'Joao',
      'room': 'sala 1',
      'text': '',
      'type': 'SocketEventType.enterRoom',
    };

    final event = SocketEvent.fromJson(json);

    expect(event.name, 'Joao');
    expect(event.type, SocketEventType.enterRoom);
    expect(event.toJson(), json);
  });
}

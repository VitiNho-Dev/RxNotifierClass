import 'package:rx_notifier/rx_notifier.dart';

class Controller {
  var counter = RxNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }
}

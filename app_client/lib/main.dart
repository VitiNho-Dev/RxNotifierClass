import 'package:app_client/src/chat_page.dart';
import 'package:app_client/src/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/chat': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map;
          return ChatPage(name: args['name'], room: args['room']);
        }
      },
    );
  }
}

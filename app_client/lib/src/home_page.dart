import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'NoName';
  String room = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Flutterando'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => room = value,
              decoration: const InputDecoration(
                labelText: 'Room',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) => name = value,
              decoration: const InputDecoration(
                labelText: 'Your Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/chat', arguments: {
                  'room': room,
                  'name': name,
                });
              },
              child: const Text('Start Chat'),
            ),
          ],
        ),
      ),
    );
  }
}

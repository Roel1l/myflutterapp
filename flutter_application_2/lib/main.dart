import 'package:flutter/material.dart';

import 'my_background_service.dart';
import 'my_home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key}) {
    MyBackgroundService.initializeService();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/details': (context) => const MyHomePage(),
      },
      home: Builder(builder: (context) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                OutlinedButton(
                  child: const Text("navigate"),
                  onPressed: () => Navigator.pushNamed(context, '/details'),
                ),
                OutlinedButton(
                  onPressed: () => MyBackgroundService.stopListening(),
                  child: const Text("Break video button"),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

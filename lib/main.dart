import 'package:flutter/material.dart';

void main() => runApp(MyApp() as Widget );

class MyApp {
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First app'),
        
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text('hello'),
            Text('hello'),
            Text('hello')

          ],
        ),
      ),
    );
  }
}
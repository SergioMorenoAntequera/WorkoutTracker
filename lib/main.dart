import 'package:flutter/material.dart';
import 'package:serangym/Views/session_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(onPressed: signIn, child: const Text("as")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createSession,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void signIn() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
  }

  void _createSession() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SessionView(null)),
    );
  }
}

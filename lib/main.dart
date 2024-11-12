import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Test',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    testFirestore();  // Wywołanie testu Firestore
  }

  void testFirestore() async {
    try {
      // Przykładowa operacja dodania danych do Firestore
      await FirebaseFirestore.instance.collection('users').add({
        'name': 'Test User',
        'email': 'testuser@example.com',
      });
      print('Dane dodane do Firestore');
    } catch (e) {
      print('Błąd przy dodawaniu danych do Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Center(
        child: Text('Firebase działa!'),
      ),
    );
  }
}


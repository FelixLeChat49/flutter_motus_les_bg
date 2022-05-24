import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/screens/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TusMo des BeauGosses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Log toi sur TusMo'),
    );
  }
}
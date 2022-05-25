import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/screens/global/main_page.dart';
import 'package:flutter_motus/ui/screens/login/login.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final BeamerDelegate routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(routes: {
    '/': (context, state, data) => LoginPage(title: "LoginPage"),
    '/home': (context, state, data) => MainPage()
  }));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TusMo des BeauGosses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}

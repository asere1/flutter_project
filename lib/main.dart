import 'package:flutter/material.dart';
import 'flutter_native_splash_model.dart';
import 'home.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false, home: Splash());
          } else {
            // Loading is done, return the app:
            return MaterialApp(
                title: 'BMI',
                theme: ThemeData(
                    iconTheme:
                        const IconThemeData(color: Colors.white, size: 32),
                    primarySwatch: Colors.teal,
                    canvasColor: Colors.black,
                    textTheme: const TextTheme(
                      bodyText1: TextStyle(
                          fontFamily: 'HindSiliguri',
                          fontSize: 26,
                          color: Colors.black),
                      headline3: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                      headline2: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      headline1: TextStyle(fontFamily: 'Changa', fontSize: 27),
                      button: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 27,
                          color: Colors.white),
                    )),
                debugShowCheckedModeBanner: false,
                home: Home());
          }
        });
  }
}

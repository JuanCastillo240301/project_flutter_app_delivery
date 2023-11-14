import 'package:flutter/material.dart';

//Routes
import 'package:project_flutter_app_delivery/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Proyect',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'welcome',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 0, 0),
        hintColor: const Color.fromRGBO(10, 31, 68, 1.0),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromRGBO(0, 122, 255, 1.0),
          ),
        disabledColor: const Color.fromRGBO(142, 142, 147, 1.2),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.black
          ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
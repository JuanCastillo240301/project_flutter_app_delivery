import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/ErrorStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:provider/provider.dart';
//Routes
import 'package:project_flutter_app_delivery/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
      ChangeNotifierProvider(create: (_) => LoadingStateProvider())
    ],
    child: MyAppUserState());
  }
}



class MyAppUserState extends StatelessWidget with BaseView {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: coordinator.start(context),
                         builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return MyApp(initialRoute: snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
    });
  }
}




class MyApp extends StatelessWidget {

    final String _initialRoute;

  MyApp({ required String initialRoute }) : _initialRoute = initialRoute;
  
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'Delivery Proyect',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
            localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
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
import 'package:flutter/material.dart';



//pages
import 'package:project_flutter_app_delivery/src/pages/welcome_page.dart';
import 'package:project_flutter_app_delivery/src/pages/login_page.dart';


final routes = <String,WidgetBuilder>{
'welcome': (BuildContext context) => const WelcomePage(),
'login': (BuildContext context) => const LoginPage()
};
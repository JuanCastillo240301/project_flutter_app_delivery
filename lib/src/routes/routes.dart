import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/collections_detail_page/view/collections_detail_page.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/collections_page/view/collections_page.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/search_page/view/search_page.dart';



//pages
import 'package:project_flutter_app_delivery/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/login_page/view/login_page.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/forgot_password_page/view/forgot_password_page.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/sign_up_page/view/sign_up_page.dart';

//tabs
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/tabs_page.dart';


final routes = <String,WidgetBuilder>{
'welcome': (BuildContext context) => const WelcomePage(),
'login': (BuildContext context) => const LoginPage(),
'forgot': (BuildContext context) => const ForgotPassword(),
'signup': (BuildContext context) => const SignUp(),
'tabs': (BuildContext context) => const TabsPage(),
'search': (BuildContext context) => const SearchPage(),
'collections': (BuildContext context) => const collectionsPage(),
'collections-detail': (BuildContext context) => const collectionsDetailPage(),
};
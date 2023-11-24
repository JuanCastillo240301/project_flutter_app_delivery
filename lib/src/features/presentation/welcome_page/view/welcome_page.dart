import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                 image: NetworkImage(
                'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  )
                  ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: createText(
                      texto: 'RESERVATION\nON YOURS\nCITY',
                      color: Colors.white,
                      fontSize: 40.0),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                  child: const Text(
                      'Set exact location to find the right places near you.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0)),
                ),
                createElevatedButton(
                    labelButton: 'Log in with Email/Password',
                    color: Colors.orange,
                    shape: const StadiumBorder(),
                    func: () {
                      Navigator.pushNamed(context, 'login');
                    }),
                createElevatedButton(
                    labelButton: 'Connect with Google',
                    color: Colors.blue,
                    isWithIcon: true,
                    shape: const StadiumBorder(),
                    icon: const AssetImage('assets/google1.png'),
                    func: () => print("goToGoogle")),
                    createElevatedButton(
                    labelButton: 'Connect with Github',
                    color: Colors.blueGrey,
                    isWithIcon: true,
                    shape: const StadiumBorder(),
                    icon: const AssetImage('assets/github1.png'),
                    func: () => print("goToGithub"))
              ],
            )
          ],
        )
    );
  }
}
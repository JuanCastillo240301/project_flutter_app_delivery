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
                    image: AssetImage(
                    'assets/stock.png'),
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
                      texto: 'DELIVERED FAST FOOD\nTO YOUR\nDOOR',
                      color: Colors.white,
                      fontSize: 40.0),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                  child: const Text(
                      'Set exact location to find the right restaurants near you.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0)),
                ),
                createElevatedButton(
                    labelButton: 'Log in',
                    color: Colors.orange,
                    shape: const StadiumBorder(),
                    func: () {
                      Navigator.pushNamed(context, 'login');
                    }),
                createElevatedButton(
                    labelButton: 'Connect with facebook',
                    color: Colors.blue,
                    isWithIcon: true,
                    shape: const StadiumBorder(),
                    icon: const AssetImage('assets/facebook.png'),
                    func: () => print("goToFacebook"))
              ],
            )
          ],
        )
    );
  }
}
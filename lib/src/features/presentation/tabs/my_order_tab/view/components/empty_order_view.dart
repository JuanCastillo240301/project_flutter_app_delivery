import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';

class emptyOrderView extends StatelessWidget {
  const emptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        //leading: Text(''),
        backgroundColor: white,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: createText(
              texto: 'My order',
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/emptyOrder.png')),
            createText(
                texto: 'CARD EMPTY',
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ],
        )),
      ),
    );
  }
}

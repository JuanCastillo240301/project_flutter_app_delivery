

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';

class ErrorAlertView {
  static Future showErrorAlertDialog({ 
    required BuildContext context, 
    required String subTitle, 
    dynamic Function()? ctaButtonAction }) async {
      await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: SizedBox(
                height: 320,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/errorIcon.png'),
                      width: 130,
                      height: 130,
                    ),
                    Container(
                        margin: const EdgeInsets.all(15.0),
                        child: TextView(
                            texto: "Network error",
                            color: Colors.black,
                            fontSize: 20.0)),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(subTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0)),
                    ),
                    createElevatedButton(
                        color: orange,
                        labelButton: 'Ir a Inicio',
                        shape: const StadiumBorder(),
                        func: ctaButtonAction
                    )
                  ],
                ),
              ),
            );
          });
  }
}


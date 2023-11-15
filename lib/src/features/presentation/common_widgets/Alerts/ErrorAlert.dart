
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';

Future showErrorAlert({ required BuildContext context, required String subTitle }) async {
  await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            height: 320,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/errorIcon.png'),
                  width: 130,
                  height: 130,
                ),
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: createText(
                        texto: "Network error",
                        color: primaryColor,
                        fontSize: 20.0)),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(subTitle,
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0)),
                ),
                createElevatedButton(
                    color: orange,
                    labelButton: 'Ir a Inicio',
                    shape: StadiumBorder(),
                    func: () {}
                    )
              ],
            ),
          ),
        );
      });
}
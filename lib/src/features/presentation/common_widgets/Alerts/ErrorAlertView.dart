
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';

class ErrorAlertView {

  static Future showErrorAlertDialog({ required BuildContext context,
                                       required String subtitle,
                                       dynamic Function()? ctaButtonAction }) async {

    return showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
       return AlertDialog(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.circular(20.0))
         ),
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
                 margin: EdgeInsets.all(15),
                 child: Text('Network error', style: TextStyle(
                  color: primaryColor,
                  fontSize: 20.0
                 )),
               ),
               Container(
                 margin: EdgeInsets.only(top: 15.0),
                 child: Text(subtitle, style: TextStyle(
                     color: primaryColor,
                     fontWeight: FontWeight.w400,
                     fontSize: 15.0
                 )),
               ),
               createElevatedButton(context: context,
                            labelButton: 'Ir a inicio',
                            color: orange,
                            shape: StadiumBorder(),
                            func: ctaButtonAction)
             ],
           ),
         ),
       );
    });
  }
}

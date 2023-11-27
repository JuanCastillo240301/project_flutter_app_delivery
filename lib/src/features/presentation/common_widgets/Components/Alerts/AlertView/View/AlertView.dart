

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';

class AlertView {
  static Future showAlertDialog({ required AlertViewModel model }) async {
      await showDialog(
          context: model.context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: SizedBox(
                height: 360,
                child: Column(
                  children: [
                    Image(
                      image: model.imagePath,
                      width: 130,
                      height: 130,
                    ),
                    Container(
                        margin: const EdgeInsets.all(15.0),
                        child: TextView(texto: model.headerTitle,color: grey, fontSize: 20.0)
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(model.headerSubTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0)),
                    ),
                    createElevatedButton(
                      color: orange,
                      labelButton: model.ctaButtonText,
                      shape: const StadiumBorder(),
                      labelFontSize: 17,
                      func: model.ctaButtonAction
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: model.cancelTextAction,
                      child: TextView(texto: model.cancelText ?? "", color: grey, fontSize: 17, textAlign: TextAlign.center, fontWeight: FontWeight.w300))
                  ],
                ),
              ),
            );
          }
        );
  }
}



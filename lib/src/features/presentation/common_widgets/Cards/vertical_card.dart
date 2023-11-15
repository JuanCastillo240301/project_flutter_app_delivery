import 'package:flutter/material.dart';
//Colors
import 'package:project_flutter_app_delivery/src/colors.dart';
//Commons Widgets
import '../Texts/header_text.dart';

Widget createCardVertical(
    {required BuildContext context,
    required double width,
    required double height,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle}) {
  return Container(
    margin: EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
              width: width, height: height, fit: BoxFit.cover, image: image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: createText(
                  texto: title, fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: createText(
                  texto: subtitle,
                  color: grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0),
            )
          ],
        )
      ],
    ),
  );
}

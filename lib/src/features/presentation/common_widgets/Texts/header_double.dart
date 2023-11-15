import 'package:flutter/material.dart';
//Common Widgets

import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';

Widget createDoubleText(
    {required String textHeader,
    required String textAction,
    Function()? func}) {
  return Container(
    child: Row(
      children: [
        createText(texto: textHeader, fontSize: 20.0),
        Spacer(),
        GestureDetector(
          onTap: func,
          child: createText(
              texto: textAction,
              color: Colors.orange,
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        )
      ],
    ),
  );
}

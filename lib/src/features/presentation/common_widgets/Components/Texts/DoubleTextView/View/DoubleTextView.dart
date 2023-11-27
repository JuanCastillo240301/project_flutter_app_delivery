
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';



class DoubleTextView extends StatelessWidget {

  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;

  const DoubleTextView({  
    required this.textHeader,
    required this.textAction,
    this.textActionTapped
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Row(
      children: [
        TextView(texto: textHeader, fontSize: 20.0),
        const Spacer(),
        GestureDetector(
          onTap: textActionTapped,
          child: TextView(
              texto: textAction,
              color: orange,
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        )
      ],
    ),
  );
  }
}




/*
GestureDetector(
            onTap: textActionTapped,
            child: TextView(
                texto: textAction,
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
 */
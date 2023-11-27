
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';


class FABRoundedRectangleView extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final bool isHidden;

  FABRoundedRectangleView({ Key? key,
                            required this.text,
                            this.backgroundColor = Colors.orange,
                            required this.onPressed,
                            required this.isHidden})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHidden ? Container()
        : FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        shape: const StadiumBorder(),
        label: TextView(
            texto: text,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16));
  }
}


import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';


abstract class DoubleTextDropdownViewDelegate {
  dropDownTapped({ required bool isExpanded });
}

class DoubleTextDropdownView extends StatefulWidget {
  final String textHeader;
  final Function()? textActionTapped;
  bool isExpanded;
  DoubleTextDropdownViewDelegate? delegate;

  DoubleTextDropdownView({
    required this.textHeader,
    required this.isExpanded,
    this.textActionTapped,
    this.delegate
  });

  @override
  State<DoubleTextDropdownView> createState() => _DoubleTextDropdownViewState();
}

class _DoubleTextDropdownViewState extends State<DoubleTextDropdownView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(texto: widget.textHeader,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            Transform.translate(
              offset: const Offset(20, 0),
              child: Row(
                children: [
                  Text("5", style: TextStyle(color: grey)),
                  IconButton(onPressed: () {
                    setState(() {
                      widget.isExpanded = !widget.isExpanded;
                      widget.delegate?.dropDownTapped(isExpanded: widget.isExpanded);
                    });
                  }, icon: Icon(widget.isExpanded
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                      color: grey)),
                ],
              ),
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}
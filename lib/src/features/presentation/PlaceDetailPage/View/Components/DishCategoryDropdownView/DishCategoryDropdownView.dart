
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/DishCategoryDropdownView/DishCategoryDropdownCardView/DishCategoryDropdownContentView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/DoubleTextView/View/DoubleTextDropdownView.dart';

class DishCategoryDropdownView extends StatefulWidget {
  final String headerTitle;
  bool isExpanded = false;

  DishCategoryDropdownView({ Key? key,
                             required this.headerTitle });

  @override
  State<DishCategoryDropdownView> createState() => _DishCategoryDropdownViewState();
}

class _DishCategoryDropdownViewState extends State<DishCategoryDropdownView> with DoubleTextDropdownViewDelegate {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DoubleTextDropdownView(textHeader: widget.headerTitle,
                             delegate: this,
                             isExpanded: widget.isExpanded),
      widget.isExpanded ? DishCategoryDropdownContentView() : Container(),
    ]);
  }

  @override
  dropDownTapped({ required bool isExpanded }) {
    setState(() {
      widget.isExpanded = isExpanded;
    });
  }
}




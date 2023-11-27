
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/CardRatingView/CardRatingView.dart';

class RatingsView extends StatelessWidget {
  List<int> ratingsList;

  RatingsView({ Key? key,
                required this.ratingsList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: getChildrenCards(),
        )
      ],
    );
  }

  List<Widget> getChildrenCards() {
    return ratingsList.map((e) => CardRatingView()).toList();
  }
}



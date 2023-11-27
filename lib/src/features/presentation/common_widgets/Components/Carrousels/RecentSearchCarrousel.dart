

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/VerticalCards/RecentSearchVerticalCardView/RecentSearchVerticalCardView.dart';

class RecentSearchCarrouselView extends StatelessWidget {
  // Dependencies
  final List<PlaceListDetailEntity> placeList;
  RecentSearchCarrouselView({ Key? key, required this.placeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        height: 240.0,
        child: ListView.builder(
          itemCount: placeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RecentSearchVerticalCardView(placeListDetailEntity: placeList[index]);
          },
        ));
  }
}

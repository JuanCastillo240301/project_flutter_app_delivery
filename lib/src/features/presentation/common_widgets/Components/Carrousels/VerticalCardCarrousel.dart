
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/VerticalCards/NoveltyPlacesVerticalCardView/NoveltyPlacesVerticalCardView.dart';

class VerticalCardCarrousel extends StatelessWidget {

  final List<PlaceListDetailEntity> placeList;

  const VerticalCardCarrousel({ Key? key, required this.placeList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350.0,
        child: ListView.builder(
            itemCount: placeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return NoveltyPlacesVerticalCardView(placeListDetailEntity: placeList[index]);
            }));
  }
}





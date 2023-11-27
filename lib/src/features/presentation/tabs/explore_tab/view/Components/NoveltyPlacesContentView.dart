
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Carrousels/VerticalCardCarrousel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';

class NoveltyPlacesContentView extends StatelessWidget {

  // Dependencies
  List<PlaceListDetailEntity> noveltyPlaces = [];

  NoveltyPlacesContentView({ Key? key,
                             required this.noveltyPlaces }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return noveltyPlaces.isEmpty ?
    Container(
      height:20
    ) :
    Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            alignment: Alignment.centerLeft,
            child: const TextView(
                texto: 'Discover new places',
                color: Colors.black,
                fontSize: 30.0)),
        VerticalCardCarrousel(placeList: noveltyPlaces)
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/DefaultImages/DefaultCardImageUrl.dart';

abstract class PlaceListCardViewDelegate {
  placeCardTapped({ required PlaceListDetailEntity placeListDetailEntity });
}

class PlaceListCardView extends StatelessWidget with BaseView {
  final bool hasFreeDelivery;
  final PlaceListDetailEntity placeListDetailEntity;


  PlaceListCardView({ required this.hasFreeDelivery,
                      required this.placeListDetailEntity });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          coordinator.showPlaceDetailPage(context: context,
                                          placeId: placeListDetailEntity.placeId);
        },
        child: Column(
          children: [
            Container(
              height: 125,
              child: SizedBox(
                height: 105,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeftImagePlaceListCardView(imageUrl: placeListDetailEntity.imgs?.first ?? DefaultCardImageUrlHelper.defaultCardImageUrl),
                    RightContentPlaceListCardView(hasFreeDelivery: hasFreeDelivery,
                                                  placeListDetailEntity: placeListDetailEntity)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class LeftImagePlaceListCardView extends StatelessWidget {
  final String imageUrl;
  const LeftImagePlaceListCardView({ Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image(
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl)),
    );
  }
}

class RightContentPlaceListCardView extends StatelessWidget {
  final bool hasFreeDelivery;
  final PlaceListDetailEntity placeListDetailEntity;

  RightContentPlaceListCardView({ required this.hasFreeDelivery,
                                        required this.placeListDetailEntity });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 5),
        height: 125,
        child:
        Column(
          children: [
            SizedBox(
              width: 270,
              child: Text(placeListDetailEntity.placeName,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0)),
            ),
            Container(
              margin: const EdgeInsets.only(top:5),
              width: 270,
              alignment: Alignment.centerLeft,
              child: Text(placeListDetailEntity.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0)),
            ),
            Container(
              width: 270,
              margin: const EdgeInsets.only(top:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16.0),
                  Text("${ placeListDetailEntity.ratingAverage }",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  const SizedBox(width: 5),
                  Text("(${ placeListDetailEntity.ratings } ratings)",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  Transform.translate(
                    offset: const Offset(50,-20),
                    child: SizedBox(
                      width: 100.0,
                      height: 39.0,
                      child: hasFreeDelivery
                          ? const Text('')
                          : const Text(''),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}





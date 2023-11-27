

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/DefaultImages/DefaultCardImageUrl.dart';

class NoveltyPlacesVerticalCardView extends StatelessWidget with BaseView {

  final PlaceListDetailEntity placeListDetailEntity;

  NoveltyPlacesVerticalCardView({ Key? key,
                                        required this.placeListDetailEntity }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        coordinator.showPlaceDetailPage(context: context, placeId: placeListDetailEntity.placeId);
      },
      child: Container(
        width: 210.0,
        margin: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                  width: 210.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(placeListDetailEntity.imgs?.first ?? DefaultCardImageUrlHelper.defaultCardImageUrl)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(placeListDetailEntity.placeName ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(placeListDetailEntity.address ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text("${ placeListDetailEntity.ratingAverage ?? 0.0 }",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
                    Text("(${ placeListDetailEntity.ratings ?? 0.0 } ratings)",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: 80.0,
                        height: 18.0,
                        child: createElevatedButton(
                            shape: const StadiumBorder(),
                            color: orange,
                            labelColor: white,
                            labelButton: 'Delivery',
                            labelFontSize: 11.0))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
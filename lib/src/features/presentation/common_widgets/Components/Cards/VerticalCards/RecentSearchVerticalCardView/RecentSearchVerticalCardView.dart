

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/DefaultImages/DefaultCardImageUrl.dart';

class RecentSearchVerticalCardView extends StatelessWidget {
  final PlaceListDetailEntity placeListDetailEntity;

  RecentSearchVerticalCardView({ required this.placeListDetailEntity });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 200,
      margin: const EdgeInsets.only(top:10, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
                width: 160.0,
                height: 120.0,
                fit: BoxFit.cover,
                image: NetworkImage(placeListDetailEntity.imgs?.first ?? DefaultCardImageUrlHelper.defaultCardImageUrl)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(placeListDetailEntity.placeName,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0))
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(placeListDetailEntity.address,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.0))
              ),
              Container(
                width: 160.0,
                margin: const EdgeInsets.only(top: 5),
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
                            fontSize: 13.0))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

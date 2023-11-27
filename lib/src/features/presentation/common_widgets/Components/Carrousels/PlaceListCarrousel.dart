
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/FavouritesCards/View/FavouritesCardView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/PlaceListCard/View/PlaceListCardView.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:provider/provider.dart';

enum PlaceListCarrouselStyle {
  list, listCards
}

class PlaceListCarrousel extends StatelessWidget with BaseView {

  final List<PlaceListDetailEntity> placeList;
  final bool isShortedVisualization;
  final PlaceListCarrouselStyle carrouselStyle;

   PlaceListCarrousel({ Key? key,
                        required this.placeList,
                        required this.isShortedVisualization,
                        required this.carrouselStyle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount = placeList.length > 3 ? 3 : placeList.length;
    int dynamicHeight = isShortedVisualization ? 120 * itemCount : 210 * placeList.length;

    return Container(
        alignment: Alignment.topCenter,
        width: getScreenWidth(context: context),
        height: dynamicHeight.toDouble(),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isShortedVisualization ? itemCount : placeList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              switch (carrouselStyle) {
                case PlaceListCarrouselStyle.list:
                  return PlaceListCardView(hasFreeDelivery: placeList[index].hasFreeDelivery,
                                           placeListDetailEntity: placeList[index]);
                case PlaceListCarrouselStyle.listCards:
                  return FavouritesCardView(isFavourite: placeList[index].isUserFavourite(userUid: MainCoordinator.sharedInstance?.userUid),
                                            placeListDetailEntity: placeList[index],
                                            // delegate: Provider.of<DefaultUserState>(context)
                                            );
              }
            })
    );
  }
}
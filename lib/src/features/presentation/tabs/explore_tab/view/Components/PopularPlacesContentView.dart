
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Headers/HeaderView.dart';

class PopularPlacesContentView extends StatelessWidget with BaseView {

  List<PlaceListDetailEntity> popularPlaces = [];
  PopularPlacesContentView({ Key? key, required this.popularPlaces }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popularPlaces.isEmpty ?
    Container(
        height: 20
    ) :
    Column(
      children: [
        GestureDetector(
            onTap: () => coordinator.showPlaceListPage(context: context,
                                                       popularPlaces: popularPlaces),
            child: HeaderView(textHeader:"Popular this week",
                              textAction: "Show all")),
        const SizedBox(
          height: 15.0,
        ),
        PlaceListCarrousel(placeList: popularPlaces,
                           isShortedVisualization: true,
                           carrouselStyle: PlaceListCarrouselStyle.list)
      ],
    );
  }
}
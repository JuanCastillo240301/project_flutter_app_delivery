
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ScreenSize/ScreenSizeHelper.dart';



class CollectionDetailPageContentView extends StatelessWidget {

  CollectionDetailEntity collection;
  List<PlaceListDetailEntity> filteredPlacesByCategory;

  CollectionDetailPageContentView({ Key? key,
                                    required this.collection,
                                    required this.filteredPlacesByCategory }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: getScreenHeight(context: context, multiplier: 0.2),
          backgroundColor: orange,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Image(
                    width: double.infinity,
                    height: getScreenHeight(context: context, multiplier: 0.3),
                    fit: BoxFit.cover,
                    image: NetworkImage(collection.img)),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.black45),
                    width: double.infinity,
                    height: getScreenHeight(context: context, multiplier: 0.3)),
                Center(
                  child: TextView(
                      texto: collection.name,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
          leading: Builder(builder: (BuildContext context) {
            return const BackButtonView(color: Colors.white);
          }),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextView(
                          texto: "${ filteredPlacesByCategory.length } places",
                          color: const Color.fromRGBO(51, 58, 77, 1.0),
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -70),
                      child: PlaceListCarrousel(placeList: filteredPlacesByCategory,
                                                isShortedVisualization: false,
                                                carrouselStyle: PlaceListCarrouselStyle.listCards),
                    )
                  ],
                ),
              )
            ]))
      ],
    );
  }
}

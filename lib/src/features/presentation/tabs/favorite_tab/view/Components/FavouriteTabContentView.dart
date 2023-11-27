
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';


class FavouriteTabContentView extends StatelessWidget {

  List<PlaceListDetailEntity> placeList;

  FavouriteTabContentView({ Key? key,
                            required this.placeList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: const Text(''),
          backgroundColor: white,
          title: TextView(
              texto: 'My Favourites',
              color: const ColorScheme.dark().onSecondary,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PlaceListCarrousel(
                    placeList: placeList,
                    isShortedVisualization: false,
                    carrouselStyle: PlaceListCarrouselStyle.listCards),
              )
            ]))
      ],
    );
  }
}

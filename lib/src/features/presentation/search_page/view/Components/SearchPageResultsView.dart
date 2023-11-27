
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/DoubleTextView/View/DoubleTextView.dart';

class SearchPageBuildResultsView extends StatefulWidget {

  // Dependencies
  List<PlaceListDetailEntity> places = [];

  SearchPageBuildResultsView({ Key? key,
                               required this.places }) : super(key: key);

  @override
  State<SearchPageBuildResultsView> createState() => _SearchPageBuildResultsViewState();
}

class _SearchPageBuildResultsViewState extends State<SearchPageBuildResultsView> with BaseView {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const DoubleTextView(textHeader: 'Resultados',
                                       textAction: ''),
                  const SizedBox(height: 20.0),
                  PlaceListCarrousel(placeList: widget.places,
                                     isShortedVisualization: false,
                                     carrouselStyle: PlaceListCarrouselStyle.list)
                ],
              ),
            )
          ]),
        )
      ],
    );
  }

  // // TODO: Por implementar
  // @override
  // applyFilters({ required FiltersModelEntity filters }) {
  //   setState(() {
  //     // TODO: Para cuando vayamos a meter feature de filtros
  //    // widget.places = DefaultPlaceListUseCase.filterPlaceList(places: widget.places, filters: filters);
  //   });
  // }
}

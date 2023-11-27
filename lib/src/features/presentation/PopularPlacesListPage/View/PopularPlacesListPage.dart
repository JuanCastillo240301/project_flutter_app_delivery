
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Carrousels/PlaceListCarrousel.dart';

class PopularPlacesListPage extends StatefulWidget {

  List<PlaceListDetailEntity> popularPlaces = [];
  PopularPlacesListPage({ Key? key,
                          required this.popularPlaces })
                          : super(key: key);

  @override
  State<PopularPlacesListPage> createState() => _PopularPlacesListPageState();
}

class _PopularPlacesListPageState extends State<PopularPlacesListPage> with BaseView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.4,
          leading: Builder(
            builder: (BuildContext context) {
              return const BackButtonView(color: Colors.black);
            },
          )),
      body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  PlaceListCarrousel(
                      placeList: widget.popularPlaces,
                      isShortedVisualization: false,
                      carrouselStyle: PlaceListCarrouselStyle.list)
                ]),
              )
            ],
          )
      ),
    );
  }

//   @override
//   applyFilters({ required FiltersModelEntity filters }) {
//     setState(() {
//       // TODO: Para cuando vayamos a meter feature de filtros
//       // widget.popularPlaces = DefaultPlaceListUseCase.filterPlaceList(places: widget.popularPlaces, filters: filters);
//     });
//   }
// }

// TODO: Para cuando vayamos a meter feature de filtros
/*
actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: IconButton(
                  icon: const Icon(
                    Icons.filter_list,
                    size: 36,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    coordinator.showFiltersPage(context: context, delegate: this);
                  }),
            )
          ],
 */
}
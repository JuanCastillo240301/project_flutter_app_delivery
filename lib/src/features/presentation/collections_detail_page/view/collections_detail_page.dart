import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/Error/ErrorView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/collections_detail_page/view/Components/CollectionDetailPageContentView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/collections_detail_page/viewModel/CollectionDetailPageViewModel.dart';


class CollectionDetailPage extends StatefulWidget {
  CollectionDetailPageViewModel viewModel;

  CollectionDetailPage({ required CollectionDetailPageViewModel collectionDetailPageViewModel })
   : viewModel = collectionDetailPageViewModel;

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> with BaseView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: widget.viewModel.viewInitState(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                if (snapshot.hasError || !snapshot.hasData) {
                  return ErrorView();
                }
                switch(snapshot.data) {
                  case CollectionDetailPageViewState.viewLoadedState:
                    return CollectionDetailPageContentView(collection: widget.viewModel.getCollection(),
                                                           filteredPlacesByCategory: widget.viewModel.filteredPlacesByCategory);
                  default:
                    return ErrorView();
                }
              default:
                return loadingView;
            }
          }),
    );
  }
}

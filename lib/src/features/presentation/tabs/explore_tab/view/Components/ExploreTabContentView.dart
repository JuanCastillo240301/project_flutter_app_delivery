
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/ViewModel/ExploreTabViewModel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/view/Components/CollectionsContentView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/view/Components/NoveltyPlacesContentView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/view/Components/PopularPlacesContentView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/view/Components/SearchTopBar.dart';

class ExploreTabContentView extends StatelessWidget {

  final ExploreViewModel viewModel;

  const ExploreTabContentView({ Key? key, required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SearchTopBar(),
                    NoveltyPlacesContentView(noveltyPlaces: viewModel.noveltyPlaces),
                    PopularPlacesContentView(popularPlaces: viewModel.popularPlaces),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CollectionsContentView(collections: viewModel.collections)
                  ],
                ))
          ]))
    ]);
  }
}



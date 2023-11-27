
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Carrousels/CollectionsCarrousel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Headers/HeaderView.dart';

class CollectionsContentView extends StatelessWidget with BaseView {

  // Dependencies
  List<CollectionDetailEntity> collections = [];

  CollectionsContentView({ Key? key,
                           required this.collections }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return collections.isEmpty ?
    Container(
        height:20
    ) :
    Column(
      children: [
        GestureDetector(
            onTap: () {
              coordinator.showCollectionsPage(context: context, collections: collections);
            },
            child: HeaderView(textHeader:"Collections", textAction: "Show all")),
        CollectionsCarrousel(collections: collections)
      ],
    );
  }
}

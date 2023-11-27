import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/BackButtons/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/CollectionsCard/CollectionsGridCardView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';

class CollectionsPage extends StatelessWidget {

  // Dependencies
  List<CollectionDetailEntity> collections;

  CollectionsPage({ Key? key,
                    required this.collections }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              title: const TextView(texto: 'Collections', fontSize: 17),
              leading: Builder(builder: (BuildContext context) {
                return const BackButtonView(color: Colors.black);
              }),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              sliver: SliverGrid(
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 mainAxisSpacing: 10.0,
                 crossAxisSpacing: 10.0,
                 crossAxisCount: 2,
                 childAspectRatio: 2
               ),
                delegate: SliverChildBuilderDelegate(
                    (ctx, index) {
                      return CollectionGridCardView(collection: collections[index]);
                    },
                    childCount: collections.length
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



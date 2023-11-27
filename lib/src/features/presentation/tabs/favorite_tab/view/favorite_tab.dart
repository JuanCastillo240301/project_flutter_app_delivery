import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/Error/ErrorView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/UserStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/favorite_tab/view/Components/FavouriteTabContentView.dart';
import 'package:provider/provider.dart';
class FavouriteTab extends StatefulWidget {
  const FavouriteTab({ Key? key }) : super(key: key);

  @override
  _FavouriteTabState createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> with BaseView, FavouritePageChangeStateDelegate {

  @override
  Widget build(BuildContext context) {

    Provider.of<DefaultUserStateProvider>(context).favouritePageChangeStateDelegate = this;

    return Scaffold(
      backgroundColor: bgGreyPage,
      body: FutureBuilder(
          future: Provider.of<DefaultUserStateProvider>(context).fetchUserFavouritePlaces(),
          builder: (BuildContext context, AsyncSnapshot<List<PlaceListDetailEntity>> snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                if (snapshot.hasError || !snapshot.hasData) {
                  return ErrorView();
                }
                if (snapshot.hasData) {
                  return FavouriteTabContentView(placeList:snapshot.data ?? []);
                } else {
                  return Container();
                }
              default:
                return loadingView;
            }
          })
    );
  }

  @override
  placeFromFavouritesRemoved() {
   setState(() {});
  }
}

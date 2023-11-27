
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/DishCategoryDropdownView/DishCategoryDropdownView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/FABPlaceDetailView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/FlexibleSpaceBar/FlexibleSpaceBarContentView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/RatingsView/AddYourRatingView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/RatingsView/RatingsView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/RatingsView/YourRatingView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/DoubleTextView/View/DoubleTextView.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ScreenSize/ScreenSizeHelper.dart';


class PlaceDetailContentView extends StatelessWidget with BaseView {

  double price = 56.78;
  final bool isInUserFavourites = true;

  PlaceDetailContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FABRoundedRectangleView(text: 'Añadir 1 por ${price} €',
                                                    onPressed: () {
         // TODO: Add user action
      }, isHidden: false),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.orange,
            expandedHeight: getScreenHeight(context: context, multiplier: 0.35),
            flexibleSpace: const FlexibleSpaceBarContentView(),
            leading: Builder(builder: (BuildContext context) {
              return const BackButtonView(color: Colors.white);
            }),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Image(
                    width: 28,
                    height: 30,
                    image: AssetImage('assets/share.png')),
              ),
              IconButton(
                  icon: Icon(
                    isInUserFavourites ? Icons.bookmark : Icons.bookmark_border,
                    color: isInUserFavourites ? pink : Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    // TODO: Add user action
                  })
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      DishCategoryDropdownView(headerTitle: "Populars"),
                      DishCategoryDropdownView(headerTitle: "Pizzas"),
                      DishCategoryDropdownView(headerTitle: "Kebabs"),
                      const SizedBox(height: 30.0),
                      DoubleTextView(textHeader: "Reviews",
                                     textAction: "See All Reviews",
                                     textActionTapped: () {
                                           
                                     }),
                      const SizedBox(height: 10.0),
                      RatingsView(ratingsList: [1,1,1,1,1].sublist(0,3)),
                      const SizedBox(height: 10.0),
                      userHasRatingInThisPlace()
                          ? YourRatingView()
                          : AddYourRatingView(),
                      const SizedBox(height: 100.0)
                    ],
                  ),
                )
              ]))
        ],
      ),
    );
  }

  bool userHasRatingInThisPlace() {
    return false;
  }
}


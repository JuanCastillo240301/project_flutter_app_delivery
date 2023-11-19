import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Cards/favourites_card.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: white,
            title: createText(
                texto: 'Favorite',
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  createFavouritesCard(
                      context: context,
                      image: AssetImage('assets/stock.png'),
                      title: "Andy & Cindy's Diner",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      ratings: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: true),
                  createFavouritesCard(
                      context: context,
                      image: AssetImage('assets/stock.png'),
                      title: "Andy & Cindy's Diner",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      ratings: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: false),
                  createFavouritesCard(
                      context: context,
                      image: AssetImage('assets/stock.png'),
                      title: "Andy & Cindy's Diner",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      ratings: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: false),
                  createFavouritesCard(
                      context: context,
                      image: AssetImage('assets/stock.png'),
                      title: "Andy & Cindy's Diner",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      ratings: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: false),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

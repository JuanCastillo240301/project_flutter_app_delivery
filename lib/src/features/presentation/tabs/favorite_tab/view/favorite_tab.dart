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
                    image: NetworkImage('https://img.freepik.com/foto-gratis/superficie-madera-mirando-restaurante-vacio_23-2147701348.jpg?w=826&t=st=1700815666~exp=1700816266~hmac=9c571db4eb3cf3351547d34e4ab9dca4ce09b786b867dd98b8c052d66663b254'),
                    title: "Restaurante de Lujo",
                    subtitle: "Av. Constituyentes",
                    review: "4.2",
                    ratings: "(22 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: true),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

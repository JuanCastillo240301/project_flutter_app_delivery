import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/BackButtons/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Cards/favourites_card.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';

class collectionsDetailPage extends StatelessWidget {
  const collectionsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 230,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/stock.png')
                  ),
                  Container(
           width: double.infinity,
            height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 1.5),
           borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Center( 
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createText(texto: 'Asia',color: Colors.white,fontSize: 45, fontWeight: FontWeight.bold),
                createText(texto: '128 places',color: Colors.white,fontSize: 30, fontWeight: FontWeight.w300),
              ],
            ),
          ),
        )

                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context ){
              return createBackButton(context, Colors.orange);
            },),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                   alignment: Alignment.topLeft, 
                   margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: createText(
                      texto: '128 places',
                      color: Color.fromRGBO(51, 58, 77, 1.0), 
                      fontWeight: FontWeight.w600, 
                      fontSize: 17
                      )
                    ),
                    Column(
                      children: [
                    createFavouritesCard(
                    context: context,
                    image: AssetImage(
                    'assets/stock.png'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: true),
                     createFavouritesCard(
                    context: context,
                    image: AssetImage(
                    'assets/stock.png'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: false),
                                         createFavouritesCard(
                    context: context,
                    image: AssetImage(
                    'assets/stock.png'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: false),
                                         createFavouritesCard(
                    context: context,
                    image: AssetImage(
                    'assets/stock.png'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: false),
                      ],
                    )
                ],
              ),
              )
            ]
          )
          )
        ],
      ),
    );
  }
}
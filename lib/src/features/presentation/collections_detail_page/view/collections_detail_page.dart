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
                createText(texto: 'Restaurantes',color: Colors.white,fontSize: 45, fontWeight: FontWeight.bold),
                createText(texto: '10 places',color: Colors.white,fontSize: 30, fontWeight: FontWeight.w300),
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
                      texto: '10 places',
                      color: Color.fromRGBO(51, 58, 77, 1.0), 
                      fontWeight: FontWeight.w600, 
                      fontSize: 17
                      )
                    ),
                    Column(
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
                     createFavouritesCard(
                    context: context,
                    image: NetworkImage('https://img.freepik.com/foto-gratis/restaurante-pared-verde-mesa-madera-hilera-mesas-jardinera-planta-al-fondo_188544-37710.jpg?w=1060&t=st=1700815599~exp=1700816199~hmac=015032e5d5cae16cd392017a4d0b6436d5ce022b93e8687da49e5bf38ffd5fb0'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "C. Adolfo Lopez mateos",
                    review: "4.8",
                    ratings: "(30 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: false),
                                         createFavouritesCard(
                    context: context,
                    image: NetworkImage('https://img.freepik.com/foto-gratis/interior-restaurante_1127-3394.jpg?w=996&t=st=1700815738~exp=1700816338~hmac=222216c9ba250eee7032f7d24da1558543892cec29be75cbd7fbd3a7743170a8'),
                    title: "Grill House",
                    subtitle: "Av. Libertadores",
                    review: "3.9",
                    ratings: "(3 ratings)",
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
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Cards/populares_card.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                _topBar(context),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    alignment: Alignment.centerLeft,
                    child: createText(
                        texto: 'Discover new places',
                        color: Colors.black,
                        fontSize: 30.0)),
                _sliderCards(),
                _headers(context, "Popular this week", "Show all"),
                createPopularesCard(
                    context: context,
                    image: NetworkImage('https://img.freepik.com/foto-gratis/superficie-madera-mirando-restaurante-vacio_23-2147701348.jpg?w=826&t=st=1700815666~exp=1700816266~hmac=9c571db4eb3cf3351547d34e4ab9dca4ce09b786b867dd98b8c052d66663b254'),
                    title: "Restaurante de Lujo",
                    subtitle: "Av. Constituyentes",
                    review: "4.2",
                    ratings: "(22 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true),
                createPopularesCard(
                    context: context,
                   image: NetworkImage('https://img.freepik.com/foto-gratis/restaurante-pared-verde-mesa-madera-hilera-mesas-jardinera-planta-al-fondo_188544-37710.jpg?w=1060&t=st=1700815599~exp=1700816199~hmac=015032e5d5cae16cd392017a4d0b6436d5ce022b93e8687da49e5bf38ffd5fb0'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "C. Adolfo Lopez mateos",
                    review: "4.8",
                    ratings: "(30 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'collections');
                    },
                    child: _headers(context, "Collections", "Show all")),
                _sliderCollections()
              ],
            ),
          ),
        ]))
      ],
    ));
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          width: 350,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(left: 16, top: 20.0),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 236, 239, 1.0)),
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 20.0,
                color: grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text('Search',
                    style: TextStyle(color: grey, fontSize: 17.0)),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _sliderCards() {
  return SizedBox(
      height: 350.0,
      child: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _tarjeta(context);
          }));
}

Widget _tarjeta(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'place-detail');
    },
    child: Container(
      margin: EdgeInsets.all(3.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
                width: 210.0,
                height: 250.0,
                fit: BoxFit.cover,
                image: NetworkImage('https://img.freepik.com/foto-gratis/interior-restaurante_1127-3394.jpg?w=996&t=st=1700815738~exp=1700816338~hmac=222216c9ba250eee7032f7d24da1558543892cec29be75cbd7fbd3a7743170a8'),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text("Grill House",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Av. Libertadores",
                    style: TextStyle(
                        color: grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text("3.9",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  Text("(2 ratings)",
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: createText(texto: textHeader, fontSize: 20.0),
      ),
      Spacer(),
      GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              textAction,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
            Icon(Icons.play_arrow),
          ],
        ),
      ),
    ],
  );
}

Widget _sliderCollections() {
  return Container(
      height: 180.0,
      child: ListView.builder(
        itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _tarjetaCollection(context);
          }));
}

Widget _tarjetaCollection(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigator.pushNamed(context, 'collections');
    },
    child: Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 300,
              height: 150,
              fit: BoxFit.cover,
              image: AssetImage('assets/stock.png'),
            ),
          ),
        ],
      ),
    ),
  );
}

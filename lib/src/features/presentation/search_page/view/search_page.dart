import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Cards/populares_card.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_double.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },
             icon: Icon(Icons.close, color: Colors.black, size: 35.0,),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate.fixed(
            [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child:
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top:25),
                child: Column(
                  children: [
                    createText(texto: 'search',color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
                    _searchInput(context),
                    SizedBox(height: 50.0,),
                    createDoubleText(textHeader: 'recent search',textAction: 'Clear All', func: (){},),
                    SizedBox(height: 10.0,),
                    _sliderCards(),
                    SizedBox(height: 0.0,),
                    createDoubleText(textHeader: 'Recomended for you', textAction: ''),
                    SizedBox(height: 10.0,),
                    createPopularesCard(
                      context: context, 
                    image: NetworkImage('https://img.freepik.com/foto-gratis/superficie-madera-mirando-restaurante-vacio_23-2147701348.jpg?w=826&t=st=1700815666~exp=1700816266~hmac=9c571db4eb3cf3351547d34e4ab9dca4ce09b786b867dd98b8c052d66663b254'),
                    title: "Restaurante de Lujo",
                    subtitle: "Av. Constituyentes",
                    review: "4.2",
                    ratings: "(22 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: false),
                    SizedBox(height: 10.0,),
                    createPopularesCard(
                      context: context, 
                    image: NetworkImage('https://img.freepik.com/foto-gratis/restaurante-pared-verde-mesa-madera-hilera-mesas-jardinera-planta-al-fondo_188544-37710.jpg?w=1060&t=st=1700815599~exp=1700816199~hmac=015032e5d5cae16cd392017a4d0b6436d5ce022b93e8687da49e5bf38ffd5fb0'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "C. Adolfo Lopez mateos",
                    review: "4.8",
                    ratings: "(30 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: false),
                    SizedBox(height: 10.0,),
                    createPopularesCard(
                      context: context, 
                    image: NetworkImage('https://img.freepik.com/foto-gratis/interior-restaurante_1127-3394.jpg?w=996&t=st=1700815738~exp=1700816338~hmac=222216c9ba250eee7032f7d24da1558543892cec29be75cbd7fbd3a7743170a8'),
                    title: "Grill House",
                    subtitle: "Av. Libertadores",
                    review: "3.9",
                    ratings: "(3 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: false),
                  ],
                ),
              )
              )
            ]
          ))
        ],
      ),
    );
  }
}

Widget _searchInput(BuildContext context){
return Container(
  height: 40.0,
  margin: EdgeInsets.only(top: 20.0),
  padding: EdgeInsets.only(left: 0.0),
  decoration: BoxDecoration(
    color: Color.fromRGBO(142, 142, 147, 1.2),
    borderRadius: BorderRadius.circular(20.0)
  ),
  child: TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: 5.0),
      prefixIcon:Icon(Icons.search, color: grey,),
      hintText: 'Seach', 
      border: OutlineInputBorder(
        borderSide: BorderSide.none
      )
    ),
  ),
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
                image: NetworkImage('https://img.freepik.com/foto-gratis/superficie-madera-mirando-restaurante-vacio_23-2147701348.jpg?w=826&t=st=1700815666~exp=1700816266~hmac=9c571db4eb3cf3351547d34e4ab9dca4ce09b786b867dd98b8c052d66663b254'),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text("Restaurante de lujo",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Av. Constituyrntes",
                    style: TextStyle(
                        color: grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
              ),
              
            ],
          )
        ],
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_double.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';

class placeDetailPage extends StatelessWidget {
  const placeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: orange,
          label: createText(
              texto: 'Anadir a cesta',
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w600)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: orange,
            expandedHeight: 365,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                Image(
                    width: double.infinity,
                    height: 395,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/stock.png')),
                Container(
                  width: double.infinity,
                  height: 395,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 1.5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80.0),
                  child: Wrap(
                    children: [
                      _infoplace(),
                      _infoPlaceStats(),
                    ],
                  ),
                ),
              ],
            )),
            leading: Builder(builder: (BuildContext context) {
              return createBackButton(context, Colors.white);
            }),
            actions: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Image(
                  width: 28,
                  height: 28,
                  image: AssetImage('assets/share.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border),
                color: Colors.white,
                iconSize: 39,
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              _header(texto: 'Popular'),
              _sliderCards(),
              _header(texto: 'Full order'),
              _menuList(context),
              SizedBox(
                height: 72,
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _infoplace() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          margin: EdgeInsets.symmetric(vertical: 7.0),
          child: createText(
            texto: 'Hospital General de Celaya',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: grey,
              ),
              createText(
                texto: 'calle ejemplo',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _infoPlaceStats() {
    return Container(
      margin: EdgeInsets.only(top: 130.0),
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      height: 70.0,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 19.0,
                  ),
                  createText(
                      texto: '4.5',
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)
                ],
              ),
              createText(
                  texto: '122 ratings',
                  color: grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500)
            ],
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
              right: BorderSide(color: Colors.white),
              //bottom: BorderSide(color: Colors.white)
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 19.0,
                  ),
                  createText(
                      texto: '137k',
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)
                ],
              ),
              createText(
                  texto: 'Favorites',
                  color: grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500)
            ],
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
              right: BorderSide(color: Colors.white),
              //bottom: BorderSide(color: Colors.white)
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.photo,
                    color: Colors.white,
                    size: 19.0,
                  ),
                  createText(
                      texto: '350',
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)
                ],
              ),
              createText(
                  texto: 'Photos',
                  color: grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ],
      ),
    );
  }

  Widget _header({
    String texto = "",
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      //padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: createDoubleText(textHeader: texto, textAction: ''),
      ),
    );
  }

  Widget _sliderCards() {
    return Container(
        height: 250.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _cards();
            }));
  }

  Widget _cards() {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, 'place-detail');
      },
      child: Container(
        margin: EdgeInsets.all(3.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                  width: 200.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/stock.png')),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text("Andy & Cindy's Diner",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("10 pesos",
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0)),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text("Selecciona",
                          style: TextStyle(
                              color: orange,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 90),
                      child: Image(
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/plus_order.png'),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _menuList(BuildContext context) {
    return Column(
      children: [
        _menuItem(context, 'Citas', '2'),
        _menuItem(context, 'Citas', '2'),
        _menuItem(context, 'Citas', '2'),
      ],
    );
  }

  Widget _menuItem(BuildContext context, String texto, String itemCount) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: grey))),
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            ListTile(
              title: createText(
                  texto: texto, fontSize: 17.0, fontWeight: FontWeight.w300),
              trailing: createText(
                  texto: itemCount,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300),
            ),
            _sliderCards(),
          ],
        ),
      ),
    );
  }
}

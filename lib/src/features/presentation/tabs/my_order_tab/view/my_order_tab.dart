import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/my_order_tab/view/components/empty_order_view.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: orange,
          label: createText(
              texto: 'pagar ahora',
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w600)),
      body: emptyOrderState
          ? emptyOrderView()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                    elevation: 0.5,
                    //leading: Text(''),
                    backgroundColor: white,
                    title: Container(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: createText(
                          texto: 'My order',
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        _orders(context),
                        _orders(context),
                        _orders(context),
                      ],
                    ),
                  )
                ]))
              ],
            ),
    );
  }
}

Widget _orders(BuildContext context) {
  return Column(
    children: [_cardOrders(context)],
  );
}

Widget _cardOrders(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(248, 248, 248, 1.0),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        Row(
          children: [_cardOrderTopContent()],
        ),
        Column(
          children: [
            _items(context),
            _items(context),
            _items(context),
          ],
        )
      ],
    ),
  );
}

Widget _items(BuildContext context) {
  return Container(
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: grey))),
    child: ListTile(
      title: Column(
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
            child: Text("cita",
                style: TextStyle(
                    color: grey, fontWeight: FontWeight.w500, fontSize: 15.0)),
          ),
        ],
      ),
      trailing: Text("1",
          style: TextStyle(
              color: grey, fontWeight: FontWeight.w500, fontSize: 15.0)),
    ),
  );
}

Widget _cardOrderTopContent() {
  return Container(
    padding: EdgeInsetsDirectional.symmetric(vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 7, bottom: 7, right: 7),
          child: createText(
              texto: 'Nombre del establecimiento',
              fontSize: 20.0,
              color: black,
              fontWeight: FontWeight.bold),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: grey,
              ),
              createText(
                texto: 'calle ejemplo',
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/BackButtons/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';

class collectionsPage extends StatelessWidget {
  const collectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: createText(texto: 'Collections', fontSize: 28,textAlign:TextAlign.justify ),
            leading: Builder(builder: (BuildContext context){
              return createBackButton(context,Colors.black);
            },),
          ),
          SliverPadding(padding: 
          EdgeInsets.only(left: 20.0),
          sliver: SliverGrid.count(crossAxisCount: 2,mainAxisSpacing: 10.0,children: [
             _card(context),
              _card(context),
               _card(context),
                _card(context),
                 _card(context),
                  _card(context),
                   _card(context),
                    _card(context),
          ],
          ),
          )
        ],
      ),
    );
  }
}

Widget _card(BuildContext context){
  return GestureDetector(
    onTap: () {
     Navigator.pushNamed(context, 'collections-detail');
    },
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            width: 265,
            height: 290,
            fit: BoxFit.cover,
            image: AssetImage('assets/stock.png'),),
        ),
        Container(
           width: 265,
            height: 290,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 1.5),
           borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
           //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              createText(texto: 'Asia',color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
              createText(texto: '128 places',color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),
            ],
          ),
        )
      ],    
    )
    );
}
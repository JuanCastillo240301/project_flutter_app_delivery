import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
//Commons


Widget createFavouritesCard(
    {required BuildContext context,
    double marginTop = 15.0,
    double marginRight = 0.0,
    double marginBottom = 0.0,
    double marginLeft = 0.0,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle,
    required String review,
    required String ratings,
    String buttonText = '',
    required bool hasActionButton,
    bool isFavourite = true}) {
  return Container(
    margin: EdgeInsets.only(
        top: marginTop,
        right: marginRight,
        bottom: marginBottom,
        left: marginLeft),
    padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
    width: double.infinity,
    //decoration: getBoxDecorationWithShadows(),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child:
              Image(width: 90.0, height: 90.0, fit: BoxFit.cover, image: image),
        ),
        Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 7.0),
                      child: createText(
                          texto: title,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  SizedBox(
                    width: 25.0,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        size: 35.0,
                        color: isFavourite ? Colors.pink : Colors.grey[300],
                      ),
                      onPressed: () {})
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 5.0),
                child: createText(
                    texto: subtitle,
                    color: grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: yellow, size: 16),
                  createText(
                      texto: review,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  createText(
                      texto: ratings,
                      color: grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  // Container(
                  //     margin: EdgeInsets.only(right: 15.0, left: 15.0),
                  //     width: 100.0,
                  //     height: 40.0,
                  //     child: Transform.translate(
                  //       offset: Offset(0, -10),
                  //       child: createElevatedButton(
                  //           color: orange,
                  //           labelButton: buttonText,
                  //           labelFontSize: 11.0,
                  //           shape: StadiumBorder()),
                  //     ))
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

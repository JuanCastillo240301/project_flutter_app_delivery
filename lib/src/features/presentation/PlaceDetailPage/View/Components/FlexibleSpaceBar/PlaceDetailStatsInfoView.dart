
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';


class PlaceDetailStatsInfoView extends StatelessWidget {

  PlaceDetailStatsInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26.0),
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      height: 70.0,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VerticalStatsView(title: "4.5", subtitle: "230 Ratings", icon: Icons.star),
          Container(
            height: 40,
            decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white))),
          ),
          VerticalStatsView(title: "137K", subtitle: "Favourites", icon: Icons.bookmark),
          Container(
            height: 40,
            decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white))),
          ),
          VerticalStatsView(title: "20-30'", subtitle: "Delivery", icon: Icons.punch_clock)
        ],
      ),
    );
  }
}

/*
Container(
            height: 40,
            decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white))),
          ),
          VerticalStatsView(title: "345", subtitle: "Photos", icon: Icons.photo)
 */

class VerticalStatsView extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;

  VerticalStatsView({ Key? key,
                      required this.icon,
                      required this.title,
                      required this.subtitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(
            icon,
            color: Colors.white,
            size: 19.0,
          ),
          TextView(
              texto: '${ title }',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0)
        ]),
        TextView(
            texto: "${ subtitle }",
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 15.0)
      ],
    );
  }
}


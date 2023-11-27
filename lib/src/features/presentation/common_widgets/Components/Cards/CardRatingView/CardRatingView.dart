

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';

class CardRatingView extends StatelessWidget {

  var lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
  CardRatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const Image(
                    width: 49.0,
                    height: 43.0,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1614746713986-0afbec40881f?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextView(
                        texto: 'Mike Smithson',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    TextView(
                        texto: '45 Reviews',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey)
                  ],
                ),
              ),
              const Spacer(),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 60,
                    height: 30,
                    color: orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextView(
                            texto: '4',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                        Icon(Icons.star, color: Colors.white, size: 14)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextView(
                texto: lorem,
                color: grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';


class PlaceDetailInfoView extends StatelessWidget {

  PlaceDetailInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          margin: const EdgeInsets.symmetric(vertical: 7.0),
          child: const TextView(
              texto: "Boon Lay Ho Huat Fried Prawn Noodle",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: const [
              Icon(Icons.location_on, color: Colors.grey),
              TextView(
                  texto: "03 Jameson Manors Apt. 177",
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ],
          ),
        )
      ],
    );
  }
}

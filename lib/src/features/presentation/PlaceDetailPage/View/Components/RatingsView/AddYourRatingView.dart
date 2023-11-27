
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/RatingsView/YourRatingView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/DoubleTextView/View/DoubleTextView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Texts/TextView/View/TextView.dart';


class AddYourRatingView extends StatelessWidget {

  AddYourRatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const DoubleTextView(textHeader: "Your Rating", textAction: ""),
          const SizedBox(height: 16.0),
          RatingsButtons(itemSelected: 5),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 180,
            child:  TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              onChanged: (value) {
                // TODO: Add Logic
              },
              decoration: InputDecoration(
                  hintText: 'What do you think of this place?',
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Add Logic
            },
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              child: const TextView(
                  texto: "+Add your review", // Esto cuando ya tenga review
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
}

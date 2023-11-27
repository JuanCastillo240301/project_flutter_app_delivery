
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/FlexibleSpaceBar/PlaceDetailInfoView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/FlexibleSpaceBar/PlaceDetailStatsInfoView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/Components/FlexibleSpaceBar/PromoPlaceDetailView.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ScreenSize/ScreenSizeHelper.dart';

class FlexibleSpaceBarContentView extends StatelessWidget {

  const FlexibleSpaceBarContentView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          Image(
              width: double.infinity,
              height: getScreenHeight(context: context, multiplier: 0.41),
              fit: BoxFit.fill,
              image: const NetworkImage('https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
          Container(
              decoration:
              const BoxDecoration(color: Colors.black45),
              width: double.infinity,
              height: getScreenHeight(context: context, multiplier: 0.50)),
          Container(
            height: getScreenHeight(context: context, multiplier: 0.50),
            margin: EdgeInsets.only(top: getScreenHeight(context: context, multiplier: 0.04)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PromoPlaceDetailView(),
                PlaceDetailInfoView(),
                PlaceDetailStatsInfoView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

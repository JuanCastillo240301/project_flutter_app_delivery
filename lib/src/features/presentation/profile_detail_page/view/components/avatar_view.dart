import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';

@immutable
class avatarView extends StatelessWidget {
  final String AvatarImage;

 avatarView({required this.AvatarImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          child: CircleAvatar(backgroundImage: AssetImage(AvatarImage),),
        ),
        Transform.translate(
          offset: Offset(0, -35),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: pink, borderRadius: BorderRadius.circular(20)
            ),
            child: Icon(Icons.camera_alt, color: white,size: 20,),
          ),
        )
      ],
    );
  }
}
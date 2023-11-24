import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/BackButtons/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/profile_detail_page/view/components/avatar_view.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/profile_detail_page/view/components/textfields_view.dart';
import 'package:project_flutter_app_delivery/src/utils/extensions/screenSize.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {



  @override
  Widget build(BuildContext context) {
    double? Screenwidth;
    double? Screenheight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: createText(
          texto: 'Edit Profile',
          textAlign: TextAlign.center,
          color: Colors.black,
          fontSize: 17.0
        ),
        elevation: 0.4,
        leading: Builder(builder: (BuildContext context){
          return createBackButton(context, Colors.black);

        }),
        actions: [
          GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
              padding: EdgeInsets.only(top:20.0, right: 15.0),
              child: createText(
                texto: 'done',
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 17.0
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: 
          SliverChildListDelegate(
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
                ),
                
                margin: EdgeInsets.only(top:Screenwidth.getScreenWidth(context: context) *0.1, left: 15,right: 15),
                width: Screenwidth.getScreenWidth(context: context),
                height: Screenheight.getScreenheight(context: context) *0.70,
                child: Column(
                  children: [
                 Transform.translate(
          offset: Offset(0, -15),
                      child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/a/ACg8ocIHoNI2WNV2deDNhANmBZMVcotxhmjeuqiNCXntTcGnFqE=s432-c-no'),
            radius: 50,
          ),
                    ),
                    TextFieldsProfileDetailView()
                  ],
                ),

              )
            ]
          )),
        ],
      ),
    );
  }
}

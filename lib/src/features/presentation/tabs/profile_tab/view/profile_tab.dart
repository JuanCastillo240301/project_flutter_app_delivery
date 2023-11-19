import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'profile-detail'),
              child: _header()),
          _firstBlock()
        ],
      ),
    );
  }
}

Widget _header() {
  return Container(
    height: 250,
    padding: EdgeInsets.all(50),
    child: Container(
      margin: EdgeInsets.only(
        right: 50.0,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/stock.png'),
            radius: 50,
          ),
          Spacer(),
          createText(texto: 'name', fontSize: 20, fontWeight: FontWeight.w600),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                color: grey,
              )),
        ],
      ),
    ),
  );
}

Widget _firstBlock() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        ListTile(
          leading: Image(
            image: AssetImage('assets/noti.png'),
            width: 29,
            height: 29,
          ),
          title: createText(texto: 'Notificaciones'),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                color: grey,
              )),
        ),
        ListTile(
          leading: Image(
            image: AssetImage('assets/logout.png'),
            width: 29,
            height: 29,
          ),
          title: createText(texto: 'Cerrar sesion'),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                color: grey,
              )),
        )
      ],
    ),
  );
}

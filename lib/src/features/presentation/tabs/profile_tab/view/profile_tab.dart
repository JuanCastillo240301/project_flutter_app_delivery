import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/alert_dialog.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/profile_tab/model/ProfileTabViewModel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:provider/provider.dart';
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
    final ProfileTabViewModel _viewModel;

  _ProfileTabState({ ProfileTabViewModel? profileTabViewModel })
          : _viewModel = profileTabViewModel ?? DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

       return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'profile-detail'),
                      child: _header()),
                  _contentProfile(context)
                ],
              ),
            ]
          ))
        ],
      )
    );
  }

  Widget _header() {
    return Container(
      height: 250,
      color: bgGreyPage,
      padding: EdgeInsets.all(40),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
            radius: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    createText(
                        texto: 'Cameron Cook',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    IconButton(
                        icon: Icon(Icons.chevron_right, color: grey),
                        onPressed: () {})
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(left: 20.0),

              )
            ],
          )
        ],
      ),
    );
  }

  Widget _contentProfile(BuildContext context) {
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
            title:
            createText(texto: 'Notifications', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/payicon.png'),
              width: 29,
              height: 29,
            ),
            title:
            createText(texto: 'Payment methods', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/rewardicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'History', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/promoicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'Promo Code', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Image(
              image: AssetImage('assets/settingicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'Settings', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/inviteicon.png'),
              width: 29,
              height: 29,
            ),
            title:
            createText(texto: 'Invite Friends', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/helpicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'Help Center', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/abouticon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'About us', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/logout.png'),
              width: 29,
              height: 29,
            ),
            title:
            Text('Cerrar sesión', style: TextStyle(fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: grey),
            onTap: () => _signOut(context),
          )
        ],
      ),
    );
  }

  Future _signOut(BuildContext context) async {
    await showAlertDialog(context,
        AssetImage('assets/logout.png'),
        'Cierre de sesión en curso',
        "¿Desear salir de la sesión actual?",
        createElevatedButton(
            context: context,
            color: orange,
            labelButton: 'Cerrar Sesión',
            func: () {
                _viewModel.signOut().then( (_) {
                    Navigator.pushReplacement(context,
                                              PageRouteBuilder(pageBuilder: (_,__,___) => WelcomePage(),
                                              transitionDuration: Duration(seconds: 0)
                                              ));
                });
            }));
  }
}
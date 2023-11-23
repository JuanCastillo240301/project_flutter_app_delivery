import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/ErrorAlertView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/alert_dialog.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/view/explore_tab.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/favorite_tab/view/favorite_tab.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/my_order_tab/view/my_order_tab.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/profile_tab/view/profile_tab.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}



class _TabsPageState extends State<TabsPage> {
 @override
 void initState() {
   super.initState();
   Future.delayed(Duration.zero, (){
    _getLocation(context);
   });
   
 }
  List<Widget> _widgetOptions =[
    ExploreTab(),
    MyOrder(),
    FavoriteTab(),
    ProfileTab()
  ];

int _selectedItemIndex = 0;

void _cambiarWidget( int index){
  setState(() {
    _selectedItemIndex = index;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }



Widget _bottomNavigationBar(BuildContext context){
  
 return BottomNavigationBar(
  iconSize: 30.0,
  selectedItemColor: Colors.orange,
  unselectedItemColor: Colors.grey,
  currentIndex: _selectedItemIndex,
  onTap: _cambiarWidget,
  showUnselectedLabels: true,
  items:<BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'Explore'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assignment),
      label: 'My order'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Favorite'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_pin),
      label: 'Profile'
    ),
  ] 
 );
}

Future _getLocation(BuildContext context) async{
  // ErrorAlertView.showErrorAlertDialog(context: context, subtitle: "probando alert", ctaButtonAction:(){Navigator.pop(context);} );
  await showAlertDialog(
    context, 
    AssetImage('assets/location.png'), 
    'Enable Location', 
    'Please allow tho use you location to show nearby sites on the map.', 
    _donebutton(context)
    );
}

Widget _donebutton(BuildContext context){
      return createElevatedButton(
                    height: 45.0,
                    width: 335.0,
                    labelButton: 'Enable Location',
                    color: Colors.orange,
                    shape: const StadiumBorder(),
                    func: () {
                      
                     //Navigator.pushNamed(context, 'login');
                    });
  }

}


import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/ErrorAlertView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/alert_dialog.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/view/explore_tab.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/favorite_tab/view/favorite_tab.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/my_order_tab/view/my_order_tab.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/profile_tab/view/profile_tab.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/tabs_page/ViewModel/TabsPageViewModel.dart';
import 'package:project_flutter_app_delivery/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';
class TabsPage extends StatefulWidget {
  TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with BaseView {

  // Dependencias
  final TabsPageViewModel viewModel;

  _TabsPageState({ TabsPageViewModel? tabsViewModel})
      : viewModel = tabsViewModel ?? DefaultTabsPageViewModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      viewModel.loadingState.setLoadingState(isLoading: true);
      final LocationPermissionStatus currentStatus = await viewModel.getPermissionStatus();
      switch (currentStatus) {
        case LocationPermissionStatus.denied:
          _getCurrentPosition(context);
          break;
        default:
          viewModel.loadingState.setLoadingState(isLoading: false);
          break;
      }
    });
  }

  List<Widget> _widgetOptions = [
    ExploreTab(),
    MyOrder(),
    FavoriteTab(),
    ProfileTab()
  ];

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingState.isLoading ? loadingView : Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}

extension PrivateMethods on _TabsPageState {
  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItemIndex,
        onTap: _changeTab,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'My Order'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Profile')
        ]);
  }

  Future _getCurrentPosition(BuildContext context) async {
    await showAlertDialog(
        context,
        AssetImage('assets/location.png'),
        'Enable Your Location',
        "Please allow to use your location to show nearby restaurant on the map.",
        createElevatedButton(
            context: context,
            color: orange,
            labelButton: 'Enable Location',
            func: () {
              viewModel.getCurrentPosition().then( (result) {
                switch (result.status) {
                  case ResultStatus.success:
                    _closeAlertDialog(context);
                    break;
                  case ResultStatus.error:
                    _closeAlertDialog(context);
                    errorStateProvider.setFailure(context: context, value: result.error!);
                    break;
                }
              });
            }));
  }

  _closeAlertDialog(BuildContext context) {
    viewModel.loadingState.setLoadingState(isLoading: false);
    Navigator.pop(context);
  }
}

extension UserActions on _TabsPageState {
  void _changeTab(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }
}

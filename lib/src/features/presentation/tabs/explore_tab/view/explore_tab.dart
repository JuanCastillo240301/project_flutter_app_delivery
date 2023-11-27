import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Cards/populares_card.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/ViewModel/ExploreTabViewModel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/explore_tab/view/Components/ExploreTabContentView.dart';
import 'package:project_flutter_app_delivery/src/services/GeolocationService/Service/GeolocationService.dart';

class ExploreTab extends StatefulWidget {

  const ExploreTab({Key? key}) : super(key: key);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> with BaseView {
  final ExploreViewModel viewModel;

  _ExploreTabState({ ExploreViewModel? exploreViewModel })
     : viewModel = exploreViewModel ?? DefaultExploreViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: viewModel.viewInitState(),
            builder: (BuildContext context, AsyncSnapshot<ExploreViewModelState> snapshot) {
              switch(snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.error == GeoLocationFailureMessages.locationPermissionsDenied
                      || snapshot.error == GeoLocationFailureMessages.locationPermissionsDeniedForever) {
                  
                    return loadingView;
                  }
                  switch(snapshot.data) {
                    case ExploreViewModelState.viewLoadedState:
                      return ExploreTabContentView(viewModel: viewModel);
                    default:
                      return loadingView;
                  }
                default:
                  return loadingView;
              }
            }
        )
    );
  }
}











import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PlaceDetailPage/View/PlaceDetailPage.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/PopularPlacesListPage/View/PopularPlacesListPage.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/collections_detail_page/view/collections_detail_page.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/collections_detail_page/viewModel/CollectionDetailPageViewModel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/collections_page/view/collections_page.dart';

import 'package:project_flutter_app_delivery/src/features/presentation/welcome_page/view/welcome_page.dart';

class RoutesPath {
  static String welcomePath = "OnboardPage";
  static String loginPath = "login";
  static String signUpPath = "signup";
  static String tabsPath = "tabs";
  static String updatePasswordPath = "forgot";
}

class MainCoordinator {
  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // Exposed Properties
  String? userUid;
  static MainCoordinator? sharedInstance = MainCoordinator();

  MainCoordinator({ FetchLocalStorageUseCase? fetchLocalStorageUseCase,
                    ValidateCurrentUserUseCase? validateCurrentUserCase,
                    SaveLocalStorageUseCase? saveLocalStorageUseCase })
      : _fetchLocalStorageUseCase = fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase = validateCurrentUserCase ?? DefaultValidateCurrentUserUseCase(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  Future<String?> start(BuildContext context) {
    return _isUserLogged(context).then((value) {
      return value == null ? RoutesPath.welcomePath : RoutesPath.tabsPath;
    });
  }

  showWelcomePage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPath.welcomePath);
  }

  showLoginPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPath.loginPath);
  }

  logoutNavigation({ required BuildContext context }) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => WelcomePage(),
            transitionDuration: const Duration(seconds: 0)));
  }

  showSignUpPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPath.signUpPath);
  }

  showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPath.tabsPath);
  }

  showUpdatePasswordPage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPath.updatePasswordPath);
  }

  showPlaceListPage({ required BuildContext context,
                      required List<PlaceListDetailEntity> popularPlaces }) {
    Navigator.push(context,
                   PageRouteBuilder(pageBuilder: (_,__,___) => PopularPlacesListPage(popularPlaces: popularPlaces),
                                    transitionDuration: const Duration(seconds: 0)
                   ));
  }

  showPlaceDetailPage({ required BuildContext context,
                        required String placeId }) async {
    await _saveLocalStorageUseCase.saveRecentSearchInLocalStorage(placeId: placeId);
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => PlaceDetailPage(),
            transitionDuration: const Duration(seconds: 0)
        ));
  }

  showCollectionsPage({ required BuildContext context,
                        required List<CollectionDetailEntity> collections }) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => CollectionsPage(collections: collections),
                         transitionDuration: const Duration(seconds: 0)
        ));
  }

  showCollectionsDetailPage({ required BuildContext context,
                              required CollectionDetailEntity collection }) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => CollectionDetailPage(collectionDetailPageViewModel: DefaultCollectionDetailPageViewModel(collection: collection)),
            transitionDuration: const Duration(seconds: 0)
        ));
  }

  // showFiltersPage({ required BuildContext context,
  //                   required FilterPageDelegate delegate }) {
  //   Navigator.push(context,
  //       PageRouteBuilder(pageBuilder: (_,__,___) => FilterPage(delegate: delegate),
  //           transitionDuration: const Duration(seconds: 0)
  //       ));
  // }

  // showRatingsPage({ required BuildContext context,
  //                   required List<int> ratingsList }) {
  //   _pushPage(context: context,
  //             page: PlaceRatingsPage(ratingsList: ratingsList));
  // }
}

extension PrivateMethods on MainCoordinator {
  Future<String?> _isUserLogged(BuildContext context) async {
    var idToken = await _fetchLocalStorageUseCase.execute(fetchLocalParameteres: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
    userUid = idToken;
    return idToken;
  }

  _pushPage({ required BuildContext context,
              required Widget page }) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => page,
            transitionDuration: const Duration(seconds: 0)
        ));
  }
}

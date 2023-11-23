import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/LoadingView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/ErrorStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';


class BaseView {
 // final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = LoadingView();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
}

abstract class BaseViewModel {
  late LoadingStateProvider loadingState;
  void initState({ required LoadingStateProvider loadingStateProvider });
}

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/ErrorAlertView.dart';
import 'package:provider/provider.dart';
abstract class ErrorStateProviderDelegate {
  void setFailure({ required BuildContext context,
                    required Failure value });
}

class ErrorStateProvider extends ChangeNotifier implements  ErrorStateProviderDelegate {

  late Failure _failure;

  @override
  void setFailure({ required BuildContext context,
                    required Failure value}) {
    _failure = value;
   _showAlert(context: context,
              message: _failure.toString());

    notifyListeners();
  }

  void _showAlert({ required BuildContext context,
                    required String message }) {
    ErrorAlertView.showErrorAlertDialog(context: context,
                                        subtitle: message,
                                        ctaButtonAction: () {
                                            Navigator.pop(context);
                                        });
  }
}

extension ErrorStateProviderExtension on BuildContext {
  showErrorAlert({ required BuildContext context, required String message }) => Provider.of<ErrorStateProvider>(this, listen: false)._showAlert(context: context, message: message);
}
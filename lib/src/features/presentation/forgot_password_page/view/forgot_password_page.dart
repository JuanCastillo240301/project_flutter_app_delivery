import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/alert_dialog.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/forgot_password_page/view/Components/TextFormFieldForgotEmail.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/forgot_password_page/viewModel/ForgotPasswordViewModel.dart';

class ForgotPassword extends StatefulWidget {

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  // Dependencias
  final ForgotPasswordViewModel viewModel;

  _ForgotPasswordState({ ForgotPasswordViewModel? forgotPasswordViewModel })
      : viewModel = forgotPasswordViewModel ?? DefaultForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return createBackButton(context, Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              createText(
                  texto: 'Forgot password',
                  color: primaryColor,
                  fontSize: 30.0),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    'Please enter your email address. You will receive a link to create a new password via email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              TextFormFieldEmailUpdatePassword(viewModel: viewModel),
              createElevatedButton(
                  context: context,
                  color: orange,
                  labelButton: 'Send',
                  shape: StadiumBorder(),
                  func: () => _ctaButtonTapped(context))
            ],
          ),
        ),
      ),
    );
  }
}


extension UserActions on _ForgotPasswordState {
  void _ctaButtonTapped(BuildContext context) {
    viewModel.updatePassword().then( (value) {
      showAlertDialog(
          context,
          AssetImage('assets/lock.png'),
          'Your password has been reset',
          "You'll shortly receive an email with a code to setup a new password.",
          createElevatedButton(
            width: 340,
            height: 40,
              context: context,
              labelButton: 'Done',
              color: orange,
              func: () {
                Navigator.pushNamed(context, 'login');
              }));
    });
  }
}
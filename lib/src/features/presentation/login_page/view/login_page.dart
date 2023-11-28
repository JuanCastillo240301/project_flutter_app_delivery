import 'package:flutter/material.dart';

//import 'package:flutter/rendering.dart';
//iu
import 'package:flutter/services.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
//colors
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/TextFormFields/CustomTextFormField.dart';
//buttons
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/login_page/viewModel/LoginViewModel.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoginPage extends StatelessWidget with BaseView {
  final LoginViewModel _viewModel;

  LoginPage({LoginViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultLoginViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.initState(
        loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));

    return _viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
            body: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          width: double.infinity,
                          height: 350.0,
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://firebasestorage.googleapis.com/v0/b/project-flutter-app-delivery.appspot.com/o/imagen_2023-11-27_074156230.png?alt=media&token=e5f3b750-5959-43f6-8fd1-713954932636',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(), // Puedes personalizar el indicador de carga
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0.0, -20.0),
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Form(
                              key: _viewModel.formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  Text("Welcome Back",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0)),
                                  Text("Login to you account",
                                      style: TextStyle(
                                          color: grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0)),
                                  CustomTextFormField(
                                      textFormFieldType:
                                          CustomTextFormFieldType.email,
                                      hintext: 'Email',
                                      delegate: _viewModel),
                                  CustomTextFormField(
                                      textFormFieldType:
                                          CustomTextFormFieldType.password,
                                      hintext: 'Password',
                                      delegate: _viewModel),
                                  createElevatedButton(
                                      context: context,
                                      color: orange,
                                      labelButton: 'Log in',
                                      func: () {
                                        _ctaButtonTapped(context);
                                      }),
                                  Container(
                                    margin: EdgeInsets.only(top: 30.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, 'forgot');
                                      },
                                      child: Text('Forgot you password?',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17.0)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Don't have an account?",
                                            style: TextStyle(
                                                color: grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0)),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 'signup');
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text('Sign up',
                                                style: TextStyle(
                                                    color: orange,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15.0)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]))
            ],
          ));
  }
}

extension UserActions on LoginPage {
  void _ctaButtonTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel
          .login(
              email: _viewModel.loginModel?.email ?? "",
              password: _viewModel.loginModel?.password ?? "")
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, 'tabs');
            break;
          case ResultStatus.error:
            if (result.error != null) {
              errorStateProvider.setFailure(
                  context: context, value: result.error!);
            }
            break;
        }
      });
    }
  }
}

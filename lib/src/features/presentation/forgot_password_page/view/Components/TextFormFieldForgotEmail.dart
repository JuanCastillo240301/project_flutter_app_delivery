
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/forgot_password_page/viewModel/ForgotPasswordViewModel.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/Validators/FormValidators.dart';

class TextFormFieldEmailUpdatePassword extends StatelessWidget {

  final ForgotPasswordViewModel viewModel;
  const TextFormFieldEmailUpdatePassword({ Key? key,
                                           required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)
        ),
        validator: (value) => EmailFormValidator.validateEmail(email: value ?? ""),
        onChanged: (NewValue) => viewModel.email = NewValue,
      ),
    );
  }
}


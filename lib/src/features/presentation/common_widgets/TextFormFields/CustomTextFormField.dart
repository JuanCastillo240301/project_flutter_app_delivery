
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/Validators/FormValidators.dart';

abstract class TextFormFieldDelegate {
  onChanged({ required String newValue,
              required CustomTextFormFieldType customTextFormFieldType });
}

enum CustomTextFormFieldType {
  email, password, phone, username, dateOfBirth
}

class CustomTextFormField extends StatelessWidget {

  final CustomTextFormFieldType textFormFieldType;
  final String hintext;
  final TextFormFieldDelegate delegate;
  final TextEditingController? _controller;

  CustomTextFormField({ required this.textFormFieldType,
                        required this.hintext,
                        required this.delegate,
                        TextEditingController? controller}) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: bgInputs,
        borderRadius: BorderRadius.circular(40.0)
      ),
      child: TextFormField(
        controller: _controller,
        keyboardType: getKeyboardType(textFormFieldType: textFormFieldType),
        obscureText: textFormFieldType == CustomTextFormFieldType.password ? true : false,
        decoration: InputDecoration(
          hintText: hintext,
          border: OutlineInputBorder(borderSide: BorderSide.none)
        ),
        onChanged: (newValue) => delegate.onChanged(newValue: newValue, customTextFormFieldType: textFormFieldType),
        validator: (value) {
          switch (textFormFieldType) {
            case CustomTextFormFieldType.email:
              return EmailFormValidator.validateEmail(email: value ?? '');
            case CustomTextFormFieldType.password:
              return PasswordFormValidator.validatePassword(password: value ?? '');
            case CustomTextFormFieldType.username:
              return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
            case CustomTextFormFieldType.phone:
              return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
            case CustomTextFormFieldType.dateOfBirth:
              // TODO: Handle this case.
          }
        },
      ),
    );
  }

  TextInputType? getKeyboardType({ required CustomTextFormFieldType textFormFieldType }) {
    switch (textFormFieldType) {
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.username:
        return TextInputType.text;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      case CustomTextFormFieldType.dateOfBirth:
        // TODO: Handle this case.
    }
  }

}

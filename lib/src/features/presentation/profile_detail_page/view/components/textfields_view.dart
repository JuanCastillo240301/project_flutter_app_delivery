import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/utils/extensions/screenSize.dart';
class TextFieldsProfileDetailView extends StatelessWidget {
  //const TextFieldsProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
_createTextFieldUser(context),
SizedBox(height: 20,),
_createTextFieldEmail(context),
SizedBox(height: 20,),
_createTextFieldPhone(context),
SizedBox(height: 20,),
_createTextFieldBirdDate(context),
      ],
    );
  }
}

Widget _createTextFieldUser(BuildContext context){
      double? Screenwidth;
    //double? Screenheight;
return Container(
                width: Screenwidth.getScreenWidth(context: context),
                       decoration: BoxDecoration(
            color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              hintText: 'username',
              border: OutlineInputBorder(borderSide: BorderSide.none
              )
          ),
         // onChanged: (newValue) =>// viewModel.loginModel.email = newValue,
          //validator: (value) => //EmailFormValidator.validateEmail(email: value ?? ''),
        )
);
}

Widget _createTextFieldEmail(BuildContext context){
      double? Screenwidth;
    //double? Screenheight;
return Container(
                width: Screenwidth.getScreenWidth(context: context),
                       decoration: BoxDecoration(
            color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(borderSide: BorderSide.none
              )
          ),
         // onChanged: (newValue) =>// viewModel.loginModel.email = newValue,
          //validator: (value) => //EmailFormValidator.validateEmail(email: value ?? ''),
        )
);
}

Widget _createTextFieldPhone(BuildContext context){
      double? Screenwidth;
    //double? Screenheight;
return Container(
                width: Screenwidth.getScreenWidth(context: context),
                       decoration: BoxDecoration(
            color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              hintText: 'Phone',
              border: OutlineInputBorder(borderSide: BorderSide.none
              )
          ),
         // onChanged: (newValue) =>// viewModel.loginModel.email = newValue,
          //validator: (value) => //EmailFormValidator.validateEmail(email: value ?? ''),
        )
);
}

Widget _createTextFieldBirdDate(BuildContext context){
      double? Screenwidth;
    //double? Screenheight;
return Container(
                width: Screenwidth.getScreenWidth(context: context),
                       decoration: BoxDecoration(
            color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(borderSide: BorderSide.none
              )
          ),
         // onChanged: (newValue) =>// viewModel.loginModel.email = newValue,
          //validator: (value) => //EmailFormValidator.validateEmail(email: value ?? ''),
        )
);
}

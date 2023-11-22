import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder:(BuildContext context)
        {
          return BackButton(color: Colors.black,);
        }
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text('Create an account',style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0
                            ),
                            ),
                            _nameInput(context),
                            _emailInput(context),
                            _phoneInput(context),
                            _datebirthInput(context),
                            _passwordInput(context),
                            _sendbutton(context),
                             Container(
                padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 25.0),
                 child: Text('By clicking Sign up you agree to the following Terms and Conditions without reservation.',
                 textAlign: TextAlign.center,
                 style: TextStyle(               
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0
                              ),
                              ),
               ),

            ],
          ),
        ),
      ),
    );
  }
}



Widget _nameInput(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
            color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              hintText: 'name',
              border: OutlineInputBorder(borderSide: BorderSide.none
              )
          ),

        )
        );
}


Widget _emailInput(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 20.0),
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
Widget _phoneInput(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 20.0),
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

Widget _datebirthInput(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
            color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
              hintText: 'Birth day',
              border: OutlineInputBorder(borderSide: BorderSide.none
              )
          ),
         // onChanged: (newValue) =>// viewModel.loginModel.email = newValue,
          //validator: (value) => //EmailFormValidator.validateEmail(email: value ?? ''),
        )
        );
}

Widget _passwordInput(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
        padding: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
            color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'password',
              border: OutlineInputBorder(borderSide: BorderSide.none
              )
          ),
         // onChanged: (newValue) =>// viewModel.loginModel.email = newValue,
          //validator: (value) => //EmailFormValidator.validateEmail(email: value ?? ''),
        )
        );
}

Widget _sendbutton(BuildContext context){
      return createElevatedButton(
                    height: 45.0,
                    width: 550.0,
                    labelButton: 'Sign up',
                    color: Colors.orange,
                    shape: const StadiumBorder(),
                    func: () {
                      
                    // _showAlert(context);
                    });
  }

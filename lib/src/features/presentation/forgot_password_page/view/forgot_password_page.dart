import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/widgets/rounded_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text('Forgot Password',style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0
                            ),
                            ),
               Container(
                padding: EdgeInsets.all(10.0),
                 child: Text('Enter your email address. you will receive a link to create a new password',
                 textAlign: TextAlign.center,
                 style: TextStyle(               
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0
                              ),
                              ),
               ),
               _emailInput(),
               _sendbutton(context),
            ],
            
          ),
        ),
      ),
    );
  }
}

Widget _emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 40.0),
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


Widget _sendbutton(BuildContext context){
      return createElevatedButton(
                    height: 45.0,
                    width: 550.0,
                    labelButton: 'Reset Password',
                    color: Colors.orange,
                    shape: const StadiumBorder(),
                    func: () {
                      
                     _showAlert(context);
                    });
  }

Widget _donebutton(BuildContext context){
      return createElevatedButton(
                    height: 45.0,
                    width: 335.0,
                    labelButton: 'DONE',
                    color: Colors.orange,
                    shape: const StadiumBorder(),
                    func: () {
                      
                     Navigator.pushNamed(context, 'login');
                    });
  }

  void _showAlert(BuildContext context){
    showDialog(context: context, 
    barrierDismissible: true,
    builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        content: Container(
          height: 350,
          child: Column(
            
            children: [
              Image(image: 
              AssetImage('assets/lock.png'),
              height: 130,
              width: 130,
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                 child: Text('your password has been reset.',
                 textAlign: TextAlign.center,
                 style: TextStyle(               
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                              ),
                              ),
               ),
                Container(
                padding: EdgeInsets.all(15.0),
                 child: Text('Enter your email address. You will receive a link to create a new password via email.',
                 textAlign: TextAlign.center,
                 style: TextStyle(               
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0
                              ),
                              ),
               ),
               _donebutton(context),
            ],
            
          ),
        ),
      );
    });
  }
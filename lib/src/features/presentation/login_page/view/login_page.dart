import 'package:flutter/material.dart';

//import 'package:flutter/rendering.dart';
//iu
import 'package:flutter/services.dart';
//colors
import 'package:project_flutter_app_delivery/src/colors.dart';
//buttons
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/back_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white
      )
    );


    return  Scaffold(
      body: Column(
        children: [
          
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: 350.0,
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/stock.png')
                ),
                Container(
                  margin:  EdgeInsets.only(top: 50.0),
                  child: createBackButton(
                    context, Colors.black
                  ),
                ),
               Positioned(
                  //offset: Offset(0.0, 500.0),
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text('Welcome Back',style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0
                          ),
                          ),
                            Text('Welcome Back',style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0
                          ),
                          ),
                          _emailInput(),
                          _passwordInput(),
                          _loginbutton(context),
                          Container(
                            margin: EdgeInsets.only(top: 30.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, 'forgot');
                              },
                              child: Text('Forgot you password?', style: TextStyle(
                                color:Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                               Navigator.pushNamed(context, 'signup');
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?", style: TextStyle(
                                    color:grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text('Sign Up', style: TextStyle(
                                      color:Colors.orange,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    ),
                                  ),
                                ],
                          
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}


Widget _emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 10.0),
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

Widget _passwordInput(){
      return Container(
        margin: EdgeInsets.only(top: 10.0),
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

Widget _loginbutton(BuildContext context){
      return createElevatedButton(
                    labelButton: 'Log in',
                    color: Colors.orange,
                    shape: const StadiumBorder(),
                    func: () {
                      
                     Navigator.pushNamed(context, 'tabs');
                    });
  }


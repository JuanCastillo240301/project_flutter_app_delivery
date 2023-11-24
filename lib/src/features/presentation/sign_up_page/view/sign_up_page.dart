import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/TextFormFields/CustomTextFormField.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/sign_up_page/viewModel/SignUpViewModel.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget with BaseView {
  
    final SignUpViewModel _viewModel;

  SignUp({super.key,  SignUpViewModel? viewModel }) : _viewModel = viewModel ?? DefaultSignUpViewModel();

  @override
  Widget build(BuildContext context) {

       _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return _viewModel.loadingState.isLoading ? loadingView : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder:(BuildContext context)
        {
          return BackButton(color: Colors.black,);
        }
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: 
          SliverChildListDelegate(
          [
            Center(
        child: Form(
          key: _viewModel.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            CustomTextFormField(textFormFieldType: CustomTextFormFieldType.username,
                                            hintext: 'Username',
                                            delegate: _viewModel),
                        CustomTextFormField(textFormFieldType: CustomTextFormFieldType.email,
                            hintext: 'Email',
                            delegate: _viewModel),
                        CustomTextFormField(textFormFieldType: CustomTextFormFieldType.phone,
                            hintext: 'Phone',
                            delegate: _viewModel),
                             GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: CustomTextFormField(
                                textFormFieldType: CustomTextFormFieldType.dateOfBirth,
                                hintext: 'Date of Birth',
                                delegate: _viewModel,
                                controller: _viewModel.dateController),
                          ),
                        ),
                        CustomTextFormField(textFormFieldType: CustomTextFormFieldType.password,
                            hintext: 'Password',
                            delegate: _viewModel),
                        createElevatedButton(
                            context: context,
                            color: orange,
                            labelButton: 'Sign up',
                            func: () {
                              _ctaTapped(context);
                            }),
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
      ),
          ]
          ))
        ],
      )
    );
  }


}


extension UserActions on SignUp {
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
                                                  initialDate: _viewModel.selectedDate,
                                                  firstDate: DateTime(1960,1),
                                                  lastDate: DateTime(2100),
                                                  locale: Locale('es', ''));

    if (picked != null && picked != _viewModel.selectedDate) {
      _viewModel.signUpModel?.date = "${ picked.toLocal().day }/${ picked.toLocal().month }/${ picked.toLocal().year }";
      _viewModel.dateController.text = "${ picked.toLocal().day }/${ picked.toLocal().month }/${ picked.toLocal().year }";
    }
  }

  void _ctaTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel.signUp().then( (result) {
         switch (result.status) {
           case ResultStatus.success:
             Navigator.pop(context);
             break;
           case ResultStatus.error:
             errorStateProvider.setFailure(context: context,
                                           value: result.error!);
             break;
         }
      });
    }
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Route_page/route_constant.dart';
import '../provider/firebase_provider.dart';
import '../widgets/custom_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userRePasswordController = TextEditingController();


  @override
  void deactivate() {
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userRePasswordController.dispose();
    // TODO: implement deactivate
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseProvide>(builder: (context,value,child){
      return  Scaffold(
        appBar: AppBar(),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                          formFieldController: _userEmailController,
                          hintTextValue: "enter your email",
                          inputType: TextInputType.emailAddress,
                          validatorFunc: (value) {
                            if (value == null || value.isEmpty) {
                              return "user email not empty...";
                            } else if (!value.contains("@")) {
                              return "enter a valid email...";
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        formFieldController: _userPasswordController,
                        hintTextValue: "enter your password",
                        inputType: TextInputType.visiblePassword,
                        suffixIcon: true,
                        validatorFunc: (value) {
                          if (value == null || value.isEmpty) {
                            return "password not empty...";
                          } else if (value.length <= 5) {
                            return "password  should be minimum 6 character...";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        formFieldController: _userRePasswordController,
                        hintTextValue: "enter your Re-password",
                        inputType: TextInputType.visiblePassword,
                        suffixIcon: true,
                        validatorFunc: (value) {
                          if (value == null || value.isEmpty) {
                            return "Re-password not empty...";
                          } else if (value != _userPasswordController.text) {
                            return "Re-enter password should be same";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        btnText: 'Register',
                       // isLoading: value.btnLoading,
                        btnClick: () async {
                          print('hloo');
                          if(_formKey.currentState!.validate()){
                            // setState(() {
                            // });
                            User? user = await value.createUser(_userEmailController.text, _userPasswordController.text);

                            if(user !=null){
                              _userEmailController.clear();
                              _userPasswordController.clear();
                              _userRePasswordController.clear();
                            }
                            // setState(() {
                            // });
                            //print('${user!.uid} ${_emailController.text} ${_passwordController.text}');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          InkWell(
                            onTap:(){
                              Navigator.pushNamed(context,RoutePaths.loginUser);
                            },
                            child:const Text('Already have account?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}

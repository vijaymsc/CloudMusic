import 'package:cloud_music/Route_page/route_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/firebase_provider.dart';
import '../widgets/custom_widgets.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void deactivate() {
    // TODO: implement deactivate
    _emailController.dispose();
    _passwordController.dispose();
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseProvide>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor:  const Color(0xFFFAF9F6),
        body: Padding(
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
                          formFieldController: _emailController,
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
                        formFieldController: _passwordController,
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
                      CustomButton(
                        btnText: 'Login',
                        isLoading: value.btnLoading,
                        btnClick: () async {
                          if(_formKey.currentState!.validate()){
                            // setState(() {
                            // });
                            User? user = await value.loginUser(_emailController.text, _passwordController.text);

                            if(user !=null){
                              _emailController.clear();
                              _passwordController.clear();
                            }  // setState(() {
                            // });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          InkWell(
                            onTap:(){
                              Navigator.pushNamed(context,RoutePaths.register);
                            },
                            child:const Text('Create Account',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child:const Text('Forget Password?',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF11114e)
                              ),
                            ),
                          )
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

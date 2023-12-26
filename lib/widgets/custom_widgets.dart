import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/firebase_provider.dart';

///custom TextFormField
class CustomTextFormField extends StatefulWidget {
   const CustomTextFormField({
    super.key,
required this.formFieldController,
     required this.hintTextValue,
     this.inputType =TextInputType.text,
     required this.validatorFunc,

  });
final TextEditingController formFieldController;
final String hintTextValue;
final TextInputType inputType;
final String? Function(dynamic value) validatorFunc;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(80),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400, blurRadius: 6, spreadRadius: 0.5),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: TextFormField(
            controller: widget.formFieldController,
            keyboardType:widget.inputType,
            decoration:  InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
              fillColor: Colors.white,
              hintText:widget.hintTextValue,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(80),
                  ),
                  borderSide: BorderSide.none
              ),
            ),
             validator:widget.validatorFunc,
          ),
        ),
      ],
    );
  }
}


///custom Button
class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.buttonHeight = 50,
    this.buttonWidth = double.infinity,
    this.borderRadius =10,
    this.btnColor = 0xFF11114e,
    required this.btnText,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.fontSize = 20,
    required this.btnClick,
  });

  final double buttonHeight,buttonWidth,borderRadius,fontSize;
  final int btnColor;
  final String btnText;
  final Color textColor;
  final bool isLoading;
  final Function btnClick;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}
class _CustomButtonState extends State<CustomButton> {
  @override
  void didUpdateWidget(covariant CustomButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
    if(widget.isLoading != oldWidget.isLoading){
print('didUpdateWidget:::${widget.isLoading}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
          print(widget.isLoading);
          widget.btnClick();

      },
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
        height: widget.buttonHeight,
        width: widget.buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:  Color(widget.btnColor),
            borderRadius: BorderRadius.circular(widget.borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              widget.btnText,
              style: TextStyle(
                  color: widget.textColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 20,),
            if(Provider.of<FirebaseProvide>(context,listen: true).btnLoading)
              SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: widget.textColor,
                  )
              )
          ],
        ),
      ),
    );
  }
}
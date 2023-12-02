import 'package:flutter/material.dart';
import 'package:food_order_ui/view/register_page/widgets/text_field_widget/text_field_input.dart';
import 'package:food_order_ui/view/register_page/widgets/text_field_widget/text_field_password.dart';
import 'dart:convert';
import 'dart:async';

class RegisterTextField extends StatefulWidget {
  final Function(String) jsonCallBack;
  const RegisterTextField({Key? key, required this.jsonCallBack})
      : super(key: key);

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  var tempName;
  var tempEmail;
  var tempPassword;
  var tempConPassword;

  void _createJson() {
    Map<String, dynamic> jsonObject = {
      'name': tempName,
      'email': tempEmail,
      'pass': tempPassword,
      'conPass': tempConPassword
    };
    String jsonString = jsonEncode(jsonObject);
    widget.jsonCallBack(jsonString);
  }

  void callBackName(String val) {
    tempName = val;
    // print("Name : $tempName");
  }

  void callBackEmail(String val) {
    tempEmail = val;
    // print("Email : $tempEmail");
  }

  void callBackPassword(String val) {
    tempPassword = val;
    // print('Pass: $val');
  }

  void callBackConPassword(String val) {
    tempConPassword = val;
    // print('ConPass: $val');
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _createJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldInput(
            callback: callBackName,
            text: "Your Name",
            iconName: Icons.account_circle,
            ltext: "Your Name",
          ),
          TextFieldInput(
            callback: callBackEmail,
            text: "Email",
            iconName: Icons.mail,
            ltext: "Email",
          ),
          TextFieldPassword(callback: callBackPassword, data: 'Password'),
          TextFieldPassword(
              callback: callBackConPassword, data: 'Confirm Password')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tal2a/presentation/common/text_field.dart';

import '../resources/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mailController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();

  String _emailError = "";
  String _passwordError = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal:  Responsive.width(6.0,context)),
          child: ListView(
            children: [
              SizedBox(
                height: Responsive.height(6,context),
              ),
              Center(
                child: Image.asset(
                  "assets/images/logo_side.png",
                ),
              ),
              SizedBox(
                height: Responsive.height(12.0,context),
              ),
              TextFieldWidget(
                controller: _mailController,
                title: "كود المستخدم",
              ),
              SizedBox(
                height: Responsive.height(3.0,context),
              ),
              TextFieldWidget(
                controller: _passwordController,
                title: "كلمة السر",
              ),
              SizedBox(
                height: Responsive.height(4.0,context),
              ),
              SizedBox(
                height: Responsive.height(7.0,context),
                child: ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: Text(
                    "تسجيل الدخول",
                  ),
                ),
              ), //Spacer(),
              SizedBox(
                height: Responsive.height(3.0,context),
              ),


            ],
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    String email =
        _mailController.text;
    String password = _passwordController.text;
    if (email.isNotEmpty &&
        password.isNotEmpty) {
      setState(() {
        _passwordError ='';
        _emailError ='';
      });
     /* await AuthService().signInWithEmailAndPassword(
          context: context,
          email: '${_mailController.text}.${widget.type}@tiba.com',
          password: _passwordController.text);*/
    } else {
      setState(() {
        if(email == null || email.isEmpty){
          _emailError = "أدخل اسم مستخدم صالح.";
          _passwordError ='';
        }else {
          _passwordError = "أدخل كلمة مرور صالحة.";
          _emailError ='';
        }
      });
    }
  }
}


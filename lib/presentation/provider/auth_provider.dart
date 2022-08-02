import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showError = false;

  void validate() {
    String email = this.email.text;
    String password = this.password.text;

    if (email.isEmpty) {
      showError = true;
      notifyListeners();
    } else if (password.isEmpty) {
      showError = true;
      notifyListeners();
    } else {
      showError = false;
      notifyListeners();
    }
  }
}

class ForgetPasswordProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void validate() {
    //  String _email = email.text;
    final form = formKey.currentState;
    if (form!.validate()) {
    } else {}
  }
}
class RegisterAdminProvider extends ChangeNotifier {
  TextEditingController
      name = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController(),
      phoneNumber = TextEditingController(),
      email = TextEditingController();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
    } else {}
  }
}

class RegisterClientProvider extends ChangeNotifier {
  TextEditingController code = TextEditingController(),
      name = TextEditingController(),
      companyName = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController(),
      phoneNumber = TextEditingController(),
      phoneNumber2 = TextEditingController(),
      addressLine = TextEditingController();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
    } else {}
  }
}

class RegisterDeliveryProvider extends ChangeNotifier {
  TextEditingController code = TextEditingController(),
      name = TextEditingController(),
      nationalId = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController(),
      phoneNumber = TextEditingController(),
      phoneNumber2 = TextEditingController(),
      addressLine = TextEditingController();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
    } else {}
  }
}

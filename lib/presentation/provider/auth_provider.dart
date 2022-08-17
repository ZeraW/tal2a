import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:tal2a/app/server/admins_api.dart';
import 'package:tal2a/app/server/clients_api.dart';

import '../../app/server/drivers_api.dart';
import '../models/models.dart';

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
  TextEditingController name = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController(),
      phoneNumber = TextEditingController(),
      email = TextEditingController();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void validate(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      print('hello');
      await AdminsApi()
          .registerWithoutLogin(
          newUser: Admin(
                email: email.text,
              name: name.text,
              password: password.text,
              userType: 'admin'))
          .then((value) => context.pop());
    } else {}
  }
}

class RegisterClientProvider extends ChangeNotifier {
  List<Area> areaList = [];
  TextEditingController code = TextEditingController(),
      name = TextEditingController(),
      companyName = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController(),
      phoneNumber = TextEditingController(),
      phoneNumber2 = TextEditingController(),
      addressLine = TextEditingController();
  City? city;
  Area? area;

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void updateCity(City model, List<Area> list) {
    area = null;
    areaList = [];
    areaList.clear();

    city = model;
    areaList.addAll(list);
    areaList.removeWhere((element) => element.cityId != model.id!);
    notifyListeners();
  }

  void updateArea(Area model) {
    area = model;
    notifyListeners();
  }

  void validate(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      await ClientApi()
          .registerDocWithoutLogin(
              newClient: ClientModel(
                  email: code.text,
                  name: name.text,
                  companyName: companyName.text,
                  password: password.text,
                  phone: phoneNumber.text,
                  phone2: phoneNumber2.text,
                  cityId: city!.id,
                  areaId: area!.id,
                  address: addressLine.text,
                  userType: 'client'))
          .then((value) => context.pop());
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
  String vehicle = '';
  City? city;
  Area? area;
  List<Area> areaList = [];

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void updateVehicle(String val) {
    vehicle = val;
    notifyListeners();
  }


  void updateCity(City model, List<Area> list) {
    area = null;
    areaList = [];
    areaList.clear();

    city = model;
    areaList.addAll(list);
    areaList.removeWhere((element) => element.cityId != model.id!);
    notifyListeners();
  }

  void updateArea(Area model) {
    area = model;
    notifyListeners();
  }
  void validate(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      await DriversApi()
          .registerWithoutLogin(
          newUser: Delivery(
              email: code.text,
              name: name.text,
              password: password.text,
              phone: phoneNumber.text,
              phone2: phoneNumber2.text,
              cityId: city!.id,
              areaId: area!.id,
              address: addressLine.text,
              nationalId: nationalId.text,
              vehicle: vehicle,
              userType: 'driver'))
          .then((value) => context.pop());
    } else {}
  }
}

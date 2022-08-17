import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../app/server/shipments_api.dart';
import '../models/models.dart';

class AddShipmentProvider extends ChangeNotifier {
  List<Area> areaList = [];
  TextEditingController code = TextEditingController(),
      name = TextEditingController(),
      fromCity = TextEditingController(),
      companyName = TextEditingController(),
      cost = TextEditingController(),
      shippingCost = TextEditingController(),
      totalCost = TextEditingController(),
      phoneNumber = TextEditingController(),
      phoneNumber2 = TextEditingController(),
      info = TextEditingController(),
      addressLine = TextEditingController(),
      content = TextEditingController(),
      qty = TextEditingController();
  DateTime? date;

  String? shipmentOn;
  City? toCity;
  Area? toArea;
  ClientModel? clientModel;

  double dCost = 0.0, dShippingCost = 0.0, dTotalCost = 0.0;

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void validate(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      Shipment newItem = Shipment(
        addressTo: addressLine.text,
        shipmentOn: shipmentOn,
        areaFrom: clientModel!.areaId!,
        cityFrom: clientModel!.cityId!,
        areaTo: toArea!.id!,
        cityTo: toCity!.id!,
        quantity: double.tryParse(qty.text),
        collectionDate: DateTime.now(),
        arrivalDate: DateTime.now(),
        notes: info.text,
        shipmentDetails: content.text,
        receiverName: name.text,
        receiverPhone1: phoneNumber.text,
        clientId: code.text,
        shipmentPrice: double.tryParse(cost.text),
        shippingPrice: double.tryParse(shippingCost.text),
        total: shipmentOn == "العميل" ? ( double.parse(cost.text) + double.parse(shippingCost.text)) :  double.parse(cost.text),
      );

      for(int i=0; i<49; i++){
       await ShipmentsApi().addData( add: newItem);
      }

   //  await ShipmentsApi().addData( add: newItem).then((value) => context.pop());

    } else {}
  }

  void update(
      {ClientModel? clientData,
      String? shipmentOn,
      Area? toArea,
      City? toCity,
      List<Area>? areaList}) {
    if (clientData != null) {
      clientModel = clientData;
      fromCity.text = clientData.cityId!;
      code.text = clientData.email!;
    } else if (shipmentOn != null) {
      this.shipmentOn = shipmentOn;
      shipmentOn == "العميل"
          ? dTotalCost = dCost + dShippingCost
          : dTotalCost = dCost;
    } else if (toArea != null) {
      this.toArea = toArea;
    } else if (toCity != null && areaList != null) {
      this.toArea = null;
      this.areaList = [];
      this.areaList.clear();
      this.toCity = toCity;
      this.areaList.addAll(areaList);
      this.areaList.removeWhere((element) => element.cityId != toCity.id!);
    }

    notifyListeners();
  }
}

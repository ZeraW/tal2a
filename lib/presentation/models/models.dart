// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/responsive.dart';
import 'package:tal2a/presentation/resources/styles_manager.dart';

import '../common/custom_pluto_column.dart';

part 'models.g.dart';

@JsonSerializable()
class Admin {
  String? id, name, email, password, userType;

  Admin({this.id, this.name, this.email, this.password, this.userType});

  factory Admin.fromJson(var json) => _$AdminFromJson(json);

  Map<String, dynamic> toJson() => _$AdminToJson(this);

  Map<String, PlutoCell> _row(Admin model) {
    return {
      'no': PlutoCell(value: ''),
      'name': PlutoCell(value: '${model.name}'),
      'email': PlutoCell(value: '${model.email}'),
      'action': PlutoCell(value: '${model.id}'),
      'final': PlutoCell(value: ''),
    };
  }

  List<PlutoRow> getRows(List<Admin> mList) {
    return mList.map((e) => PlutoRow(cells: _row(e))).toList();
  }

  List<PlutoColumn> getColumns(BuildContext context) {
    return [
      customPlutoColumn(
          title: '#',
          field: 'no',
          width: 50,
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                (c.rowIdx + 1).toString(),
                maxLines: 2,
                style: getMediumStyle(color: ColorManager.darkGrey),
              ),
            );
          }),
      customPlutoColumn(
          title: 'الاسم', field: 'name', width: Responsive.width(30, context)),
      customPlutoColumn(
          title: 'ايميل', field: 'email', width: Responsive.width(30, context)),
      customPlutoColumn(
          title: 'خيارات',
          field: 'action',
          width: Responsive.width(18.3, context),
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {},
                  iconSize: 18,
                  color: Colors.green,
                  padding: const EdgeInsets.all(0),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                  ),
                  onPressed: () {
                    print(c.cell.value.toString());
                  },
                  iconSize: 18,
                  color: Colors.red,
                  padding: const EdgeInsets.all(0),
                )
              ]),
            );
          }),
      customPlutoColumn(title: '', field: 'final', width: 0),
    ];
  }
}

@JsonSerializable()
class ClientModel {
  String? id,
      name,
      companyName,
      email,
      password,
      userType,
      phone,
      phone2,
      cityId,
      areaId,
      address,
      billingCityId,
      billingAreaId,
      billingAddress;

  factory ClientModel.fromJson(var json) => _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);

  ClientModel({
    this.id,
    this.name,
    this.email,
    this.companyName,
    this.password,
    this.userType,
    this.phone,
    this.phone2,
    this.cityId,
    this.areaId,
    this.address,
    this.billingCityId,
    this.billingAreaId,
    this.billingAddress,
  });

  Map<String, PlutoCell> _row(ClientModel model) {
    return {
      'no': PlutoCell(value: ''),
      'code': PlutoCell(value: '${model.email}'),
      'name': PlutoCell(value: '${model.name}\n${model.companyName}'),
      'address': PlutoCell(value: '${model.address}'),
      'phone': PlutoCell(value: '${model.phone}\n${model.phone2}'),
      'location': PlutoCell(value: '${model.areaId}\n${model.cityId}'),
      'action': PlutoCell(value: '${model.id}'),
      'final': PlutoCell(value: ''),
    };
  }

  List<PlutoRow> getRows(List<ClientModel> mList) {
    return mList.map((e) => PlutoRow(cells: _row(e))).toList();
  }

  List<PlutoColumn> getColumns(BuildContext context) {
    return [
      customPlutoColumn(
          title: '#',
          field: 'no',
          width: 50,
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                (c.rowIdx + 1).toString(),
                maxLines: 2,
                style: getMediumStyle(color: ColorManager.darkGrey),
              ),
            );
          }),
      customPlutoColumn(
          title: 'كود العميل',
          field: 'code',
          width: Responsive.isMobile(context)
              ? 100
              : Responsive.width(9.7, context)),
      customPlutoColumn(
          title: 'الاسم/الشركة',
          field: 'name',
          width: Responsive.isMobile(context)
              ? 220
              : Responsive.width(15, context)),
      customPlutoColumn(
          title: 'هاتف',
          field: 'phone',
          width: Responsive.isMobile(context)
              ? 200
              : Responsive.width(14, context)),
      customPlutoColumn(
          title: 'العنوان',
          field: 'address',
          width: Responsive.isMobile(context)
              ? 250
              : Responsive.width(17, context)),
      customPlutoColumn(
          title: 'المنطقة/المدينة',
          field: 'location',
          width: Responsive.isMobile(context)
              ? 130
              : Responsive.width(12, context)),
      customPlutoColumn(
          title: 'خيارات',
          field: 'action',
          width: 110,
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {},
                  iconSize: 18,
                  color: Colors.green,
                  padding: const EdgeInsets.all(0),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                  ),
                  onPressed: () {
                    print(c.cell.value.toString());
                  },
                  iconSize: 18,
                  color: Colors.red,
                  padding: const EdgeInsets.all(0),
                )
              ]),
            );
          }),
      customPlutoColumn(title: '', field: 'final', width: 0),
    ];
  }
}

@JsonSerializable()
class Delivery {
  String? id,
      name,
      email,
      password,
      userType,
      phone,
      phone2,
      cityId,
      areaId,
      address,
      vehicle,
      nationalId;

  factory Delivery.fromJson(var json) => _$DeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);

  Delivery({
    this.id,
    this.name,
    this.email,
    this.password,
    this.userType,
    this.phone,
    this.phone2,
    this.cityId,
    this.areaId,
    this.address,
    this.vehicle,
    this.nationalId,
  });

  Map<String, PlutoCell> _row(Delivery model) {
    return {
      'no': PlutoCell(value: ''),
      'code': PlutoCell(value: '${model.email}'),
      'name': PlutoCell(value: '${model.name}'),
      'nationalId': PlutoCell(value: '${model.nationalId}'),
      'vehicle': PlutoCell(value: '${model.vehicle}'),
      'address': PlutoCell(value: '${model.address}'),
      'phone': PlutoCell(value: '${model.phone}\n${model.phone2}'),
      'location': PlutoCell(value: '${model.areaId}\n${model.cityId}'),
      'action': PlutoCell(value: '${model.id}'),
      'final': PlutoCell(value: ''),
    };
  }

  List<PlutoRow> getRows(List<Delivery> mList) {
    return mList.map((e) => PlutoRow(cells: _row(e))).toList();
  }

  List<PlutoColumn> getColumns(BuildContext context) {
    return [
      customPlutoColumn(
          title: '#',
          field: 'no',
          width: 50,
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                (c.rowIdx + 1).toString(),
                maxLines: 2,
                style: getMediumStyle(color: ColorManager.darkGrey),
              ),
            );
          }),
      customPlutoColumn(
          title: 'كود العميل',
          field: 'code',
          width:
              Responsive.is1080(context) ? Responsive.width(8, context) : 80),
      customPlutoColumn(
          title: 'الاسم',
          field: 'name',
          width:
              Responsive.is1080(context) ? Responsive.width(12, context) : 180),
      customPlutoColumn(
          title: 'الرقم القومي',
          field: 'nationalId',
          width:
              Responsive.is1080(context) ? Responsive.width(12, context) : 140),
      customPlutoColumn(
          title: 'المركبة',
          field: 'vehicle',
          width:
              Responsive.is1080(context) ? Responsive.width(10, context) : 80),
      customPlutoColumn(
          title: 'هاتف',
          field: 'phone',
          width:
              Responsive.is1080(context) ? Responsive.width(11, context) : 130),
      customPlutoColumn(
          title: 'العنوان',
          field: 'address',
          width: Responsive.is1080(context)
              ? Responsive.width(13.1, context)
              : 205),
      customPlutoColumn(
          title: 'المنطقة/المدينة',
          field: 'location',
          width:
              Responsive.is1080(context) ? Responsive.width(8, context) : 110),
      customPlutoColumn(
          title: 'خيارات',
          field: 'action',
          width:
              Responsive.is1200(context) ? Responsive.width(10, context) : 110,
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {},
                  iconSize: 18,
                  color: Colors.green,
                  padding: const EdgeInsets.all(0),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                  ),
                  onPressed: () {
                    print(c.cell.value.toString());
                  },
                  iconSize: 18,
                  color: Colors.red,
                  padding: const EdgeInsets.all(0),
                )
              ]),
            );
          }),
      customPlutoColumn(title: '', field: 'final', width: 0),
    ];
  }
}

@JsonSerializable()
class City {
  String? id, cost;

  factory City.fromJson(var json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  City({
    this.id,
    this.cost,
  });
}

@JsonSerializable()
class Area {
  String? id, cost, cityId;

  factory Area.fromJson(var json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);

  Area({
    this.id,
    this.cost,
    this.cityId,
  });
}

/*@JsonSerializable()
class Branch {
  String? id, name, cityId, areaId, phone, phone2;
  factory Branch.fromJson(var json) => _$BranchFromJson(json);
  Map<String, dynamic> toJson() => _$BranchToJson(this);

  Branch({
    this.id,
    this.name,
    this.cityId,
    this.areaId,
    this.phone,
    this.phone2,
  });
}*/

@JsonSerializable()
class Shipment {
  String? id,
      clientId,
      deliveryId,
      receiverName,
      receiverPhone1,
      receiverPhone2,
      cityFrom,
      areaFrom,
      cityTo,
      areaTo,
      addressTo,
      shipmentDetails,
      shipmentOn,
      notes;
  Map<String, String>? keyWords;
  double? quantity, shippingPrice, shipmentPrice, discount, total;
  DateTime? arrivalDate, deliveryDate, collectionDate, paymentDate;
  List<Tracking>? tracking;

  factory Shipment.fromJson(var json) => _$ShipmentFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentToJson(this);

  Shipment({
    this.id,
    this.clientId,
    this.deliveryId,
    this.receiverName,
    this.receiverPhone1,
    this.keyWords,
    this.receiverPhone2,
    this.cityFrom,
    this.areaFrom,
    this.cityTo,
    this.areaTo,
    this.addressTo,
    this.shipmentDetails,
    this.shipmentOn,
    this.notes,
    this.quantity,
    this.shippingPrice,
    this.shipmentPrice,
    this.discount,
    this.total,
    this.arrivalDate,
    this.deliveryDate,
    this.collectionDate,
    this.paymentDate,
    this.tracking,
  });
}

@JsonSerializable()
class Tracking {
  DateTime? dateTime;
  String? code, details;

  factory Tracking.fromJson(var json) => _$TrackingFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingToJson(this);

  Tracking({
    this.dateTime,
    this.code,
    this.details,
  });
}

@JsonSerializable()
class Location {
  Map<String, dynamic>? allCities;
  Map<String, dynamic>? allAreas;

  Location({
    this.allCities,
    this.allAreas,
  });

  factory Location.fromJson(var json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class AllAdmins {
  Map<String, dynamic>? allAdmins;

  AllAdmins({
    this.allAdmins,
  });

  factory AllAdmins.fromJson(var json) => _$AllAdminsFromJson(json);

  Map<String, dynamic> toJson() => _$AllAdminsToJson(this);
}

@JsonSerializable()
class AllClients {
  Map<String, dynamic>? allClients;

  AllClients({
    this.allClients,
  });

  factory AllClients.fromJson(var json) => _$AllClientsFromJson(json);

  Map<String, dynamic> toJson() => _$AllClientsToJson(this);
}

@JsonSerializable()
class AllDelivery {
  Map<String, dynamic>? allDelivery;

  AllDelivery({
    this.allDelivery,
  });

  factory AllDelivery.fromJson(var json) => _$AllDeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$AllDeliveryToJson(this);
}

@JsonSerializable()
class ClientShippingReport {
   Map<int, int>? status;
   double? earning, deliveryCost, totalPaid;
   int? totalShipments;
   DateTime? lastEdit;

  ClientShippingReport({
    this.earning,
    this.deliveryCost,
    this.totalPaid,
    this.totalShipments,
    this.lastEdit,
    this.status,
  });

  factory ClientShippingReport.fromJson(var json) =>
      _$ClientShippingReportFromJson(json);

  Map<String, dynamic> toJson() => _$ClientShippingReportToJson(this);
}

@JsonSerializable()
class AdminReport {
  Map<int, int>? status;
  double? totalClientEarning, totalClientPaid, totalClientRemaining;
  double? totalAdminEarning;

  int? totalShipments,totalPaidShipments,totalRemainingShipments;
  DateTime? lastEdit;

  AdminReport({
    this.totalClientEarning,
    this.totalClientPaid,
    this.totalClientRemaining,
    this.totalAdminEarning,

    this.totalShipments,
    this.totalPaidShipments,
    this.totalRemainingShipments,
    this.lastEdit,
    this.status,
  });

  factory AdminReport.fromJson(var json) =>
      _$AdminReportFromJson(json);

  Map<String, dynamic> toJson() => _$AdminReportToJson(this);
}

@JsonSerializable()
class AllShipments {
  Map<String, dynamic>? allShipment;

  AllShipments({
    this.allShipment,
  });

  factory AllShipments.fromJson(var json) => _$AllShipmentsFromJson(json);

  Map<String, dynamic> toJson() => _$AllShipmentsToJson(this);
}
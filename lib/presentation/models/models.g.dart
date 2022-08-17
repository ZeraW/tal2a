// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userType: json['userType'] as String?,
);

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'userType': instance.userType,
};

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) => ClientModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
      password: json['password'] as String?,
      userType: json['userType'] as String?,
      phone: json['phone'] as String?,
      phone2: json['phone2'] as String?,
      cityId: json['cityId'] as String?,
      areaId: json['areaId'] as String?,
      address: json['address'] as String?,
      billingCityId: json['billingCityId'] as String?,
      billingAreaId: json['billingAreaId'] as String?,
      billingAddress: json['billingAddress'] as String?,
);

Map<String, dynamic> _$ClientModelToJson(ClientModel instance) =>
    <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
          'companyName': instance.companyName,
          'email': instance.email,
          'password': instance.password,
          'userType': instance.userType,
          'phone': instance.phone,
          'phone2': instance.phone2,
          'cityId': instance.cityId,
          'areaId': instance.areaId,
          'address': instance.address,
          'billingCityId': instance.billingCityId,
          'billingAreaId': instance.billingAreaId,
          'billingAddress': instance.billingAddress,
    };

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userType: json['userType'] as String?,
      phone: json['phone'] as String?,
      phone2: json['phone2'] as String?,
      cityId: json['cityId'] as String?,
      areaId: json['areaId'] as String?,
      address: json['address'] as String?,
      vehicle: json['vehicle'] as String?,
      nationalId: json['nationalId'] as String?,
);

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'userType': instance.userType,
      'phone': instance.phone,
      'phone2': instance.phone2,
      'cityId': instance.cityId,
      'areaId': instance.areaId,
      'address': instance.address,
      'vehicle': instance.vehicle,
      'nationalId': instance.nationalId,
};

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as String?,
      cost: json['cost'] as String?,
);

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
};

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as String?,
      cost: json['cost'] as String?,
      cityId: json['cityId'] as String?,
);

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'cityId': instance.cityId,
};

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      id: json['id'] as String?,
      clientId: json['clientId'] as String?,
      deliveryId: json['deliveryId'] as String?,
      receiverName: json['receiverName'] as String?,
      receiverPhone1: json['receiverPhone1'] as String?,
      keyWords: (json['keyWords'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
      ),
      receiverPhone2: json['receiverPhone2'] as String?,
      cityFrom: json['cityFrom'] as String?,
      areaFrom: json['areaFrom'] as String?,
      cityTo: json['cityTo'] as String?,
      areaTo: json['areaTo'] as String?,
      addressTo: json['addressTo'] as String?,
      shipmentDetails: json['shipmentDetails'] as String?,
      shipmentOn: json['shipmentOn'] as String?,
      notes: json['notes'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      shippingPrice: (json['shippingPrice'] as num?)?.toDouble(),
      shipmentPrice: (json['shipmentPrice'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      collectionDate: json['collectionDate'] == null
          ? null
          : DateTime.parse(json['collectionDate'] as String),
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      tracking: (json['tracking'] as List<dynamic>?)
          ?.map((e) => Tracking.fromJson(e))
          .toList(),
);

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'deliveryId': instance.deliveryId,
      'receiverName': instance.receiverName,
      'receiverPhone1': instance.receiverPhone1,
      'receiverPhone2': instance.receiverPhone2,
      'cityFrom': instance.cityFrom,
      'areaFrom': instance.areaFrom,
      'cityTo': instance.cityTo,
      'areaTo': instance.areaTo,
      'addressTo': instance.addressTo,
      'shipmentDetails': instance.shipmentDetails,
      'shipmentOn': instance.shipmentOn,
      'notes': instance.notes,
      'keyWords': instance.keyWords,
      'quantity': instance.quantity,
      'shippingPrice': instance.shippingPrice,
      'shipmentPrice': instance.shipmentPrice,
      'discount': instance.discount,
      'total': instance.total,
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'collectionDate': instance.collectionDate?.toIso8601String(),
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'tracking': instance.tracking,
};

Tracking _$TrackingFromJson(Map<String, dynamic> json) => Tracking(
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      code: json['code'] as String?,
      details: json['details'] as String?,
);

Map<String, dynamic> _$TrackingToJson(Tracking instance) => <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'code': instance.code,
      'details': instance.details,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      allCities: (json['allCities'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, City.fromJson(e)),
      ),
      allAreas: (json['allAreas'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, Area.fromJson(e)),
      ),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'allCities': instance.allCities,
      'allAreas': instance.allAreas,
};

AllAdmins _$AllAdminsFromJson(Map<String, dynamic> json) => AllAdmins(
      allAdmins: (json['allAdmins'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, Admin.fromJson(e)),
      ),
);

Map<String, dynamic> _$AllAdminsToJson(AllAdmins instance) => <String, dynamic>{
      'allAdmins': instance.allAdmins,
};

AllClients _$AllClientsFromJson(Map<String, dynamic> json) => AllClients(
      allClients: (json['allClients'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, ClientModel.fromJson(e)),
      ),
);

Map<String, dynamic> _$AllClientsToJson(AllClients instance) =>
    <String, dynamic>{
          'allClients': instance.allClients,
    };

AllDelivery _$AllDeliveryFromJson(Map<String, dynamic> json) => AllDelivery(
      allDelivery: (json['allDelivery']  as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, Delivery.fromJson(e)),
      ),
);

Map<String, dynamic> _$AllDeliveryToJson(AllDelivery instance) =>
    <String, dynamic>{
          'allDelivery': instance.allDelivery,
    };

ClientShippingReport _$ClientShippingReportFromJson(
    Map<String, dynamic> json) =>
    ClientShippingReport(
          earning: (json['earning'] as num?)?.toDouble(),
          deliveryCost: (json['deliveryCost'] as num?)?.toDouble(),
          totalPaid: (json['totalPaid'] as num?)?.toDouble(),
          totalShipments: json['totalShipments'] as int?,
          lastEdit: json['lastEdit'] == null
              ? null
              : DateTime.parse(json['lastEdit'] as String),
          status: (json['status'] as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(int.parse(k), e as int),
          ),
    );

Map<String, dynamic> _$ClientShippingReportToJson(
    ClientShippingReport instance) =>
    <String, dynamic>{
          'status': instance.status?.map((k, e) => MapEntry(k.toString(), e)),
          'earning': instance.earning,
          'deliveryCost': instance.deliveryCost,
          'totalPaid': instance.totalPaid,
          'totalShipments': instance.totalShipments,
          'lastEdit': instance.lastEdit?.toIso8601String(),
    };

AdminReport _$AdminReportFromJson(Map<String, dynamic> json) => AdminReport(
      totalClientEarning: (json['totalClientEarning'] as num?)?.toDouble(),
      totalClientPaid: (json['totalClientPaid'] as num?)?.toDouble(),
      totalClientRemaining: (json['totalClientRemaining'] as num?)?.toDouble(),
      totalAdminEarning: (json['totalAdminEarning'] as num?)?.toDouble(),
      totalShipments: json['totalShipments'] as int?,
      totalPaidShipments: json['totalPaidShipments'] as int?,
      totalRemainingShipments: json['totalRemainingShipments'] as int?,
      lastEdit: json['lastEdit'] == null
          ? null
          : DateTime.parse(json['lastEdit'] as String),
      status: (json['status'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(int.parse(k), e as int),
      ),
);

Map<String, dynamic> _$AdminReportToJson(AdminReport instance) =>
    <String, dynamic>{
          'status': instance.status?.map((k, e) => MapEntry(k.toString(), e)),
          'totalClientEarning': instance.totalClientEarning,
          'totalClientPaid': instance.totalClientPaid,
          'totalClientRemaining': instance.totalClientRemaining,
          'totalAdminEarning': instance.totalAdminEarning,
          'totalShipments': instance.totalShipments,
          'totalPaidShipments': instance.totalPaidShipments,
          'totalRemainingShipments': instance.totalRemainingShipments,
          'lastEdit': instance.lastEdit?.toIso8601String(),
    };

AllShipments _$AllShipmentsFromJson(Map<String, dynamic> json) => AllShipments(
      allShipment: (json['allShipment'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Shipment.fromJson(e)),
      ),
    );

Map<String, dynamic> _$AllShipmentsToJson(AllShipments instance) =>
    <String, dynamic>{
      'allShipment': instance.allShipment,
    };

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

ClientModel _$ClientFromJson(Map<String, dynamic> json) => ClientModel(
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

Map<String, dynamic> _$ClientToJson(ClientModel instance) => <String, dynamic>{
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
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as String?,
      name: json['name'] as String?,
      cityId: json['cityId'] as String?,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityId': instance.cityId,
    };

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      id: json['id'] as String?,
      clientId: json['clientId'] as String?,
      deliveryId: json['deliveryId'] as String?,
      receiverName: json['receiverName'] as String?,
      receiverPhone1: json['receiverPhone1'] as String?,
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
      allDelivery: (json['allDelivery'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Delivery.fromJson(e)),
      ),
    );

Map<String, dynamic> _$AllDeliveryToJson(AllDelivery instance) =>
    <String, dynamic>{
      'allDelivery': instance.allDelivery,
    };

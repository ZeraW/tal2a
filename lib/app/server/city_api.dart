import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../presentation/models/models.dart';

class CityApi {
  final DocumentReference ref = FirebaseFirestore.instance.collection('Data').doc('location');

  //add new data
  Future addData({required City add}) async {
    return await ref.get().then((value) {


      if(value.exists){
        ref.update({'allCities.${add.id!}':add.toJson()});
      }else{
        Location location = Location(allCities: {
          add.id!:add.toJson()
        },allAreas: {});
        return  ref.set(location.toJson());
      }
    });
  }

  //update existing data
  Future updateData({required City update}) async {
    return await ref.update({'allCities.${update.id!}':update});
  }

  //delete existing data
  Future deleteData({required City delete}) async {
    return await  ref.update({'allCities.${delete.id!}':FieldValue.delete()});
  }

  Stream<Location> get getLiveLocation {
    return ref
        .snapshots()
        .map((event) => Location.fromJson(event.data()));
  }

}

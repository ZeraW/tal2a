import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../presentation/models/models.dart';

class AreaApi {
  final DocumentReference ref = FirebaseFirestore.instance.collection('Data').doc('location');

  //add new data
  Future addData({required Area add}) async {
    return await ref.get().then((value) {
      if(value.exists){
        ref.update({'allAreas.${add.id!}':add.toJson()});
      }else{
        Location location = Location(allAreas: {
          add.id!:add.toJson()
        },allCities: {});
        return  ref.set(location.toJson());
      }
    });
  }

  //update existing data
  Future updateData({required Area update}) async {
    return await ref.update({'allAreas.${update.id!}':update});
  }

  //delete existing data
  Future deleteData({required Area delete}) async {
    return await  ref.update({'allAreas.${delete.id!}':FieldValue.delete()});
  }

}

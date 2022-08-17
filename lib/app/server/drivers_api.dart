import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../presentation/models/models.dart';
import 'package:firebase_core/firebase_core.dart';

class DriversApi {

  final DocumentReference ref = FirebaseFirestore.instance.collection('Data').doc('drivers');

  //add new data
  Future _addData({required Delivery add}) async {
    return await ref.get().then((value) {
      if(value.exists){
        ref.update({'allDelivery.${add.id!}':add.toJson()});
      }else{
        AllDelivery model = AllDelivery(allDelivery: {
          add.id!:add.toJson()

        });
        return  ref.set(model.toJson());
      }
    });
  }

  //update existing data
  Future updateData({required Delivery update}) async {
    return await ref.update({'allDelivery.${update.id!}':update});
  }

  //delete existing data
  Future _deleteData({required Delivery delete}) async {
    return await  ref.update({'allDelivery.${delete.id!}':FieldValue.delete()});
  }

  Stream<AllDelivery> get getLiveData {
    return ref
        .snapshots()
        .map((event) => AllDelivery.fromJson(event.data()));
  }


  Future registerWithoutLogin({required Delivery newUser}) async {
    FirebaseApp app = await Firebase.initializeApp(name: 'Secondary', options: Firebase.app().options);
    try {
      UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(
          email: '${newUser.email}@UniCorp.driver', password:newUser.password!);
      User? fbUser = userCredential.user;
      newUser.id = fbUser?.uid;
      await _addData(add: newUser);
      await app.delete();
      // Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        /*Toast.show("The password provided is too weak.", context,
            backgroundColor: Colors.redAccent,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM);*/
      } else if (e.code == 'email-already-in-use') {
       /* Toast.show("Account already exists", context,
            backgroundColor: Colors.redAccent,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM);*/
      }
    } catch (e) {
      print(e);
    }
  }
}

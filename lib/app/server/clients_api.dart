import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../presentation/models/models.dart';
import 'package:firebase_core/firebase_core.dart';

class ClientApi {

  final DocumentReference ref = FirebaseFirestore.instance.collection('Data').doc('clients');

  //add new data
  Future _addData({required ClientModel add}) async {
    return await ref.get().then((value) {
      if(value.exists){
        ref.update({'allClients.${add.id!}':add.toJson()});
      }else{
        AllClients model = AllClients(allClients: {
          add.id!:add.toJson()

        });
        return  ref.set(model.toJson());
      }
    });
  }

  //update existing data
  Future updateData({required ClientModel update}) async {
    return await ref.update({'allClients.${update.id!}':update});
  }

  //delete existing data
  Future _deleteData({required ClientModel delete}) async {
    return await  ref.update({'allClients.${delete.id!}':FieldValue.delete()});
  }

  Stream<AllClients> get getLiveClient {
    return ref
        .snapshots()
        .map((event) => AllClients.fromJson(event.data()));
  }


  Future registerDocWithoutLogin({required ClientModel newClient}) async {
    FirebaseApp app = await Firebase.initializeApp(name: 'Secondary', options: Firebase.app().options);
    try {
      UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(
          email: '${newClient.email}@UniCorp.client', password:newClient.password!);
      User? fbUser = userCredential.user;
      newClient.id = fbUser?.uid;
      await _addData(add: newClient);
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

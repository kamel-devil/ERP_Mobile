import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddSuppliersController with ChangeNotifier {
  List suppliersData = [];

  void addSupplier(String address, String category, String name,
      String phonenumber, double pricerate, double supplierrate) async {
    await FirebaseFirestore.instance.collection('suppliers').doc(name).set({
      'address': address,
      'balance': 0,
      'category': category,
      'name': name,
      "phonenumber": phonenumber,
      "pricerate": pricerate,
      "supplierrate": supplierrate,
      'date': DateTime.now().toIso8601String().toString()
    });
  }

  void addSupplierType(String type) async {
    await FirebaseFirestore.instance.collection('suppliertype').add(
        {'type': type, 'date': DateTime.now().toIso8601String().toString()});
  }

  getSupplier() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("suppliers").get();
    return qn.docs;
  }

  getSupplierType() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("suppliertype").get();
    return qn.docs;
  }
}

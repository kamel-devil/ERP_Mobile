import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryController with ChangeNotifier {
  List materialData = [];

  addMaterial(
      String image,
      String measurement,
      int minimumquantity,
      String type,
      String name,
      int openingbalance,
      double price,
      String productionline,
      int quantity) async {
    if (type == 'منتج التشغيل') {
      type = 'مخزن منتج تحت التشغيل';
    } else if (type == 'مواد خام') {
      type = 'مخزن مواد خام';
    } else if (type == "منتج تام") {
      type = 'مخزن منتج تام';
    }
    await FirebaseFirestore.instance.collection('Materials').doc(name).set({
      'image': image,
      'measurement': measurement,
      "minimumquantity": minimumquantity,
      "type": type,
      'name': name,
      "openingbalance": openingbalance,
      "price": price,
      "productionline": productionline,
      "quantity": quantity,
      'date': DateTime.now().toIso8601String().toString()
    }).then((value) async {
      double total = price * quantity;
      await FirebaseFirestore.instance
          .collection('warehouses')
          .doc(type)
          .collection("Materials")
          .add({
        'id': name,
        'name': name,
        'measurement': measurement,
        "quantity": quantity,
        "price": price,
        'total': total,
      });
    });
  }

  Future getMaterialData() async {
    FirebaseFirestore.instance.collection('Materials').get().then((value) {
      value.docs.forEach((element) {
        materialData.add(element.data());
      });
    });
    notifyListeners();
  }

  getMaterials() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("Materials").get();
    return qn.docs;
  }

  getMeasurements() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("measurements").get();
    return qn.docs;
  }

  void addMeasurements(String addMeasurements) async {
    await FirebaseFirestore.instance.collection('measurements').add({
      'name': addMeasurements,
      'date': DateTime.now().toIso8601String().toString()
    });
  }
}

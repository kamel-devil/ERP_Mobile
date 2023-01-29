import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PurchaseController with ChangeNotifier {
  double? beforeBalance;
  double? afterBalance;

  Future addBill(String id, double balance, String supID, double residual,
      double total) async {
    await FirebaseFirestore.instance
        .collection('treasuryactions')
        .doc(id)
        .get()
        .then((value1) async {
      await FirebaseFirestore.instance
          .collection('treasuryactions')
          .doc(id)
          .set(
        {'balance': value1['balance'] - balance},
        SetOptions(merge: true),
      );
    }).then((value2) async {
      await FirebaseFirestore.instance
          .collection('suppliers')
          .doc(supID)
          .get()
          .then((value3) async {
        await FirebaseFirestore.instance.collection('suppliers').doc(supID).set(
          {'balance': value3['balance'] + residual},
          SetOptions(merge: true),
        );
      });
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection('warehouses')
          .doc('مخزن مواد خام')
          .get()
          .then((val) async {
        beforeBalance = val['balance'];
        afterBalance = val['balance'] + total;
        await FirebaseFirestore.instance
            .collection('warehouses')
            .doc('مخزن مواد خام')
            .set(
          {'balance': val['balance'] + total},
          SetOptions(merge: true),
        );
      });
    });
  }

  addPurchasing({
    required String date,
    required String state,
    required String trasury,
    required String supName,
    required double podownpayment,
    required int totalQuantity,
    required double poshippingfees,
    required double remainbalance,
    required double total,
    required List purData,
    required String measurement,
  }) async {
    await FirebaseFirestore.instance.collection('addpurchasing').add({
      'date': date,
      'suppliername': supName,
      'postatus': state,
      'total': total,
      'trasury': trasury,
      'podownpayment': podownpayment,
      'poshippingfees': poshippingfees,
      'recevingDate': '',
      'remainbalance': remainbalance,
      'poname': '',
      'image': '',
    }).then((value) async {
      purData.forEach((element) async {
        await FirebaseFirestore.instance
            .collection('addpurchasing')
            .doc(value.id)
            .collection('rawmaterials')
            .add({
          'id': value.id,
          'unit': element['measurement'],
          'price': element['price'].toString(),
          'requirequantity': element['quantity'].toString(),
          'name': element['name'],
          'image': element['image'],
          'totalprice': element['total'].toString(),
        });
      });
      await FirebaseFirestore.instance.collection('actions').add({
        'treasury': trasury,
        'totalmaterialcost': total + poshippingfees,
        'totalcost': total,
        'suppliername': supName,
        'quantity': totalQuantity,
        'poimage': '',
        'notes': '',
        'name': '',
        'movecost': 0,
        'measurement': measurement,
        'materialcost': 0,
        'details': 'خامات',
        'date': date,
        'currentvalue': 0,
        'afterquantity': afterBalance,
        'beforequantity': beforeBalance,
        'actiontype': 'شراء',
        'actiontaker': 'admin',
        'actionreference': value.id,
      });
    });
  }
}

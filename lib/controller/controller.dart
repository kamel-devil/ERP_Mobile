import 'package:erp_app/view/home/taps/home_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/category/add_cat.dart';
import '../view/category/category.dart';
import '../view/industry/confirm_indus.dart';
import '../view/industry/indus_orders.dart';
import '../view/purchases/add_purchase_bill.dart';
import '../view/purchases/purchases.dart';
import '../view/store/stores.dart';
import '../view/suppliers/suppliers.dart';

class Controller extends GetxController {
  Widget current = HomeTap();

//
  List screen = [
    [Container(), Stock(), Container()],
    [
      Container(),
      Container(),
      Container(),
      Suppliers(),
    ],
    [
      const AddCat(),
      const Categories(),

    ],
    [const AddPurchaseBill(), const Purchases(),],
    [
      Container(),
      Container(),
      const ConfirmIndus(),
      const IndustryOrder(),

    ]
  ];

  void changePage(Widget page) {
    current = page;
    update();
  }
}

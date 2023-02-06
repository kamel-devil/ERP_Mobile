import 'package:erp_app/view/accounts/add_expenses.dart';
import 'package:erp_app/view/accounts/add_origins.dart';
import 'package:erp_app/view/accounts/expenses.dart';
import 'package:erp_app/view/accounts/origins.dart';
import 'package:erp_app/view/accounts/pay_convenent.dart';
import 'package:erp_app/view/accounts/payment_home.dart';
import 'package:erp_app/view/home/taps/home_tap.dart';
import 'package:erp_app/view/hr/advance_exchange.dart';
import 'package:erp_app/view/orders/add_orders.dart';
import 'package:erp_app/view/orders/companies_representatives.dart';
import 'package:erp_app/view/orders/required_list.dart';
import 'package:erp_app/view/reports/Statement_financial_position.dart';
import 'package:erp_app/view/reports/list_input.dart';
import 'package:erp_app/view/system_admin/follow_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/accounts/convenent.dart';
import '../view/category/add_cat.dart';
import '../view/category/category.dart';
import '../view/industry/confirm_indus.dart';
import '../view/industry/indus_orders.dart';
import '../view/orders/orders_details.dart';
import '../view/purchases/add_purchase_bill.dart';
import '../view/purchases/purchases.dart';
import '../view/store/stores.dart';
import '../view/suppliers/suppliers.dart';

class Controller extends GetxController {
  Widget current = const HomeTap();

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

    ],
    [
      const AddOrder(),
      Talabat(),
      companies_representatives(),
      RequiredList(),
      Container(),
      Container(),
      Container(),

    ],
    [
      ListInput(),
      Container(),
      const StatementFinancialPosition(),
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
    ],
    [
      AddExpenses(),
      const Expenses(),
      Container(),
      const PaymentHome(),
      Container(),
      Container(),
      const Origins(),
      const AddOrigins(),
      Container(),
      Container(),
      Container(),
      const Convenent(),// 3hdh
      const PayCovenant()

    ],
    [
      Container(),
      Container(),
      Container(),
      const FollowUser(),
    ],
    [
      Container(),
      Container(),
      Container(),
      Container(),
      AdvanceExchange()
    ]
  ];

  void changePage(Widget page) {
    current = page;
    update();
  }
}

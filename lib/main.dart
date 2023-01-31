import 'package:erp_app/routes/routes.dart';
import 'package:erp_app/view/category/add_cat.dart';
import 'package:erp_app/view/home/homepage.dart';
import 'package:erp_app/view/industry/confirm_indus.dart';
import 'package:erp_app/view/orders/account_statement.dart';
import 'package:erp_app/view/orders/add_orders.dart';
import 'package:erp_app/view/orders/orders_details.dart';
import 'package:erp_app/view/purchases/confirm_purchase.dart';
import 'package:erp_app/view/store/stores.dart';
import 'package:erp_app/view/suppliers/suppliers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'view/purchases/add_purchase_bill.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      // routeInformationParser: const QRouteInformationParser(),
      // routerDelegate: QRouterDelegate(Routes.routes),
      debugShowCheckedModeBanner: false,
      title: 'ERB System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddCat(),
    );
  }
}

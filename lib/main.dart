import 'package:erp_app/view/orders/account_statement.dart';
import 'package:erp_app/view/orders/add_orders.dart';
import 'package:erp_app/view/store/stores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MaterialApp(
      // routeInformationParser: const QRouteInformationParser(),
      // routerDelegate: QRouterDelegate(Routes.routes),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      title: 'ERB System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddOrder(),
    );
  }
}

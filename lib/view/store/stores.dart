
import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/default_botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/controller/store_controller/add_store_controller.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/size_config.dart';
import 'package:erp_app/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stock extends StatefulWidget {
  Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  List<String> columnData = [
    "الرصيد",
    "المخزن",
  ];

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
    }
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(20));
    return SafeArea(
        child: Scaffold(
            body:  SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: DefaultContainer(title: 'المخازن'),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        DefaultTable(
                          columnData: columnData,
                          size: getProportionateScreenWidth(100),
                          color: ColorManager.second,
                          rows: data
                              .map((data) => DataRow(cells: [
                            DataCell(Text(
                              data['1'].toString(),
                              style: style,
                            )),
                            DataCell(Text(
                              data['2'],
                              style: style,
                            )),
                          ]))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}

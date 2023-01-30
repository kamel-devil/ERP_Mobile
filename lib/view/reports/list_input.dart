
import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_row.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../resources/style_manager.dart';

class ListInput extends StatefulWidget {
  ListInput({Key? key}) : super(key: key);

  @override
  State<ListInput> createState() => _ListInputState();
}

class _ListInputState extends State<ListInput> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? state;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
      });
    }
  }

  Future<void> _select1Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: stateDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != stateDate) {
      setState(() {
        stateDate = pickedDate;
      });
    }
  }

  List data = [
    {"1": "االيرادات", "2": "١٢٠٠"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
  ];

  List<String> columnData = [
    "البند",
    "المبلغ",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(20));
    return SafeArea(
      child: Scaffold(
          body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 64,
                              ),
                              DefaultContainer(
                                title: 'قائمة الدخل',
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Column(
                                    children: [
                                      Text(
                                        'الي تاريخ',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(150),
                                        height: 60,
                                        child: ElevatedButton(
                                          onPressed: () => _select1Date(context),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          child: Text(
                                            "${stateDate.year.toString()}/${stateDate.month.toString().padLeft(2, '0')}/${stateDate.day.toString().padLeft(2, '0')}",
                                            style: const TextStyle(
                                              color: Color(0xff82225E),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'من تاريخ ',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(150),
                                        height: 60,
                                        child: ElevatedButton(
                                          onPressed: () => _selectDate(context),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          child: Text(
                                            "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                            style: const TextStyle(
                                              color: Color(0xff82225E),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefaultTable(
                                      color: ColorManager.second,
                                      columnData: columnData,
                                      size: getProportionateScreenWidth(20),
                                      rows: data
                                          .map((data) => DataRow(cells: [
                                        DataCell(Text(
                                          data['1'],
                                          style: style,
                                        )),
                                                DataCell(Text(
                                                  data['2'],
                                                  style: style,
                                                )),

                                              ]))
                                          .toList(),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 95),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: List.generate(
                                            data.length,
                                                (index) => Column(
                                              children: [
                                                SizedBox(
                                                    width:
                                                    getProportionateScreenWidth(
                                                        100),
                                                    height: 36,
                                                    child: dropDown(
                                                      const [
                                                        'تفاصيل',
                                                      ],
                                                      selectTalab:
                                                      index == selectedIndex
                                                          ? chose1
                                                          : chose2,
                                                      onchanged: () => (val) {
                                                        QR.to(
                                                            '/revenue_details');
                                                        setState(() {
                                                          selectedIndex = index;
                                                          chose1 = val;
                                                        });
                                                      },
                                                      label: 'خيارات',
                                                      foColor: Colors.white,
                                                      bgColor:
                                                      ColorManager.primary,
                                                      dpColor:
                                                      ColorManager.primary,
                                                    )),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            )),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                         DefaultAppBar(),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}

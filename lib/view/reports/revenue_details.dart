import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';
import '../../resources/style_manager.dart';

class RevenueDetails extends StatefulWidget {
  RevenueDetails({Key? key}) : super(key: key);

  @override
  State<RevenueDetails> createState() => _RevenueDetailsState();
}

class _RevenueDetailsState extends State<RevenueDetails> {
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
    {"1": "تكلفة البضاعة المباعة", "2": "200"},
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
    return Scaffold(
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
                              title: 'تفاصيل الايرادات',
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
                                      size: getProportionateScreenWidth(80),
                                      rows: [
                                        ...data
                                            .map((data) => DataRow(cells: [
                                                  DataCell(Text(
                                                    data['1'],
                                                  )),
                                                  DataCell(Text(
                                                    data['2'],
                                                  )),
                                                ]))
                                            .toList(),
                                        DataRow(
                                            color: MaterialStateProperty.all(
                                                ColorManager.primary),
                                            cells: [
                                              DataCell(
                                                  Container(
                                                    color: ColorManager.primary,
                                                    child: Text(
                                                      'الاجمالي',
                                                      style: TextStyle(
                                                          color: ColorManager
                                                              .white,
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  15),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                  placeholder: true),
                                              DataCell(Text(
                                                " 250",
                                                style: TextStyle(
                                                    color: ColorManager.white,
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            15),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                            ])
                                      ]),
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
    ));
  }
}


import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../resources/style_manager.dart';

class PaymentShoping extends StatefulWidget {
  PaymentShoping({Key? key}) : super(key: key);

  @override
  State<PaymentShoping> createState() => _PaymentShopingState();
}

class _PaymentShopingState extends State<PaymentShoping> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? state;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  TextEditingController controller = TextEditingController();

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
    {"1": "تكلفة البضاعة المباعة", "2": "-200", "3": "100", "4": "1000"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200", "3": "100", "4": "1000"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200", "3": "100", "4": "1000"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200", "3": "100", "4": "1000"},
  ];

  List<String> columnData = [
    "اسم المصروف",
    "المبلغ",
    "التاريخ",
    "بواسطه",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(20));
    return SafeArea(
      child: Scaffold(
          body: Stack(
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
                            title: 'مصروفات التشغيل\n    والتسويق',
                          ),

                          Column(
                            children: [
                              Text(
                                ' البحث',
                                style: getSemiBoldStyle(
                                    color: ColorManager.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(150),
                                height: 60,
                                child: DefaultInputForm(
                                  controller: controller,
                                  perFix: const Icon(Icons.search),
                                  hint: '',
                                  label: '',
                                  onTab: () {},
                                  validate: () {},
                                  onSave: () {},
                                  passFun: () {},
                                  color: Colors.white70,
                                  obscureText: false,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

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
                                    rows: [
                                      ...data
                                          .map((data) => DataRow(cells: [
                                        DataCell(Text(
                                          data['1'],
                                          style: style,
                                        )),
                                        DataCell(Text(
                                          data['2'],
                                          style: style,
                                        )),
                                        DataCell(Text(
                                          data['3'],
                                          style: style,
                                        )),

                                        DataCell(Text(
                                                  data['4'],
                                                  style: style,
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
                                                        color:
                                                        ColorManager.white,
                                                        fontSize:
                                                        getProportionateScreenWidth(
                                                            20),
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
                                                      20),
                                                  fontWeight: FontWeight.w800),
                                            )),
                                            const DataCell(Text(
                                              '',
                                            )),

                                            const DataCell(Text(
                                              '',
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
    );
  }
}

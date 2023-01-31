import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class PaymentHome extends StatefulWidget {
  const PaymentHome({Key? key}) : super(key: key);

  @override
  State<PaymentHome> createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {
  String? chose;
  String? chose1;
  String? chose2;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  int? selectedIndex;
  String? title;
  String? id;
  String? balance;

  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "خزينة المصنع",
      "2": "2000",
    },
    {
      "1": "ahmed",
      "2": "2000",
    }, {
      "1": "ahmed",
      "2": "2000",
    },
  ];

  List<String> columnData = [
    "الاسم",
    "الرصد",
  ];

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
        initialDate: orderDate1,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate1) {
      setState(() {
        orderDate1 = pickedDate;
      });
    }
  }

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  DefaultContainer(title: 'البنوك و الخزينه و\n   وسائل الدفع'),

                  Column(
                    children: [
                      Text(
                        ' البحث',
                        style: getSemiBoldStyle(
                            color: ColorManager.black,
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller1,
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
                            'من التاريخ',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(20)),
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
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text(
                                "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                  fontSize: 18,

                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'الي التاريخ',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(20)),
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
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text(
                                "${orderDate1.year.toString()}/${orderDate1.month.toString().padLeft(2, '0')}/${orderDate1.day.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                DefaultTable(
                                    columnData: columnData,
                                    size: getProportionateScreenWidth(50),
                                    color: ColorManager.second,
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
                                              ]))
                                          .toList(),
                                    ]),
                                // isVisible1
                                //     ? Row(
                                //   mainAxisAlignment:
                                //   MainAxisAlignment
                                //       .center,
                                //   children: [
                                //     EditTreasury(
                                //       title: title,
                                //       id: id,
                                //       balance: balance,
                                //     ),
                                //     const SizedBox(
                                //       width: 5,
                                //     ),
                                //     InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           isVisible1 =
                                //           false;
                                //         });
                                //       },
                                //       child: CircleAvatar(
                                //         backgroundColor:
                                //         ColorManager
                                //             .primary,
                                //         radius: 30,
                                //         child: const Icon(Icons
                                //             .close_rounded),
                                //       ),
                                //     ),
                                //   ],
                                // )
                                //     : Container(),
                                // isVisible2
                                //     ? Row(
                                //   mainAxisAlignment:
                                //   MainAxisAlignment
                                //       .center,
                                //   children: [
                                //     TransferTreasury(),
                                //     const SizedBox(
                                //       width: 5,
                                //     ),
                                //     InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           isVisible2 =
                                //           false;
                                //         });
                                //       },
                                //       child: CircleAvatar(
                                //         backgroundColor:
                                //         ColorManager
                                //             .primary,
                                //         radius: 30,
                                //         child: const Icon(Icons
                                //             .close_rounded),
                                //       ),
                                //     ),
                                //   ],
                                // )
                                //     : Container(),
                                // isVisible3
                                //     ? Row(
                                //   mainAxisAlignment:
                                //   MainAxisAlignment
                                //       .center,
                                //   children: [
                                //     PayFromTreasury(),
                                //     const SizedBox(
                                //       width: 5,
                                //     ),
                                //     InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           isVisible3 =
                                //           false;
                                //         });
                                //       },
                                //       child: CircleAvatar(
                                //         backgroundColor:
                                //         ColorManager
                                //             .primary,
                                //         radius: 30,
                                //         child: const Icon(Icons
                                //             .close_rounded),
                                //       ),
                                //     ),
                                //   ],
                                // )
                                //     : Container(),
                                // isVisible4
                                //     ? Row(
                                //   mainAxisAlignment:
                                //   MainAxisAlignment
                                //       .center,
                                //   children: [
                                //     const SizedBox(
                                //       width: 5,
                                //     ),
                                //     InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           isVisible4 =
                                //           false;
                                //         });
                                //       },
                                //       child: CircleAvatar(
                                //         backgroundColor:
                                //         ColorManager
                                //             .primary,
                                //         radius: 30,
                                //         child: const Icon(Icons
                                //             .close_rounded),
                                //       ),
                                //     ),
                                //   ],
                                // )
                                //     : Container(),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 95, right: 16, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                                data.length,
                                (index) => Column(
                                      children: [
                                        SizedBox(
                                            width: getProportionateScreenWidth(
                                                140),
                                            child: dropDown(
                                              const [
                                                'تعديل',
                                                ' تحويل',
                                                ' مسحوبات',
                                                ' ايداع',
                                                ' كشف حساب',
                                              ],
                                              selectTalab:
                                                  index == selectedIndex
                                                      ? chose1
                                                      : chose2,
                                              // onchanged: () =>
                                              //     (val) {
                                              //   if (val ==
                                              //       'تعديل') {
                                              //     setState(() {
                                              //       isVisible1 =
                                              //       true;
                                              //       title = treasury[
                                              //       index]
                                              //       ['name'];
                                              //       id = treasury[
                                              //       index]
                                              //       ['id'];
                                              //       balance = treasury[
                                              //       index]
                                              //       [
                                              //       'balance']
                                              //           .toString();
                                              //     });
                                              //   } else if (val ==
                                              //       ' تحويل') {
                                              //     setState(() {
                                              //       isVisible2 =
                                              //       true;
                                              //     });
                                              //   } else if (val ==
                                              //       ' مسحوبات') {
                                              //     setState(() {
                                              //       isVisible3 =
                                              //       true;
                                              //     });
                                              //   } else if (val ==
                                              //       ' ايداع') {
                                              //     setState(() {
                                              //       isVisible4 =
                                              //       true;
                                              //     });
                                              //   } else if (val ==
                                              //       ' كشف حساب') {
                                              //     QR.to(
                                              //         '/account_details');
                                              //   }
                                              //   setState(() {
                                              //     selectedIndex =
                                              //         index;
                                              //     chose1 = val;
                                              //   });
                                              // },
                                              label: 'خيارات',
                                              foColor: Colors.white,
                                              bgColor: ColorManager.primary,
                                              dpColor: ColorManager.primary,
                                              onchanged: () => (val) {
                                                setState(() {
                                                  selectedIndex = index;
                                                  chose1 = val;
                                                });
                                              },
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
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          DefaultAppBar()
        ],
      ),
    ));
  }
}

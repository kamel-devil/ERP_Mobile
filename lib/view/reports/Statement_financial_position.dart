
import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

class StatementFinancialPosition extends StatefulWidget {
  const  StatementFinancialPosition({Key? key}) : super(key: key);

  @override
  State<StatementFinancialPosition> createState() =>
      _StatementFinancialPositionState();
}

class _StatementFinancialPositionState
    extends State<StatementFinancialPosition> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "الاصول",
      "2": "١٢٠",
    },
    {
      "1": "الاصول",
      "2": "١٢٠",
    },
    {
      "1": "الاصول",
      "2": "١٢٠",
    },
    {
      "1": "الاصول",
      "2": "١٢٠",
    },
    {
      "1": "الاصول",
      "2": "١٢٠",
    },
    {
      "1": "الاصول",
      "2": "١٢٠",
    },
  ];

  List<String> columnData = [
    "البيان",
    "رصيد",
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
                  DefaultContainer(title: 'قائمة المركز المالي'),

                  Column(
                    children: [
                      Text(
                        ' البحث',
                        style: getSemiBoldStyle(
                            color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 5,
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
                                "${orderDate1.year.toString()}/${orderDate1.month.toString().padLeft(2, '0')}/${orderDate1.day.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                  color: Colors.black,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              DataRow(
                                  color: MaterialStateProperty.all(
                                      ColorManager.primary),
                                  cells: [
                                    DataCell(
                                        Container(
                                          color: ColorManager.primary,
                                          child: Text(
                                            'الاجمالي الالتزامات',
                                            style: TextStyle(
                                                color: ColorManager.white,
                                                fontSize:
                                                getProportionateScreenWidth(
                                                    20),
                                                fontWeight:
                                                FontWeight.w800),
                                          ),
                                        ),
                                        placeholder: true),

                                    DataCell(Text(
                                      " ٧٢٠",
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize:
                                              getProportionateScreenWidth(
                                                  20),
                                          fontWeight: FontWeight.w800),
                                    )),
                                  ])
                            ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Botton(
                    bgColor: Colors.black,
                    color: Colors.white,
                    title: 'المزيد',
                    onTap: () {},
                  )
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

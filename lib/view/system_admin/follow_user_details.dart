
import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

class FollowUsersDetails extends StatefulWidget {
  const FollowUsersDetails({Key? key}) : super(key: key);

  @override
  State<FollowUsersDetails> createState() => _FollowUsersDetailsState();
}

class _FollowUsersDetailsState extends State<FollowUsersDetails> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  DateTime orderDate = DateTime.now();
  TextEditingController controller1 = TextEditingController();
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

  List data = [
    {
      "1": "احمد",
      "2": "١/١٢/٢٠٢٢",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "022",
    },
  ];

  List<String> columnData = [
    "المستخدم",
    "التاريخ",
    "الحركه",
    "التوقيت",
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultContainer(title: 'تتبع المستخدمين'),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      Column(
                        children: [
                          Text(
                            'التاريخ',
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
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DefaultTable(
                            columnData: columnData,
                            size: getProportionateScreenWidth(40),
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

import 'package:dropdown_search/dropdown_search.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:flutter/material.dart';

import '../../components/appBar.dart';
import '../../components/default_container.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class Approvals extends StatefulWidget {
  const Approvals({Key? key}) : super(key: key);

  @override
  State<Approvals> createState() => _ApprovalsState();
}

class _ApprovalsState extends State<Approvals> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? userName;
  String? state;

  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "EX1",
      "3": "500 جنيه",
      "4": "تسويق",
      "5": "200 طلب",
      "6": "1:22 مساء",
    },
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "EX1",
      "3": "500 جنيه",
      "4": "تسويق",
      "5": "200 طلب",
      "6": "1:22 مساء",
    },
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "EX1",
      "3": "500 جنيه",
      "4": "تسويق",
      "5": "200 طلب",
      "6": "1:22 مساء",
    },
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                DefaultContainer(title: 'المصروفات'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          ' التاريخ',
                          style: getSemiBoldStyle(color: ColorManager.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(140),
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => _selectDate(context),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
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
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: 60,
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          showSearchBox: true,
                          searchFieldProps:
                              TextFieldProps(cursorColor: ColorManager.primary),
                          // disabledItemFn:
                          //     (String s) =>
                          //         s.startsWith('I'),
                        ),
                        items: [],
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "بحث",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: 60,
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          showSearchBox: true,
                          searchFieldProps:
                              TextFieldProps(cursorColor: ColorManager.primary),
                          // disabledItemFn:
                          //     (String s) =>
                          //         s.startsWith('I'),
                        ),
                        items: ['الكل', 'محمد مصطفي', 'احمد علاء'],
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "Enter Name",
                          ),
                        ),
                        onChanged: (v) {
                          setState(() {
                            userName = v;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(150),
                      height: 100,
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const [
                          'رفض ',
                          ' قبول',
                          'في الانتظار',
                        ],
                        selectTalab: state,
                        onchanged: () => (val) {
                          setState(() {
                            state = val;
                          });
                        },
                        label: 'الحالة',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(10),
                              height: 220,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'المستخدم :',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['3'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            ' الحركة :',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['4'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ' الحالة :',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['5'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'توقيت الارسال :',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['6'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            data[index]['1'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                        1,
                                        (index) => PopupMenuButton(
                                              iconSize:
                                                  getProportionateScreenWidth(
                                                      50),
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: const Text(' قبول'),
                                                  onTap: () {},
                                                ),
                                                PopupMenuItem(
                                                  value: 2,
                                                  child: const Text('رفض'),
                                                  onTap: () {},
                                                ),
                                                PopupMenuItem(
                                                  value: 3,
                                                  child: const Text('تفاصيل'),
                                                  onTap: () {},
                                                ),
                                              ],
                                            )),
                                  ),
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 5,
                            ),
                        itemCount: data.length))
              ],
            ),
          ),
          DefaultAppBar()
        ],
      ),
    ));
  }
}

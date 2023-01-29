import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/assets_manager.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();

  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? payment;
  String? city;
  String? typeCustomer;

  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  DateTime chargeDate = DateTime.now();

  String search = '';

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
  ];

  List<String> columnData = [
    "اسم المنتج",
    "الكميةالمطلوبة",
    "الوحده",
    "سعر البيع",
    "اجمالي سعر البيع",
    "صورةالمنتج",
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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(20));
    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              DefaultContainer(
                title: 'اضافة الطلب',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'اسم العميل',
                          style: style,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(140),
                          height: 60,
                          child: DefaultInputForm(
                            controller: controller1,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(90),
                          padding: const EdgeInsets.only(top: 35),
                          child: dropDown(
                            const ["facebook", "website", "phone call"],
                            selectTalab: selectTalab,
                            onchanged: () => (val) {
                              setState(() {
                                selectTalab = val;
                              });
                            },
                            label: 'مصدر الطلب',
                            foColor: Colors.white,
                            bgColor: ColorManager.primary,
                            dpColor: ColorManager.primary,
                          ),
                        ),
                        Container(
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(90),
                          padding: const EdgeInsets.only(top: 35),
                          child: dropDown(
                            const [
                              "الكل",
                              "طلب مؤكد",
                              "تم الشحن",
                              "تم التحصيل",
                              "تم الاستلام",
                              "تم الصيانة",
                              "ملغى",
                              "رفض الاستلام"
                            ],
                            selectTalab: stateTalab,
                            onchanged: () => (val) {
                              setState(() {
                                stateTalab = val;
                              });
                            },
                            label: 'حالة الطلب',
                            foColor: Colors.white,
                            bgColor: ColorManager.primary,
                            dpColor: ColorManager.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: getProportionateScreenWidth(190),
                          height: getProportionateScreenHeight(90),
                          padding: const EdgeInsets.only(top: 35),
                          child: dropDown(
                            const [
                              "Small products",
                              "Medium products",
                              "Huge products"
                            ],
                            selectTalab: shippingMethods,
                            onchanged: () => (val) {
                              setState(() {
                                shippingMethods = val;
                              });
                            },
                            label: 'طرق الشحن',
                            foColor: Colors.white,
                            bgColor: ColorManager.primary,
                            dpColor: ColorManager.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'تاريخ الطلب',
                              style: style,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () => _selectDate(context),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: Text(
                                  "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          getProportionateScreenWidth(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(90),
                          padding: const EdgeInsets.only(top: 35),
                          child: dropDown(
                            const ["افراد", "شركه"],
                            selectTalab: typeCustomer,
                            onchanged: () => (val) {
                              setState(() {
                                typeCustomer = val;
                              });
                            },
                            label: "نوع العميل",
                            foColor: Colors.white,
                            bgColor: ColorManager.primary,
                            dpColor: ColorManager.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(50),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: const Color(0xff82225E)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_drop_down_outlined,
                                    color: Color(0xff82225E)),
                                items: [
                                  "الكل",
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                value: city,
                                onChanged: (val) {
                                  setState(() {
                                    city = val;
                                  });
                                },
                                hint: const Text(
                                  "المدينة",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: Colors.white,
                                style:
                                    const TextStyle(color: Color(0xff82225E)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(50),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: const Color(0xff82225E)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_drop_down_outlined,
                                    color: Color(0xff82225E)),
                                items: [
                                  "الكل",
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                value: governorate,
                                onChanged: (val) {
                                  setState(() {
                                    governorate = val;
                                  });
                                },
                                hint: const Text(
                                  "المحافظة",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: Colors.white,
                                style:
                                    const TextStyle(color: Color(0xff82225E)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'رقم الموبيل 1',
                              style: style,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(140),
                              height: 60,
                              child: DefaultInputForm(
                                controller: controller2,
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
                              'رقم الموبيل 2',
                              style: style,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(140),
                              height: 60,
                              child: DefaultInputForm(
                                controller: controller3,
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
                        )
                      ],
                    ),
                    Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(90),
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const [
                          "طلب جديد",
                          "طلب استبدال",
                          "طلب صيانة",
                          "طلب مرتجع",
                        ],
                        selectTalab: typeOrder,
                        onchanged: () => (val) {
                          setState(() {
                            typeOrder = val;
                          });
                        },
                        label: 'اسم الصنف',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DefaultTable(
                  columnData: columnData,
                  size: getProportionateScreenWidth(5),
                  color: ColorManager.primary,
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
                    DataCell(Text(
                      data['3'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['4'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['5'],
                      style: style,
                    )),


                    DataCell(Image.asset(
                              'assets/images/23.png',
                              width: 50,
                              height: 50,
                            )),
                          ]))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

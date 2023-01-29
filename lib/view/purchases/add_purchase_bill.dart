import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';

import 'package:erp_app/resources/assets_manager.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:erp_app/resources/value_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:erp_app/view/home/drop_down_par.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPurchaseBill extends StatefulWidget {
  const AddPurchaseBill({Key? key}) : super(key: key);

  @override
  State<AddPurchaseBill> createState() => _AddPurchaseBillState();
}

class _AddPurchaseBillState extends State<AddPurchaseBill> {
  String? chose;
  String? chose1;
  String? chose2;
  DateTime orderDate = DateTime.now();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController quantity = TextEditingController();

  int? selectedIndex;
  List data1 = [];
  List finalData = [];

  String? catName;
  String? catPrice;
  String? catMeasurement;
  String? image;
  double totalTotal = 0;
  int totalQuantity = 0;
  String? bank;
  String? supName;

  List<String> columnData = [
    "",
    "صوره الصنف",
    "الاجمالي",
    "السعر",
    "الوحده",
    "الكميه المطلوبه",
    "اسم الصنف",
  ];
  List data = [];

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
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              DefaultContainer(title: 'اضافه فاتوره مشتريات'),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'التاريخ',
                        style: getSemiBoldStyle(color: ColorManager.black),
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
                            style: TextStyle(
                              color: ColorManager.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'اسم المورد',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: 60,
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                                cursorColor: ColorManager.primary),
                            // disabledItemFn:
                            //     (String s) =>
                            //         s.startsWith('I'),
                          ),
                          items: [],
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "Enter Name",
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              supName = v;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: getProportionateScreenWidth(150),
                height: getProportionateScreenHeight(90),
                padding: const EdgeInsets.only(top: 35),
                child: dropDown(
                  const ['تم الطلب', 'تم الاستلام'],
                  selectTalab: chose,
                  onchanged: () => (val) {
                    setState(() {
                      chose = val;
                    });
                  },
                  label: 'حاله الشراء',
                  foColor: Colors.white,
                  bgColor: ColorManager.primary,
                  dpColor: ColorManager.primary,
                ),
              ),

              const SizedBox(
                height: 32,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(

                    children: [
                      Text(
                        'اسم الصنف',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: 60,
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                                cursorColor: ColorManager.primary),
                            // disabledItemFn:
                            //     (String s) =>
                            //         s.startsWith('I'),
                          ),
                          items: [],
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "اسم الصنف",
                            ),
                          ),
                          // onChanged: (v) async {
                          //   await FirebaseFirestore
                          //       .instance
                          //       .collection(
                          //       'Materials')
                          //       .doc(v)
                          //       .get()
                          //       .then((value) {
                          //     catPrice =
                          //         value['price']
                          //             .toString();
                          //     catName = v;
                          //     catMeasurement = value[
                          //     'measurement'];
                          //     image =
                          //     value['image'];
                          //     quantity.text = '0';
                          //     total.text = '0';
                          //     data1.add({
                          //       "name": v,
                          //       'quantity': value[
                          //       'quantity'],
                          //       "measurement": value[
                          //       'measurement'],
                          //       'price':
                          //       value['price'],
                          //       'image':
                          //       value['image'],
                          //     });
                          //   });
                          //
                          //   print(v);
                          //   setState(() {});
                          // },
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DefaultTable(
                        columnData: columnData,
                        size: getProportionateScreenWidth(15),
                        color: ColorManager.primary,
                        rows: [
                          ...finalData
                              .map((data) => DataRow(cells: [
                                    DataCell(InkWell(
                                        onTap: () {
                                          finalData.remove(data);
                                          setState(() {});
                                        },
                                        child: const Icon(Icons.close_rounded))),
                                    DataCell(Image.network(
                                      data['image'],
                                      width: 50,
                                      height: 50,
                                    )),
                                    DataCell(Container(
                                      color: Colors.grey,
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        data['total'].toString(),
                                        style: style,
                                      ),
                                    )),
                                    DataCell(Text(
                                      data['price'].toString(),
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['measurement'],
                                      style: style,
                                    )),
                                    DataCell(Container(
                                      color: Colors.grey,
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        data['quantity'],
                                        style: style,
                                      ),
                                    )),
                                    DataCell(Text(
                                      data['name'],
                                      style: style,
                                    )),
                                  ]))
                              .toList(),
                          ...data1
                              .map((data) => DataRow(cells: [
                                    DataCell(InkWell(
                                        onTap: () {
                                          data1.remove(data);
                                          setState(() {});
                                        },
                                        child: const Icon(Icons.close_rounded))),
                                    DataCell(Image.network(
                                      data['image'],
                                      width: 50,
                                      height: 50,
                                    )),
                                    DataCell(
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: TextFormField(
                                          readOnly: false,
                                          controller: total,
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(4)),
                                          onChanged: (v) {},
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.2)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  AppSize.s15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.2),
                                            ),
                                            hintStyle:
                                                const TextStyle(fontSize: 14),
                                            label: Container(
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  '',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(Text(
                                      data['price'].toString(),
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['measurement'],
                                      style: style,
                                    )),
                                    DataCell(
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: TextFormField(
                                          controller: quantity,
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(4)),
                                          onChanged: (v) {
                                            setState(() {
                                              if (v.isNotEmpty) {
                                                total = TextEditingController(
                                                    text:
                                                        "${data['price'] * num.parse(v)}");
                                              } else {
                                                total = TextEditingController(
                                                    text: "0");
                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.2)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  AppSize.s15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.2),
                                            ),
                                            hintStyle:
                                                const TextStyle(fontSize: 14),
                                            label: Container(
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  '',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(Text(
                                      data['name'],
                                      style: style,
                                    )),
                                  ]))
                              .toList(),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      finalData.add({
                        "name": catName,
                        'quantity': quantity.text,
                        "measurement": catMeasurement,
                        'price': catPrice,
                        'image': image,
                        'total': total.text,
                      });
                      totalTotal += double.parse(total.text);
                      totalQuantity += int.parse(quantity.text);
                      print(totalTotal);
                      data1.clear();
                      setState(() {});
                    },
                    child: Container(
                      width: getProportionateScreenWidth(150),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(color: ColorManager.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: ColorManager.primary,
                          ),
                          Text(
                            'اضافه صنف ',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontWeight: FontWeight.w500,
                              // color: ColorManager.primary
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: getProportionateScreenHeight(50),
                        child: dropDown(
                          const [
                            'خزينه المصنع',
                            'البنك الاهلي',
                            'فوافون كاش',
                            'بنك مصر',
                          ],
                          selectTalab: chose1,
                          onchanged: () => (val) {
                            if (val == 'خزينه المصنع') {
                              setState(() {
                                bank = 'companytreasury';
                              });
                            } else if (val == 'البنك الاهلي') {
                              setState(() {
                                bank = 'bankalahly';
                              });
                            } else if (val == 'بنك مصر') {
                              setState(() {
                                bank = 'bankmasr';
                              });
                            }
                            setState(() {
                              chose1 = val;
                            });
                          },
                          label: 'الخزينه',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        )),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'الشحن',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'المبلغ المتبقي',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller3,
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          color: Colors.grey,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'المبلغ المدفوع',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: 60,
                        child: TextFormField(
                          controller: controller1,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(20)),
                          onChanged: (v) {
                            setState(() {
                              if (v.isNotEmpty) {
                                controller3 = TextEditingController(
                                    text: '${totalTotal - num.parse(v)}');
                              } else {
                                controller3 = TextEditingController(text: "0");
                              }
                            });
                          },
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(fontSize: 14),
                            label: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                )),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(AppSize.s15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(AppSize.s15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.2)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSize.s15),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Botton(
                color: ColorManager.white,
                title: 'اضافه',
                onTap: () {},
                bgColor: ColorManager.black,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

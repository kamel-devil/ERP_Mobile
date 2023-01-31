import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../components/appBar.dart';
import '../../components/default_container.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class ShippingCompaniesReport extends StatefulWidget {
  const ShippingCompaniesReport({Key? key}) : super(key: key);

  @override
  State<ShippingCompaniesReport> createState() =>
      _ShippingCompaniesReportState();
}

class _ShippingCompaniesReportState extends State<ShippingCompaniesReport> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "aramex",
      "2": "500 جنيه",
      "3": "5 طلب",
      "4": "200 طلب ",
      "5": "80 %",
    },
    {
      "1": "aramex",
      "2": "500 جنيه",
      "3": "5 طلب",
      "4": "200 طلب ",
      "5": "80 %",
    },
    {
      "1": "aramex",
      "2": "500 جنيه",
      "3": "5 طلب",
      "4": "200 طلب ",
      "5": "80 %",
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
                DefaultContainer(title: 'تقرير شركات الشحن'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'الي التاريخ',
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
                    Column(
                      children: [
                        Text(
                          'من التاريخ',
                          style: getSemiBoldStyle(color: ColorManager.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(140),
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(10),
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data[index]['1'],
                                    style: getBoldStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'الرصيد',
                                                style: getBoldStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data[index]['2'],
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
                                                'طلبات تحت التحصيل',
                                                style: getBoldStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data[index]['3'],
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
                                                'اجمالي التسليم',
                                                style: getBoldStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'نسبه التسليم',
                                                style: getBoldStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
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
                                        ],
                                      ),
                                    ],
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

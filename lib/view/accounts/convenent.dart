import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../components/appBar.dart';
import '../../components/botton.dart';
import '../../components/default_container.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class Convenent extends StatefulWidget {
  const Convenent({Key? key}) : super(key: key);

  @override
  State<Convenent> createState() => _ConvenentState();
}

class _ConvenentState extends State<Convenent> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "يوسف",
      "3": "500 جنيه",
    },
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "يوسف",
      "3": "500 جنيه",
    },
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "يوسف",
      "3": "500 جنيه",
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
                    DefaultContainer(title: 'العهد'),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 220,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ColorManager.primary,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data[index]['1'],
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
                                            'المتحصل :  ',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['2'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            'المبلغ :  ',
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
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.remove_red_eye,color: Colors.white,))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Botton(color: ColorManager.white, title: 'تسويه', onTap: () {  }, bgColor: ColorManager.black,)
                              ],
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

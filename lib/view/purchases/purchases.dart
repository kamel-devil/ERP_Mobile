import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../components/appBar.dart';
import '../../components/botton.dart';
import '../../components/default_container.dart';
import '../../components/drop_down.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class Purchases extends StatefulWidget {
  const Purchases({Key? key}) : super(key: key);

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  DateTime orderDate = DateTime.now();

  List dataTable = [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه صنف')
      ],
    )
  ];

  List data = [
    {
      "1": "PO1",
      "2": "مورد اسلام",
      "3": "حديد",
      "4": "تم الاستيلام",
    },
    {
      "1": "PO1",
      "2": "مورد اسلام",
      "3": "حديد",
      "4": "تم الاستيلام",
    },
    {
      "1": "PO1",
      "2": "مورد اسلام",
      "3": "حديد",
      "4": "تم الاستيلام",
    },
  ];
  List data1 = [
    {
      "1": "مورد اسلام",
      "2": "خشب",
      "3": "100 متر",
      "4": "15",
      "5": "150",
      "6": "100",
      "7": "100",
      "8": "4000 جنيه",
      "9": "1/11/2022",
      "10": "يوزر احمد",
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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(
        fontSize: getProportionateScreenWidth(20), fontWeight: FontWeight.bold);
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
                  height: 20,
                ),
                DefaultContainer(title: 'فواتير المشتريات'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        items: [],
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "Enter Name",
                          ),
                        ),
                        onChanged: (v) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
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
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      'التاريخ',
                      style: style,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(160),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: Text(
                          "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                          style: TextStyle(
                              color: ColorManager.black, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: ExpansionTile(
                          iconColor: ColorManager.white,
                          collapsedIconColor: ColorManager.white,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index]['1'],
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
                                data[index]['3'],
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
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 220,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ColorManager.second,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        data1[0]['1'],
                                        style: getBoldStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data1[0]['2'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            data1[0]['3'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'سعر المتر',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            data1[0]['4'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'اجمالي الفاتوره',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(
                                            data1[0]['5'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            'مدفوع',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(
                                            data1[0]['6'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'باقي',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(
                                            data1[0]['7'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            'رصيدالمورد',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(
                                            data1[0]['8'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'فاتوره بتاريخ',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(
                                            data1[0]['9'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            'بواسطه',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(
                                            data1[0]['10'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Botton(
                                    color: ColorManager.white,
                                    title: 'تاكيد استيلام',
                                    onTap: () {},
                                    bgColor: ColorManager.second)
                              ],
                            )
                          ]),
                    ),
                    itemCount: data.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DefaultAppBar()
        ],
      ),
    ));
  }
}

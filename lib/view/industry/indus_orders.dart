import 'package:flutter/material.dart';

import '../../components/appBar.dart';
import '../../components/botton.dart';
import '../../components/default_container.dart';
import '../../components/drop_down.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class IndustryOrder extends StatefulWidget {
  const IndustryOrder({Key? key}) : super(key: key);

  @override
  State<IndustryOrder> createState() => _IndustryOrderState();
}

class _IndustryOrderState extends State<IndustryOrder> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();

  List data = [
    {
      "1": "MO5",
      "2": "20 ستاندرد",
      "3": "تم التصنيع",
    },
    {
      "1": "MO5",
      "2": "20 ستاندرد",
      "3": "تم التصنيع",
    },
    {
      "1": "MO5",
      "2": "20 ستاندرد",
      "3": "تم التصنيع",
    },
  ];
  List data1 = [
    {
      "1": "MO5",
      "2": "10 بولار",
      "3": "20 ستام",
      "4": "1/11/2022",
      "5": "3255",
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
                  height: 50,
                ),
                DefaultContainer(title: 'اوامر التصنيع'),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: getProportionateScreenWidth(160),
                      height: getProportionateScreenHeight(90),
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const ['تم الانتهاء', 'في التصنيع'],
                        selectTalab: chose,
                        onchanged: () => (val) {
                          setState(() {
                            chose = val;
                          });
                        },
                        label: 'حاله التصنيع',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
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
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
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
                                      Text(
                                        data1[0]['2'],
                                        style: getBoldStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        data1[0]['3'],
                                        style: getBoldStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'التاريخ',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'اجمالي التكلفه',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            data1[0]['5'],
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
                                            'ملحوظه',
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon:
                                                  Icon(Icons.remove_red_eye,color: ColorManager.white,))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Botton(
                                    color: ColorManager.white,
                                    title: 'تاكيد الانتهاء',
                                    onTap: () {},
                                    bgColor: ColorManager.second)
                              ],
                            )
                          ]),
                    ),
                    itemCount: data.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
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

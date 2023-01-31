
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../components/appBar.dart';
import '../../components/default_container.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class AccountsDetails extends StatefulWidget {
  const AccountsDetails({Key? key}) : super(key: key);

  @override
  State<AccountsDetails> createState() => _AccountsDetailsState();
}

class _AccountsDetailsState extends State<AccountsDetails> {
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
      "2": "EX1",
      "3": "500 جنيه",
      "4": "تسويق",
      "5": "200 طلب",
      "6": "",
    },
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "EX1",
      "3": "500 جنيه",
      "4": "تسويق",
      "5": "200 طلب",
      "6": "",
    },
    {
      "1": "١/١٢/٢٠٢٢",
      "2": "EX1",
      "3": "500 جنيه",
      "4": "تسويق",
      "5": "200 طلب",
      "6": "",
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
                DefaultContainer(title: 'تفاصيل حساب البنك الاهلي'),
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
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize:
                              getProportionateScreenWidth(20)),
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
                              color: ColorManager.black,
                              fontSize:
                              getProportionateScreenWidth(20)),
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
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.second,
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
                            '12/10/2023',
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
                            'رصيد قبل',
                            style: getBoldStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1000',
                            style: getBoldStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'مبلغ التحصيل',
                            style: getBoldStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '200',
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
                            'رصيد بعد',
                            style: getBoldStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1200",
                            style: getBoldStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'الحركه',
                            style: getBoldStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "اضافه",
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
                            'تحصيل',
                            style: getBoldStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "PO1",
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
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "يوزر احمد",
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
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(10),
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.second,
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    data[index]['1'],
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
                                    'المبلغ',
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
                                  Text(
                                    'نوع المصروف',
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
                                    data[index]['5'],
                                    style: getBoldStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    'بيان الطلب',
                                    style: getBoldStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data[index]['6'],
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
                                    'تعديل',
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
                                      icon: const Icon(Icons.remove_red_eye,color: Colors.white,))
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

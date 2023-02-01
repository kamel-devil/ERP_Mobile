import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../components/appBar.dart';
import '../../components/botton.dart';
import '../../components/default_container.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class NotificationsSent extends StatefulWidget {
  const NotificationsSent({Key? key}) : super(key: key);

  @override
  State<NotificationsSent> createState() =>
      _NotificationsSentState();
}

class _NotificationsSentState extends State<NotificationsSent> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  bool isVisible = false;

  DateTime orderDate = DateTime.now();
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
    {"1": "تعديل", "2": "كامل ", "3": "1/11/1111","4":"٣:٢٢","5":"ahmed","6":"022"},
    {"1": "تعديل", "2": " كريم", "3": "1/11/1111","4":"٣:٢٢","5":"ahmed","6":"022"},
    {"1": "تعديل", "2": "ميدو ", "3": "1/11/1111","4":"٣:٢٢","5":"ahmed","6":"022"},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      DefaultContainer(title: 'الاشعارات المرسلة'),
                      const SizedBox(
                        height: 32,
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
                                color: Color(0xff82225E),
                                fontSize: getProportionateScreenWidth(20)),
                          ),
                        ),
                      ),

                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: ColorManager.second,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'الحركة :',
                                                    style: getBoldStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
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
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'الراسل :',
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

                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'تاريخ الارسال :',
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
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'التوقيت :',
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
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    'المرسل اليه : ',
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
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    "رقم الطلب :",
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
                                                ],
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Botton(
                                    bgColor: Colors.black,
                                    color: Colors.white,
                                    title: 'تفاصيل الاشعار',
                                    onTap: () {
                                      QR.to('/follow_user_details');
                                    },
                                  ),

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
            )));
  }
}

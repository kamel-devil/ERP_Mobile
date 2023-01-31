import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

class PayCovenant extends StatefulWidget {
  const PayCovenant({Key? key}) : super(key: key);

  @override
  State<PayCovenant> createState() => _PayCovenantState();
}

class _PayCovenantState extends State<PayCovenant> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();


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
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  DefaultContainer(title: 'صرف العهده'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            width: getProportionateScreenWidth(150),
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () => _selectDate(context),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text(
                                "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'مبلغ العهده',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(20)),
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
                              color: Colors.grey,
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: getProportionateScreenHeight(90),
                        child: dropDown(
                          const [
                            "خزينه المصنع",
                            "فودافون كاش",
                            "البنك الاهلي",
                          ],
                          selectTalab: chose1,
                          onchanged: () => (val) {
                            setState(() {
                              chose1 = val;
                            });
                          },
                          label: 'الخزينه',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: getProportionateScreenHeight(90),
                        child: dropDown(
                          const [
                            "موسي",
                            "خالد",
                          ],
                          selectTalab: chose2,
                          onchanged: () => (val) {
                            setState(() {
                              chose2 = val;
                            });
                          },
                          label: 'متحصل العهده',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(250),
                        height: getProportionateScreenHeight(250),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: ColorManager.primary, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.more_horiz,
                                  color: ColorManager.primary,
                                ),
                                Text(
                                  'ملحوظات',
                                  style: style,
                                ),
                                Icon(
                                  Icons.close,
                                  color: ColorManager.primary,
                                )
                              ],
                            ),
                            Divider(
                              color: ColorManager.primary,
                              thickness: 2,
                            ),
                            TextFormField(
                              controller: controller3,
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'وصف',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: getProportionateScreenWidth(250),
                            height: getProportionateScreenHeight(250),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: ColorManager.primary, width: 2),
                            ),
                            child: TextFormField(
                              controller: controller4,
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Botton(
                    bgColor: Colors.black,
                    color: Colors.white,
                    title: 'صرف',
                    onTap: () {},
                  )
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

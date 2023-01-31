import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class AdvanceExchange extends StatefulWidget {
  @override
  State<AdvanceExchange> createState() => _AdvanceExchangeState();
}

class _AdvanceExchangeState extends State<AdvanceExchange> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
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

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    DefaultContainer(title: 'صرف سلف'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'راتب شهر',
                              style: style,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              height: 60,
                              child: DefaultInputForm(
                                hint: '',
                                label: '',
                                onTab: () {},
                                validate: () {},
                                onSave: () {},
                                passFun: () {},
                                color: Colors.white70,
                                obscureText: false,
                                controller: controller1,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('الاسم', style: style),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              ' التاريخ',
                              style:
                                  getSemiBoldStyle(color: ColorManager.black),
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
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
                              'اجمالي الراتب',
                              style: style,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              height: 60,
                              child: DefaultInputForm(
                                hint: '',
                                label: '',
                                onTab: () {},
                                validate: () {},
                                onSave: () {},
                                passFun: () {},
                                color: Colors.white70,
                                obscureText: false,
                                controller: controller5,
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
                        Column(
                          children: [
                            Text(
                              'المتبقي',
                              style: style,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              height: 60,
                              child: DefaultInputForm(
                                hint: '',
                                label: '',
                                onTab: () {},
                                validate: () {},
                                onSave: () {},
                                passFun: () {},
                                color: Colors.white70,
                                obscureText: false,
                                controller: controller3,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'السلف',
                              style: style,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              height: 60,
                              child: DefaultInputForm(
                                hint: '',
                                label: '',
                                onTab: () {},
                                validate: () {},
                                onSave: () {},
                                passFun: () {},
                                color: Colors.white70,
                                obscureText: false,
                                controller: controller4,
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
                      children: [
                        Container(
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(90),
                          child: dropDown(
                            const [
                              "خزينة المصنع",
                              "البنك الاهلي",
                              "بنك مصر",
                            ],
                            selectTalab: selectTalab,
                            onchanged: () => (val) {
                              setState(() {
                                selectTalab = val;
                              });
                            },
                            label: 'الخزينة',
                            foColor: Colors.white,
                            bgColor: ColorManager.primary,
                            dpColor: ColorManager.primary,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'مبلغ الصرف للسلفة',
                              style: style,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              height: 60,
                              child: DefaultInputForm(
                                hint: '',
                                label: '',
                                onTab: () {},
                                validate: () {},
                                onSave: () {},
                                passFun: () {},
                                color: Colors.white70,
                                obscureText: false,
                                controller: controller6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
      ),
    );
  }
}

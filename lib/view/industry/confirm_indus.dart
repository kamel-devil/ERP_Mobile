import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

class ConfirmIndus extends StatefulWidget {
  const ConfirmIndus({Key? key}) : super(key: key);

  @override
  State<ConfirmIndus> createState() => _ConfirmIndusState();
}

class _ConfirmIndusState extends State<ConfirmIndus> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

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
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 32,
              ),
              DefaultContainer(title: 'تأكيد امر التصنيع'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: getProportionateScreenWidth(150),
                height: getProportionateScreenHeight(90),
                child: dropDown(
                  const ['تم الانتهاء', 'في التصنيع'],
                  selectTalab: chose2,
                  onchanged: () => (val) {
                    setState(() {
                      chose2 = val;
                    });
                  },
                  label: 'حاله التصنيع',
                  foColor: Colors.white,
                  bgColor: ColorManager.primary,
                  dpColor: ColorManager.primary,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'الكميه',
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
                  Column(
                    children: [
                      Text(
                        'اسم المنتج',
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
                          perFix: const Icon(Icons.search),
                          color: Colors.white70,
                          obscureText: false,
                        ),
                      ),
                    ],
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
                        'اجمالي التكلفه',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller1,
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
                  Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(90),
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const ['منتج التشغيل', 'منتج تام'],
                      selectTalab: chose1,
                      onchanged: () => (val) {
                        setState(() {
                          chose1 = val;
                        });
                      },
                      label: 'نوع المنتج',
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
                        'اضافه خاصه للعميل',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller4,
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          perFix: const Icon(Icons.search),
                          color: Colors.white70,
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
              Container(
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.black, width: 2),
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.more_horiz),
                        Text(
                          'ملحوظات',
                          style: style,
                        ),
                        Icon(Icons.close)
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: const InputDecoration(
                          border: InputBorder.none),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Botton(
                color: ColorManager.white,
                title: 'تاكيد التصنيع',
                onTap: () {},
                bgColor: ColorManager.primary,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

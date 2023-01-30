import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import '../../../resources/color_manger.dart';
import '../../../resources/style_manager.dart';
import '../../../size_config.dart';

class RequiredList extends StatefulWidget {
  RequiredList({Key? key}) : super(key: key);

  @override
  State<RequiredList> createState() => _RequiredListState();
}

class _RequiredListState extends State<RequiredList> {
  String? chose;
  String? state;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  String? chose1;
  String? chose2;
  int? selectedIndex;

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
        initialDate: stateDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != stateDate) {
      setState(() {
        stateDate = pickedDate;
      });
    }
  }

  List data = [
    {
      "1": "كرسي الما",
      "2": "٥",
      "3": "١٠٠",
      "4": "٤٠",
      "5": "متوفر ",
      "6": "صفر",
      "7": "٦٠"
    },
    {
      "1": "كرسي الما",
      "2": "٥",
      "3": "١٠٠",
      "4": "٤٠",
      "5": "متوفر ",
      "6": "صفر",
      "7": "٦٠"
    },
    {
      "1": "كرسي الما",
      "2": "٥",
      "3": "١٠٠",
      "4": "٤٠",
      "5": "متوفر ",
      "6": "صفر",
      "7": "٦٠"
    },
  ];

  List<String> columnData = [
    "اسم المنتج",
    "عدد الطلبات",
    "عدد القطع المطلوبة",
    "رصيد المخزن",
    "توفر الخامات",
    "عدد العجز",
    "المطلوب تصنيعه",
  ];

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    DefaultContainer(
                      title: 'قائمة المنتجات المطلوبة',
                    ),

                    Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(90),
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const ['طلب جديد', 'طلب مؤكد'],
                        selectTalab: state,
                        onchanged: () => (val) {
                          setState(() {
                            state = val;
                          });
                        },
                        label: 'حاله الطلب',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'تاريخ الحالة',
                              style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: getProportionateScreenWidth(20)),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () => _select1Date(context),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white)),
                                child: Text(
                                  "${stateDate.year.toString()}/${stateDate.month.toString().padLeft(2, '0')}/${stateDate.day.toString().padLeft(2, '0')}",
                                  style: const TextStyle(
                                    color: Color(0xff82225E),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'تاريخ الطلب',
                              style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: getProportionateScreenWidth(20)),
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
                                    color: Color(0xff82225E),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: DefaultTable(
                              color: ColorManager.primary,
                              columnData: columnData,
                              size: getProportionateScreenWidth(3),
                              rows: data
                                  .map((data) => DataRow(cells: [
                                DataCell(Text(
                                  data['1'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['2'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['3'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['4'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['5'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['6'],
                                  style: style,
                                )),

                                DataCell(Text(
                                          data['7'],
                                          style: style,
                                        )),
                                      ]))
                                  .toList(),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(top: 71),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                  data.length,
                                      (index) => Column(
                                    children: [
                                      SizedBox(
                                          width:
                                          getProportionateScreenWidth(150),
                                          child: dropDown(
                                            const [
                                              'تأكيد امرالتصنيع',
                                              'تفاصيل الطلب',
                                            ],
                                            selectTalab: index == selectedIndex
                                                ? chose1
                                                : chose2,
                                            onchanged: () => (val) {
                                              setState(() {
                                                selectedIndex = index;
                                                chose1 = val;
                                              });
                                            },
                                            label: 'خيارات',
                                            foColor: Colors.white,
                                            bgColor: ColorManager.primary,
                                            dpColor: ColorManager.primary,
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  )),
                            ),
                          ),

                        ],
                      ),
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

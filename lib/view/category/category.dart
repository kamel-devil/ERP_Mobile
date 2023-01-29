
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/appBar.dart';
import '../../components/botton.dart';
import '../../components/default_container.dart';
import '../../components/drop_down.dart';
import '../../components/text_fom_feild.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  List data = [
    {
      "2": "15 متر",
      "1": " فايبر",
    },
    {
      "2": "15 متر",
      "1": " فايبر",
    },
    {
      "2": "15 متر",
      "1": " فايبر",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    return SafeArea(
        child: Scaffold(
      body:Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                DefaultContainer(title: 'الاصناف'),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: getProportionateScreenWidth(130),
                      height: 90,
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const [
                          'مواد خام',
                          'منتج التشغيل',
                          "منتج تام"
                        ],
                        selectTalab: chose,
                        onchanged: () => (val) {
                          setState(() {
                            chose = val;
                          });
                        },
                        label: 'نوع الصنف',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
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
                            hintText: "Enter Name",
                          ),
                        ),
                        onChanged: (v) {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: ColorManager.second,
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
                            ],
                          ),
                          children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Botton(
                                        color: ColorManager.white,
                                        title: 'تعديل الرصيد',
                                        onTap: () {},
                                        bgColor: ColorManager.primary),
                                    Botton(
                                        color: ColorManager.white,
                                        title: "تأكيد امر الشراء",
                                        onTap: () {},
                                        bgColor: ColorManager.primary),
                                  ],
                                ),
                              ),
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

import 'package:dropdown_search/dropdown_search.dart';
import 'package:erp_app/components/botton.dart';
import 'package:flutter/material.dart';

import '../../components/appBar.dart';
import '../../components/default_container.dart';
import '../../components/text_fom_feild.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';
import '../../size_config.dart';

class Suppliers extends StatefulWidget {
  Suppliers({Key? key}) : super(key: key);

  @override
  State<Suppliers> createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  List data = [
    {
      "3": "2 طلب",
      "2": "2000",
      "1": " احمد",
    },
    {
      "3": "2 طلب",
      "2": "2000",
      "1": " احمد",
    },
    {
      "3": "2 طلب",
      "2": "2000",
      "1": " احمد",
    },
  ];
  List data1 = [
    {
      "1": "200 متر قماش",
      "2": "2000",
      "3": " PO1",
    },
    {
      "1": "200 متر قماش",
      "2": "2000",
      "3": " PO1",
    },
    {
      "1": "200 متر قماش",
      "2": "2000",
      "3": " PO1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                DefaultContainer(title: 'الموردين'),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(200),
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
                const SizedBox(
                  height: 25,
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
                            for (int i = 0; i < data1.length; i++)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Container(
                                    height: 50,
                                    width: getProportionateScreenWidth(250),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    decoration: BoxDecoration(
                                        color: ColorManager.primary,
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          data1[index]['1'],
                                          style: getBoldStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Text(
                                          data1[index]['2'],
                                          style: getBoldStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Text(
                                          data1[index]['3'],
                                          style: getBoldStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Botton(
                                      color: ColorManager.white,
                                      title: 'تفاصيل',
                                      onTap: () {},
                                      bgColor: ColorManager.primary),
                                ],
                              ),
                          ]),
                    ),
                    itemCount: data.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          DefaultAppBar()
        ],
      ),
    ));
  }
}

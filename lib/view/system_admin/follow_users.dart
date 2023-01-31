import 'package:dropdown_search/dropdown_search.dart';
import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/resources/style_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class FollowUser extends StatefulWidget {
  const FollowUser({Key? key}) : super(key: key);

  @override
  State<FollowUser> createState() => _FollowUserState();
}

class _FollowUserState extends State<FollowUser> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? selectTalab;
  String? userName;

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  DefaultContainer(title: 'تتبع المستخدمين'),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Column(
                        children: [
                          Text(
                            'من التاريخ',
                            style: getSemiBoldStyle(
                                color: ColorManager.black),
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
                                      MaterialStateProperty.all(
                                          Colors.white)),
                              child: Text(
                                "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18
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
                                color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(150),
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
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width:
                    getProportionateScreenWidth(150),
                    height: 60,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        showSearchBox: true,
                        searchFieldProps:
                        TextFieldProps(
                            cursorColor:
                            ColorManager
                                .primary),
                        // disabledItemFn:
                        //     (String s) =>
                        //         s.startsWith('I'),
                      ),
                      items: ['الكل','محمد مصطفي','احمد علاء'],
                      dropdownDecoratorProps:
                      const DropDownDecoratorProps(
                        dropdownSearchDecoration:
                        InputDecoration(
                          hintText: "Enter Name",
                        ),
                      ),
                      onChanged: (v) {
                        setState(() {
                          userName = v;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(128),
                  ),
                  Botton(
                    bgColor: Colors.black,
                    color: Colors.white,
                    title: 'تتبع',
                    onTap: () {
                      QR.to('/follow_user_details');
                    },
                  ),
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

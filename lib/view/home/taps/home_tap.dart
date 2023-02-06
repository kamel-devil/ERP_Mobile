import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/controller.dart';
import '../../../resources/assets_manager.dart';
import '../notification.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({Key? key}) : super(key: key);

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  List<String> title = [
    'المشتريات',
    'المصروفات',
    'الطلبات',
    'حساب المندوبين و شركات الشحن',
    'تقرير المخزون',
    'الاشعارات',
  ];

  List<String> image = [
    ImageAssets.iconDropDown7,
    ImageAssets.iconDropDown17,
    ImageAssets.iconDropDown16,
    ImageAssets.iconDropDown6,
    ImageAssets.iconDropDown3,
    ImageAssets.iconDropDown52,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    Controller controller = Get.put(Controller());
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          DefaultContainer(title: 'الصفحه الرئيسيه'),
          Expanded(
            child: GridView.count(
              // shrinkWrap: true,
              childAspectRatio: 1.2,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 40,
              padding: const EdgeInsets.all(8.0),
              children: List.generate(
                  title.length,
                  (index) => InkWell(
                        onTap: () {
                          if (title[index] == 'الاشعارات') {
                            controller.changePage(NotificationPage());
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                title[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: Colors.white),
                              ),
                              Image.asset(
                                image[index],
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenHeight(50),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

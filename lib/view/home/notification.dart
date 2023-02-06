
import 'package:erp_app/components/botton.dart';
import 'package:erp_app/components/default_botton.dart';
import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  List<String> title = [
    'ارسال اشعار',
    'الاشعارات المستلمه',
    'الاشعارات المرسله',
  ];

  List<String> image = [
    ImageAssets.iconDropDown37,
    ImageAssets.iconDropDown38,
    ImageAssets.iconDropDown39,
  ];

  List data = [
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": false
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": false
    },
  ];


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
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
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              childAspectRatio: 1.3,
              crossAxisCount: 2,
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
              padding: const EdgeInsets.all(8.0),
              children: List.generate(
                  title.length,
                      (index) => InkWell(
                    onTap: () {},
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
                            style: TextStyle(
                                fontSize:getProportionateScreenWidth(20),
                                color: Colors.white),
                          ),
                          Image.asset(image[index],
                            width:getProportionateScreenWidth(50),
                            height:getProportionateScreenHeight(50),
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

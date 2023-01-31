import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/size_config.dart';
import 'package:erp_app/view/home/taps/home_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manger.dart';
import '../orders/companies_representatives.dart';
import 'drop_down_par.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: GetBuilder<Controller>(
        init: Controller(),
        builder: (con) => Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.primary,
              centerTitle: true,
              elevation: 0,
              title: Row(
                children: [
                  Image.asset(
                    ImageAssets.iconDropDown2,
                    width: 50,
                  ),
                  Text(
                    'MAGALIS',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            drawer: Drawer(
              backgroundColor: ColorManager.primary,
              child: DropDownList(),
            ),
            body: con.current),
      ),
    );
  }
}

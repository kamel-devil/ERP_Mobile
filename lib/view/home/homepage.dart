import 'package:erp_app/components/appBar.dart';
import 'package:erp_app/size_config.dart';
import 'package:erp_app/view/home/taps/home_tap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manger.dart';
import 'drop_down_par.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.primary,
            centerTitle: true,
            title: Text(
              'الصفحة الرئسية',
              maxLines: 2,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(25),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          drawer: Drawer(
            backgroundColor: ColorManager.primary,
            child: DropDownList(),
          ),
          body: HomeTap()),
    );
  }
}

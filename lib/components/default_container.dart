import 'package:erp_app/resources/color_manger.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  DefaultContainer({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        maxLines: 2,
        style:  TextStyle(fontSize: getProportionateScreenWidth(20), color: Colors.white,fontWeight: FontWeight.bold),
      ),
    );
  }
}

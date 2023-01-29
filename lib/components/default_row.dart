import 'package:erp_app/resources/assets_manager.dart';
import 'package:erp_app/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DefaultRow extends StatelessWidget {
  const DefaultRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: InkWell(
                onTap: () {
                  QR.navigator.popUntilOrPush('/');
                },
                child: Image.asset(ImageAssets.iconDropDown2)),
          ),
        ),
        SizedBox(width: 5,),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: InkWell(
                onTap: () {
                  QR.navigator.popUntilOrPush('/');
                },
                child: Image.asset(ImageAssets.iconDropDown52)),
          ),
        ),
      ],
    );
  }
}


import 'package:erp_app/resources/value_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';

class DefaultInputForm extends StatelessWidget {
  DefaultInputForm(
      {Key? key,
      required this.hint,
      required this.label,
      required this.onTab,
      required this.validate,
      required this.onSave,
      required this.passFun,
      required this.obscureText,
      required this.controller,
      this.suffix,
      this.perFix,
      this.color})
      : super(key: key);
  String hint;
  String label;
  TextEditingController controller;
  Function() onTab;
  Function() validate;
  Function() onSave;
  Function() passFun;

  bool obscureText;
  Widget? suffix;
  Color? color = ColorManager.primary;
  Widget? perFix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: getProportionateScreenWidth(20)),
      obscureText: obscureText,
      validator: validate(),
      onSaved: onSave(),
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 14),
        label: Container(
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )),
        prefixIcon: perFix,
        suffixIcon: suffix,
        filled: true,
        fillColor: color,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
          borderSide: const BorderSide(color: Colors.black, width: 1.2),
        ),
      ),
    );
  }
}

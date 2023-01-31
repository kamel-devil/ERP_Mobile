import 'package:erp_app/components/deafult_dorp_down.dart';
import 'package:erp_app/controller/controller.dart';
import 'package:erp_app/size_config.dart';
import 'package:erp_app/view/home/taps/home_tap.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';

class DropDownList extends StatelessWidget {
  DropDownList({Key? key}) : super(key: key);

  List<String> title = [
    'المخازن',
    'الموردين',
    'اداره الاصناف',
    'المشتريات',
    'التصنيع',
    'اداره الشحن',
    'التقارير',
    'الحسابات',
    'اداره النظام',
    'HR',
    'الايصالات و الاذونات',
  ];
  List<String> image = [
    ImageAssets.iconDropDown3,
    ImageAssets.iconDropDown4,
    ImageAssets.iconDropDown5,
    ImageAssets.iconDropDown7,
    ImageAssets.iconDropDown8,
    ImageAssets.iconDropDown9,
    ImageAssets.iconDropDown10,
    ImageAssets.iconDropDown11,
    ImageAssets.iconDropDown12,
    ImageAssets.iconDropDown13,
    ImageAssets.iconDropDown14,
  ];
  List taps = [
    ['اضافه مخزن ', 'المخازن', ' تحويلات بين المخازن'],
    ['اضافه مورد ', 'اضافه فئه الموردين', 'فئات الموردين', "الموردين"],
    [
      'اضافه صنف ',
      'الاصناف',
      'اضافه وحده القياس',
      "وحدات القياس",
      "فروع الانتاج"
    ],
    ['اضافه فاتوره مشتريات ', 'فواتير المشتريات'],
    [
      'اضافه وصفه ',
      'وصفات التصنيع',
      "تأكيد امر التصنيع",
      "اوامر التصنيع",
      "الاضافات الخاصه"
    ],
    [
      'اضافه طلب ',
      'الطلبات',
      "شركات الشحن و المندوبين",
      "فئات المنتجات المطلوبه",
      "مصادر الطلبات",
      "طرق الشحن",
      "خطوط الشحن"
    ],
    [
      'قائمه الدخل',
      "ميزان المراجعه",
      "قائمه المركز المالي",
      "تقرير المشتريات",
      "تقرير مبيعات المنتجات",
      "تقرير المخزون",
      "تقرير ربحيه الصنف",
      "تقرير شركات الشحن"
    ],
    [
      'اضافه مصروف',
      'المصروفات',
      'انواع المصروفات',
      'البنوك و الخزينه و وسائل الدفع',
      'اضافه ايراد اخر',
      'الايرادات الاخري',
      'الاصول',
      'اضافه اصل',
      'الخصومات و الالتزامات',
      'اضافه التزام',
      'العملاء الشركات',
      'العملاء الافراد',
      'العهد',
      'صرف العهد',
    ],
    ['اضافه مستخدم', "المستخدمين", "الصلاحيات", "تتبع المستخدمين"],
    ['اضافه موظف', "الموظفين", "صرف المرتبات", "كشف المرتبات", "صرف سلف"],
    [''],
  ];

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Column(
      children: [
        ListTile(
          onTap: () {
            controller.changePage(HomeTap());

          },
          trailing: Container(
            width: 2,
          ),
          title: Center(
            child: Text(
              'الرئيسيه',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(25),
                  color: Colors.white),
            ),
          ),
          leading: Image.asset(ImageAssets.iconDropDown2),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => DefaultDropDown(
              item: taps[index],
              title: title[index],
              imageUrl: image[index],
              leading: Image.asset(image[index]),
              trailing: Image.asset(
                "assets/images/15.png",
                width: 35,
                height: 35,
              ),
              index: index,
            ),
            itemCount: 11,
          ),
        ),
      ],
    );
  }
}

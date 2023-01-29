import 'package:erp_app/components/default_container.dart';
import 'package:erp_app/components/default_table.dart';
import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/assets_manager.dart';
import 'package:erp_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../resources/color_manger.dart';

class Talabat extends StatefulWidget {
  @override
  State<Talabat> createState() => _TalabatState();
}

class _TalabatState extends State<Talabat> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();

  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? city;
  String? typeCustomer;
  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  String search = '';
  bool decline = false;
  bool decline1 = false;
  bool visable = false;

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
        initialDate: stateDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != stateDate) {
      setState(() {
        stateDate = pickedDate;
      });
    }
  }

  List<String> dataTable = [
    'رقم الطلب',
    'تاريخ الطلب',
    'نوع الطلب',
    'حالة الطلب',
    'المحافظة',
    'المدينة',
    'اسم العميل',
    'رقم التليفون',
    'اجمالي الفاتوره',
    'حاله الدفع',
    'المدفوع',
    'شركه الشحن',
    'خط التوزيع',
    'موجل',
    'طريقه الشحن',
    'تاريخ الحاله',
  ];
  List data = [
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": "aaaaa",
      "14": "aaaaa",
      "15": "عدد 1",
      "16": "small",
      "18": "aaa",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": "aaaaa",
      "14": "aaaaa",
      "15": "عدد 1",
      "16": "small",
      "18": "aaa",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": "aaaaa",
      "14": "aaaaa",
      "15": "عدد 1",
      "16": "small",
      "18": "aaa",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": "aaaaa",
      "14": "aaaaa",
      "15": "عدد 1",
      "16": "small",
      "18": "aaa",
    },

  ];

  List data1 = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
  ];

  List<String> columnData1 = [
    "صورةالمنتج",
    "اجماليسعر البيع",
    "سعر البيع",
    "الوحده",
    "الكميةالمطلوبة",
    "اسم المنتج",
  ];

  @override
  Widget build(BuildContext context) {
    // var format = DateFormat.yMd('ar');
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(20));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultContainer(
                        title: 'الطلبات',
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20.0, left: 6, right: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 35),
                                  child: dropDown(
                                    const ["facebook", "website", "phone call"],
                                    selectTalab: selectTalab,
                                    onchanged: () => (val) {
                                      setState(() {
                                        selectTalab = val;
                                      });
                                    },
                                    label: 'مصدر الطلب',
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 35),
                                  child: dropDown(
                                    const [
                                      "الكل",
                                      "طلب مؤكد",
                                      "تم الشحن",
                                      "تم التحصيل",
                                      "تم الاستلام",
                                      "تم الصيانة",
                                      "ملغى",
                                      "رفض الاستلام"
                                    ],
                                    selectTalab: stateTalab,
                                    onchanged: () => (val) {
                                      setState(() {
                                        stateTalab = val;
                                      });
                                    },
                                    label: 'حالة الطلب',
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(190),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 35),
                                  child: dropDown(
                                    const [
                                      "Small products",
                                      "Medium products",
                                      "Huge products"
                                    ],
                                    selectTalab: shippingMethods,
                                    onchanged: () => (val) {
                                      setState(() {
                                        shippingMethods = val;
                                      });
                                    },
                                    label: 'طرق الشحن',
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 25),
                                  child: dropDown(
                                    const [
                                      "الخط الاول",
                                      "الخط الثاني",
                                      "الخط الثالث",
                                    ],
                                    selectTalab: numLine,
                                    onchanged: () => (val) {
                                      setState(() {
                                        numLine = val;
                                      });
                                    },
                                    label: "رقم الخط",
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'تاريخ الطلب',
                                      style: style,
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
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      20)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'تاريخ الحاله',
                                      style: style,
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
                                          "${stateDate.year.toString()}/${stateDate.month.toString().padLeft(2, '0')}/${stateDate.day.toString().padLeft(2, '0')}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      20)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(50),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xff82225E)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        icon: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Color(0xff82225E)),
                                        items: [
                                          "الكل",
                                        ]
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(
                                                    e,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ))
                                            .toList(),
                                        value: city,
                                        onChanged: (val) {
                                          setState(() {
                                            city = val;
                                          });
                                        },
                                        hint: const Text(
                                          "المدينة",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        dropdownColor: Colors.white,
                                        style: const TextStyle(
                                            color: Color(0xff82225E)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(50),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xff82225E)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        icon: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Color(0xff82225E)),
                                        items: [
                                          "الكل",
                                        ]
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(
                                                    e,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ))
                                            .toList(),
                                        value: governorate,
                                        onChanged: (val) {
                                          setState(() {
                                            governorate = val;
                                          });
                                        },
                                        hint: const Text(
                                          "المحافظة",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        dropdownColor: Colors.white,
                                        style: const TextStyle(
                                            color: Color(0xff82225E)),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(50),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3,
                                            color: const Color(0xff82225E)),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          icon: const Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color: Color(0xff82225E)),
                                          items: [
                                            "100 طلب",
                                            "200 طلب",
                                          ]
                                              .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ))
                                              .toList(),
                                          value: order,
                                          onChanged: (val) {
                                            setState(() {
                                              order = val;
                                            });
                                          },
                                          hint: const Text(
                                            "عرض",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                          dropdownColor: Colors.white,
                                          style: const TextStyle(
                                              color: Color(0xff82225E)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(50),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xff82225E)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        icon: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Color(0xff82225E)),
                                        items: [
                                          "الكل",
                                        ]
                                            .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ))
                                            .toList(),
                                        value: governorate,
                                        onChanged: (val) {
                                          setState(() {
                                            governorate = val;
                                          });
                                        },
                                        hint: const Text(
                                          "رقم الهاتف",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        dropdownColor: Colors.white,
                                        style: const TextStyle(
                                            color: Color(0xff82225E)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(90),
                                  child: dropDown(
                                    const [
                                      "طلب جديد",
                                      "طلب استبدال",
                                      "طلب صيانة",
                                      "طلب مرتجع",
                                    ],
                                    selectTalab: typeOrder,
                                    onchanged: () => (val) {
                                      setState(() {
                                        typeOrder = val;
                                      });
                                    },
                                    label: 'نوع الطلب',
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),
                                SizedBox(
                                  width:getProportionateScreenWidth(150),
                                  height: getProportionateScreenHeight(90),
                                  child: dropDown(
                                    const ["افراد", "شركه"],
                                    selectTalab: typeCustomer,
                                    onchanged: () => (val) {
                                      setState(() {
                                        typeCustomer = val;
                                      });
                                    },
                                    label: "نوع العميل",
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'البحث',
                                      style: style,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(200),
                                      height: 60,
                                      child: DefaultInputForm(
                                        controller: controller,
                                        perFix: IconButton(
                                          icon: const Icon(Icons.search),
                                          color: Colors.grey[500],
                                          onPressed: () {},
                                        ),
                                        hint: '',
                                        label: '',
                                        onTab: () {},
                                        validate: () {},
                                        onSave: () {},
                                        passFun: () {},
                                        color: Colors.white70,
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 71),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: List.generate(
                                        data.length,
                                        (index) => PopupMenuButton(
                                              iconSize:
                                                  getProportionateScreenWidth(20),
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: const Text('تاكيد الطلب'),
                                                  onTap: () {
                                                    QR.to('/ConfirmOrder');
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  value: 2,
                                                  child: const Text('شحن الطلب'),
                                                  onTap: () {
                                                    QR.to('/LoadOrder');
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  value: 3,
                                                  child: const Text('الغاء الطلب'),
                                                  onTap: () {
                                                    setState(() {
                                                      decline = !decline;
                                                    });
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  value: 4,
                                                  child: Text('صيانه الطلب'),
                                                  onTap: () {
                                                    QR.to('/OrderMaintenance');
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  value: 5,
                                                  child: Text('تحصيل الطلب'),
                                                  onTap: () {
                                                    QR.to('/CollectionOrder');
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  value: 5,
                                                  child: Text('تفاصيل تحصيل الطلب'),
                                                  onTap: () {
                                                    QR.to(
                                                        '/CollectionOrderDetails');
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  value: 6,
                                                  child: Text('رفض استلام'),
                                                  onTap: () {
                                                    setState(() {
                                                      decline1 = !decline1;
                                                    });
                                                  },
                                                ),
                                              ],
                                            )),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                DefaultTable(
                                  columnData: dataTable,
                                  color: ColorManager.primary,
                                  size:getProportionateScreenWidth(2),
                                  icon: Image.asset(
                                    ImageAssets.iconDropDown32,
                                    width: getProportionateScreenWidth(50),
                                    height: getProportionateScreenWidth(30),
                                  ),
                                  rows: data
                                      .map((data) => DataRow(cells: [

                                    DataCell(
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '0',
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                child: Image.asset(
                                                  ImageAssets
                                                      .iconDropDown29,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                onTap: () {},
                                              ),
                                              Image.asset(
                                                ImageAssets.iconDropDown28,
                                                width: 20,
                                                height: 30,
                                              ),
                                              InkWell(
                                                child: Image.asset(
                                                  ImageAssets
                                                      .iconDropDown27,
                                                  width: 20,
                                                  height: 30,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    visable = !visable;
                                                  });
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    DataCell(Text(
                                      data['2'],
                                      style: style,
                                    )),
                                    DataCell(
                                      Column(
                                        children: [
                                          Text(
                                            'مستعمل',
                                            style: style,
                                          ),
                                          Icon(
                                            Icons.notifications,
                                            color: const Color(0xff82225E),
                                            size:
                                            getProportionateScreenWidth(
                                                10),
                                          )
                                        ],
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                          color: const Color(0xff82225E),
                                          child: Text(
                                            'تم الشحن',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                getProportionateScreenWidth(
                                                    20)),
                                          )),
                                    ),
                                    DataCell(Text(
                                      data['5'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['6'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['7'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['8'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['9'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['10'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['11'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['12'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['14'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['15'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['16'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['18'],
                                      style: style,
                                    )),


                                          ]))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          // visable
                          //     ? Padding(
                          //         padding: const EdgeInsets.only(top: 32.0),
                          //         child: Stack(children: [
                          //           Positioned(
                          //             right: width / 6,
                          //             child: CircleAvatar(
                          //                 backgroundColor: Colors.black,
                          //                 radius: 50,
                          //                 child: InkWell(
                          //                     onTap: () {
                          //                       setState(() {
                          //                         visable = false;
                          //                       });
                          //                     },
                          //                     child: const Icon(
                          //                       Icons.clear,
                          //                       size: 100,
                          //                       color: Colors.white,
                          //                     ))),
                          //           ),
                          //           Center(
                          //             child: Container(
                          //                 width: 700,
                          //                 height: 600,
                          //                 decoration: const BoxDecoration(
                          //                     color: Color(0xff82225E),
                          //                     borderRadius: BorderRadius.only(
                          //                       topLeft: Radius.circular(400.0),
                          //                       topRight: Radius.circular(400.0),
                          //                       bottomLeft:
                          //                           Radius.circular(400.0),
                          //                       bottomRight:
                          //                           Radius.circular(400.0),
                          //                     ))),
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 128.0),
                          //             child: Center(
                          //               child: Container(
                          //                 width: 600,
                          //                 height: 450,
                          //                 decoration: const BoxDecoration(
                          //                     color: Colors.white,
                          //                     borderRadius: BorderRadius.only(
                          //                       topLeft: Radius.circular(300.0),
                          //                       topRight: Radius.circular(300.0),
                          //                       bottomLeft:
                          //                           Radius.circular(350.0),
                          //                       bottomRight:
                          //                           Radius.circular(350.0),
                          //                     )),
                          //                 child: Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.center,
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Row(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment.center,
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.center,
                          //                       children: [
                          //                         SizedBox(
                          //                           width:
                          //                               getProportionateScreenWidth(
                          //                                   30),
                          //                           child: DefaultInputForm(
                          //                             hint: '',
                          //                             label: '',
                          //                             onTab: () {},
                          //                             validate: () {},
                          //                             onSave: () {},
                          //                             passFun: () {},
                          //                             obscureText: false,
                          //                             controller: controller1,
                          //                           ),
                          //                         ),
                          //                         const SizedBox(
                          //                           width: 15,
                          //                         ),
                          //                         const Text(
                          //                           'رقم الطلب',
                          //                           style: TextStyle(
                          //                               fontWeight:
                          //                                   FontWeight.bold,
                          //                               fontSize: 18),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                     DefaultTable(
                          //                       columnData: columnData1,
                          //                       size: getProportionateScreenWidth(
                          //                           5),
                          //                       color: ColorManager.primary,
                          //                       rows: data1
                          //                           .map(
                          //                               (data) => DataRow(cells: [
                          //                                     DataCell(Text(
                          //                                       data['6'],
                          //                                       style: style,
                          //                                     )),
                          //                                     DataCell(Text(
                          //                                       data['5'],
                          //                                       style: style,
                          //                                     )),
                          //                                     DataCell(Text(
                          //                                       data['4'],
                          //                                       style: style,
                          //                                     )),
                          //                                     DataCell(Text(
                          //                                       data['3'],
                          //                                       style: style,
                          //                                     )),
                          //                                     DataCell(Text(
                          //                                       data['2'],
                          //                                       style: style,
                          //                                     )),
                          //                                     DataCell(Text(
                          //                                       data['1'],
                          //                                       style: style,
                          //                                     )),
                          //                                   ]))
                          //                           .toList(),
                          //                     ),
                          //                     Padding(
                          //                       padding: const EdgeInsets.only(
                          //                           left: 200.0),
                          //                       child: Row(
                          //                         children: [
                          //                           Image.asset(
                          //                             ImageAssets.iconDropDown29,
                          //                             width: 100,
                          //                             height: 100,
                          //                           ),
                          //                           Image.asset(
                          //                             ImageAssets.iconDropDown28,
                          //                             width: 100,
                          //                             height: 100,
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ]),
                          //       )
                          //     : Container(),
                          decline
                              ? Container(
                                  width: getProportionateScreenWidth(70),
                                  height: getProportionateScreenHeight(193),
                                  decoration: BoxDecoration(
                                    color: ColorManager.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: ColorManager.primary, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.more_horiz),
                                          Text(
                                            'يرجي توضيح سبب الالغاء',
                                            style: style,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  decline = false;
                                                });
                                              },
                                              child: const Icon(Icons.close))
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          decline1
                              ? Container(
                                  width: getProportionateScreenWidth(75),
                                  height: getProportionateScreenHeight(193),
                                  decoration: BoxDecoration(
                                    color: ColorManager.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: Colors.black, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.more_horiz),
                                          Text(
                                            'يرجي توضيح سبب رفض الاستلام',
                                            style: style,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  decline1 = false;
                                                });
                                              },
                                              child: const Icon(Icons.close))
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}

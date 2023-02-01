import 'package:erp_app/components/drop_down.dart';
import 'package:erp_app/components/text_fom_feild.dart';
import 'package:erp_app/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../components/appBar.dart';
import '../../components/botton.dart';
import '../../components/default_container.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class SendNotice extends StatefulWidget {
  const SendNotice({Key? key}) : super(key: key);

  @override
  State<SendNotice> createState() => _SendNoticeState();
}

class _SendNoticeState extends State<SendNotice> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  bool isVisible = false;
  String? selectTalab;
  String? stateTalab;

  List data = [
    {
      "1": "aramex",
      "2": "محمد محمود",
      "3": "نصر",
      "4": "القاهرة",
      "5": "طلب جديد",
      "6": " 20/1/2023 ",
      "7": "01"
    },
  ];
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 =
      TextEditingController(text: 'تم الشحن 01');

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              DefaultContainer(title: 'ارسال اشعار'),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: getProportionateScreenWidth(150),
                height: 50,
                child: DefaultInputForm(
                  controller: controller,
                  hint: 'رقم الاشعار',
                  label: 'رقم الاشعار',
                  onTab: () {},
                  validate: () {},
                  onSave: () {},
                  passFun: () {},
                  color: Colors.grey,
                  obscureText: false,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(90),
                    child: dropDown(
                      const ["احمد", "محمد", "محمود"],
                      selectTalab: selectTalab,
                      onchanged: () => (val) {
                        setState(() {
                          selectTalab = val;
                        });
                      },
                      label: 'ارسال الي',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(90),
                    child: dropDown(
                      const [
                        "تعديل طلب",
                        "استعجال طلب",
                        "الغاء طلب",
                      ],
                      selectTalab: stateTalab,
                      onchanged: () => (val) {
                        setState(() {
                          stateTalab = val;
                        });
                      },
                      label: 'نوع الاشعار',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Column(
                            children: [
                              SizedBox(
                                width: getProportionateScreenWidth(150),
                                height: 50,
                                child: DefaultInputForm(
                                  controller: controller1,
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
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            data[index]['4'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['5'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['6'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data[index]['7'],
                                            style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Image.asset(
                                            ImageAssets.iconDropDown18,
                                            width: 40,
                                            height: 40,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'اسم :',
                                                        style: getBoldStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        data[index]['2'],
                                                        style: getBoldStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 100,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "مدينة :",
                                                        style: getBoldStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Text(
                                                        data[index]['3'],
                                                        style: getBoldStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isVisible = true;
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.more_vert_outlined,
                                                    size: 50,
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: getProportionateScreenWidth(150),
                                    height: getProportionateScreenHeight(150),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'ارفاق ايصال الدفع',
                                          style: style,
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              ImageAssets.iconDropDown20,
                                              width:
                                                  getProportionateScreenWidth(
                                                      85),
                                              height:
                                                  getProportionateScreenHeight(
                                                      85),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: getProportionateScreenWidth(200),
                                        height:
                                            getProportionateScreenHeight(183),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.close),
                                                Text(
                                                  'ملحوظات',
                                                  style: style,
                                                ),
                                                Icon(Icons.more_horiz),
                                              ],
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                              thickness: 2,
                                            ),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 5,
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: data.length))
            ],
          ),
        ),
        isVisible
            ? Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Stack(children: [
                  Positioned(
                    right: width / 10,
                    top: height/3.8,
                    child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isVisible = false;
                              });
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 25,
                              color: Colors.white,
                            ))),
                  ),
                  Center(
                    child: Container(
                        width: 500,
                        height: 300,
                        decoration: const BoxDecoration(
                            color: Color(0xff82225E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(500.0),
                              topRight: Radius.circular(500.0),
                              bottomLeft: Radius.circular(400.0),
                              bottomRight: Radius.circular(400.0),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: Container(
                        width: 400,
                        height: 250,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(300.0),
                              topRight: Radius.circular(300.0),
                              bottomLeft: Radius.circular(350.0),
                              bottomRight: Radius.circular(350.0),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Botton(
                                color: ColorManager.white,
                                title: 'تفاصيل الطلب',
                                onTap: () {},
                                bgColor: ColorManager.primary),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            : Container(),
        DefaultAppBar()
      ],
    )));
  }
}

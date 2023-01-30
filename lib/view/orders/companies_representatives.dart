import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../components/appBar.dart';
import '../../components/botton.dart';
import '../../components/default_container.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';

class companies_representatives extends StatefulWidget {
  companies_representatives({Key? key}) : super(key: key);

  @override
  State<companies_representatives> createState() =>
      _companies_representativesState();
}

class _companies_representativesState extends State<companies_representatives> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  bool isVisible = false;

  List data = [
    {"1": "aramex", "2": "500 جنيه", "3": "5"},
    {"1": "aramex", "2": "500 جنيه", "3": "5"},
    {"1": "aramex", "2": "500 جنيه", "3": "5"},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                height: 50,
              ),
              DefaultContainer(title: 'شركات الشحن والمندوبين'),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.all(10),
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorManager.second,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index]['1'],
                                  style: getBoldStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'الرصيد',
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
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
                                            Text(
                                              "طلبات تحت التحصيل",
                                              style: getBoldStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isVisible = true;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.more_vert_outlined,
                                          size: 35,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ],
                            ),
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
                    right: width / 6,
                    child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isVisible = false;
                              });
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 100,
                              color: Colors.white,
                            ))),
                  ),
                  Center(
                    child: Container(
                        width: 500,
                        height: 250,
                        decoration: const BoxDecoration(
                            color: Color(0xff82225E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(400.0),
                              topRight: Radius.circular(400.0),
                              bottomLeft: Radius.circular(400.0),
                              bottomRight: Radius.circular(400.0),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Container(
                        width: 400,
                        height: 300,
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
                                title: 'كشف حساب',
                                onTap: () {},
                                bgColor: ColorManager.primary),
                            Botton(
                                color: ColorManager.white,
                                title: 'تحصيل',
                                onTap: () {},
                                bgColor: ColorManager.primary)
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

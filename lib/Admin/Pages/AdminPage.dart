import 'package:bake_house/Admin/Pages/MyCakePage.dart';
import 'package:bake_house/Admin/Pages/OrderPage.dart';
import 'package:bake_house/Admin/Pages/ReportPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminPage extends StatefulWidget {
  State<AdminPage> createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  int navIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  color: Color.fromARGB(255, 245, 204, 83),
                  width: 200,
                  height: double.infinity,
                  child: Container(
                    height: 200,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bakery_dining,
                                size: 30,
                              ),
                              const Text(
                                "Home bakers ",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          /*  GestureDetector(
                        onTap: () {
                          setState(() {
                            navIndex = 0;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.home),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      )*/
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navIndex = 1;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(Icons.cake_sharp),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "My cakes",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navIndex = 2;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(Icons.bookmark),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Orders",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navIndex = 3;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(Icons.report),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Report",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                      width: 1100,
                      child: navIndex == 1
                          ? MyCakePage()
                          : navIndex == 2
                              ? OrderPage()
                              : ReportPage()),
                )
              ],
            )),
      ),
    );
  }
}

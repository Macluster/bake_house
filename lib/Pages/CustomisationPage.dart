import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Components/CandleCard.dart';
import 'package:bake_house/Model/CandlesModel.dart';
import 'package:bake_house/Pages/LoginPage.dart';
import 'package:bake_house/Services/Authentication.dart';
import 'package:bake_house/Services/Database.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomisationPage extends StatefulWidget {
  ItemModel model = ItemModel("", "", "", "", 0, "", 0, "", 0);
  CustomisationPage(this.model);
  State<CustomisationPage> createState() => _CustomisationPage();
}

class _CustomisationPage extends State<CustomisationPage> {
  Alignment wightSwitchAlign = Alignment.centerLeft;
  List<candleModel> candleList = [];
  String DeliveryDate = "21/7/2022";
  String DeliveryTime = "5:55 PM";
  bool eggless = false;
  bool sugarFree = false;
  TextEditingController CakeWriting = TextEditingController();
  double WeightMarginLeft = 10;
  double CurrentWeight = 0.5;
  double totalCalories = 0;
  double CakePrice = 0;
  String CurrentUserId = "";

  candleModel CurrentcandleModel = candleModel("0", "", "", "0", "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Startup();
    totalCalories = widget.model.calories * 0.5;
    CakePrice = widget.model.price / 2;
  }

  void Startup() async {
    candleList = await Databasehandler().GetCandles();
    setState(() {});
    print("CandleList=");
    print(candleList);
    var pref = await SharedPreferences.getInstance();
    CurrentUserId = pref.getString('userId') ?? "null";
  }

  void TimePicker() async {
    String AmORPm = "AM";
    var result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    int hour = int.parse(result!.hour.toString()) > 12
        ? int.parse(result.hour.toString()) - 12
        : int.parse(result.hour.toString());
    int min = int.parse(result.minute.toString());
    AmORPm = int.parse(result.hour.toString()) > 12 ? "PM" : "AM";

    setState(() {
      DeliveryTime = "${hour.toString()}:${min.toString()} $AmORPm";
    });
    print(DeliveryTime);
  }

  void DatePicker() async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 356)),
      builder: (context, child) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 450,
                width: 700,
                child: child,
              ),
            ),
          ],
        );
      },
    );
    setState(() {
      DeliveryDate = "${result!.day}/${result.month}/${result.year}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.name,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                              height: 300,
                              width: 300,
                              child: Image.network(
                                widget.model.image + "1.png",
                                fit: BoxFit.cover,
                              )),
                          CurrentcandleModel.candleImage == ""
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(top: 90),
                                  child: Image.network(
                                    CurrentcandleModel.candleImage,
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (await Authentication().LoginChecker() ==
                                  true) {
                                Databasehandler handler = Databasehandler();
                                var isSuccess = await handler.addToCart(
                                    widget.model.id,
                                    CurrentUserId,
                                    CurrentWeight,
                                    totalCalories,
                                    eggless,
                                    sugarFree,
                                    CurrentcandleModel.candleId,
                                    CakeWriting.text,
                                    DeliveryDate,
                                    DeliveryTime);
                                if (isSuccess == true) {
                                  Fluttertoast.showToast(
                                      msg: 'Added to cart Successfuly',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow);
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Error in adding to cart',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow);
                                }
                              } else {
                                ShowAlert();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 150,
                              decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                'Add to cart',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (await Authentication().LoginChecker() ==
                                  true) {
                                Databasehandler handler = Databasehandler();
                                var isSuccess = await handler.addOrder(
                                    widget.model.id,
                                    CurrentUserId,
                                    CurrentWeight,
                                    totalCalories,
                                    eggless,
                                    sugarFree,
                                    CurrentcandleModel.candleId,
                                    CakeWriting.text,
                                    DeliveryDate,
                                    DeliveryTime);

                                if (isSuccess == true) {
                                  Fluttertoast.showToast(
                                      msg: 'Ordered successfuly',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow);
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Error in placing order',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow);
                                }
                              } else {
                                ShowAlert();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 150,
                              decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                'Pay ${CakePrice + int.parse(CurrentcandleModel.candlePrice)}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Set Cake properties",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      WeightPicker(),
                      CakeProperties(),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: Color.fromARGB(255, 233, 231, 231),
                        height: 50,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: CakeWriting,
                            decoration: const InputDecoration(
                                hintText: "Writing on cake"),
                            maxLines: 5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Delivery Date",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(DeliveryDate),
                              GestureDetector(
                                onTap: () {
                                  DatePicker();
                                },
                                child: Container(
                                  height: 30,
                                  width: 60,
                                  alignment: Alignment.center,
                                  color: Colors.blue,
                                  child: Text("Change"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Delivery Time",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(DeliveryTime),
                              GestureDetector(
                                onTap: () {
                                  TimePicker();
                                },
                                child: Container(
                                  height: 30,
                                  width: 60,
                                  alignment: Alignment.center,
                                  color: Colors.blue,
                                  child: Text("Change"),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Select Candle",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CandleCourosel(),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }

  void ShowAlert() {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Login Alert"),
      content: Text("you have not Logged in yet?. Go to Login Page"),
      actions: [okButton, cancelButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget CandleCourosel() {
    return Container(
      width: 400,
      height: 100,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 100,
          aspectRatio: 16 / 9,
          viewportFraction: 0.5,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          scrollDirection: Axis.horizontal,
        ),
        items: candleList.map((model) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      CurrentcandleModel = model;
                    });
                  },
                  child: CandlesCard(model));
            },
          );
        }).toList(),
      ),
    );
  }

  Widget WeightPicker() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: EdgeInsets.only(left: WeightMarginLeft),
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 173, 213, 246),
              borderRadius: BorderRadius.all(Radius.circular(27))),
        ),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    WeightMarginLeft = 10;
                    CurrentWeight = 0.5;
                    totalCalories = widget.model.calories * 0.5;
                    CakePrice = widget.model.price / 2;
                  });
                },
                child: Text(
                  "0.5KG",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    WeightMarginLeft = 60;
                    CurrentWeight = 1;
                    totalCalories = widget.model.calories * 1;
                    CakePrice = widget.model.price / 1;
                  });
                },
                child: Text(
                  "1KG",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    WeightMarginLeft = 110;
                    CurrentWeight = 2;
                    totalCalories = widget.model.calories * 2;
                    CakePrice = widget.model.price * 2;
                  });
                },
                child: Text(
                  "2KG",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    WeightMarginLeft = 160;
                    CurrentWeight = 3;
                    totalCalories = widget.model.calories * 3;
                    CakePrice = widget.model.price * 3;
                  });
                },
                child: Text(
                  "3KG",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    WeightMarginLeft = 210;
                    CurrentWeight = 4;
                    totalCalories = widget.model.calories * 4;
                    CakePrice = widget.model.price * 4;
                  });
                },
                child: Text(
                  "4KG",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget CakeProperties() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 173, 218, 255),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Text(
              totalCalories.toString() + " cal",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: eggless,
                      onChanged: (value) {
                        setState(() {
                          eggless = value as bool;
                          if (value == true)
                            totalCalories -= 300 * CurrentWeight;
                          else
                            totalCalories += 300 * CurrentWeight;
                        });
                      }),
                  Text("Egg Less"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: sugarFree,
                      onChanged: (value) {
                        setState(() {
                          sugarFree = value as bool;
                          if (value == true)
                            totalCalories -= 1200 * CurrentWeight;
                          else
                            totalCalories += 1200 * CurrentWeight;
                        });
                      }),
                  Text("Sugar Free")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

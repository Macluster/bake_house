import 'package:bake_house/Admin/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/ReschedulePopProvider.dart';
import '../Providers/OrderProvider.dart';

class ReschedulePopup extends StatefulWidget {
  @override
  State<ReschedulePopup> createState() => _ReschedulePopupState();
}

class _ReschedulePopupState extends State<ReschedulePopup> {
  String DeliveryDate = "21/7/2022";
  String DeliveryTime = "5:55 PM";

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
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Consumer<OrderProvider>(
          builder: ((context, value, child) {
            return Container(
                height: 500,
                width: 500,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: GestureDetector(
                              onTap: () {
                                context
                                    .read<ReschedulePopProvider>()
                                    .changeShowpopUp(false);
                              },
                              child: Icon(Icons.close)),
                        ),
                      ],
                    ),
                    const Text(
                      "Select Reschedule Time and date",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      DeliveryTime,
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      DeliveryDate,
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            TimePicker();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: Color.fromARGB(255, 162, 54, 244),
                            height: 50,
                            width: 100,
                            child: Text("change Time"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            DatePicker();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: Color.fromARGB(255, 162, 54, 244),
                            height: 50,
                            width: 100,
                            child: Text("change date"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        AdminDatabase().updateOrders(DeliveryTime, DeliveryDate,
                            2.toString(), value.model.orderId.toString());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        height: 50,
                        width: 100,
                        child: Text("Submit"),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ));
          }),
        ),
      ),
    );
  }
}

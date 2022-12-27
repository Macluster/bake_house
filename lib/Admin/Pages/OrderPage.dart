import 'dart:html';

import 'package:bake_house/Admin/AdminComponents/OrderCard.dart';
import 'package:bake_house/Admin/AdminComponents/OrderDetailsBox.dart';
import 'package:bake_house/Admin/AdminComponents/ReshedulePoPup.dart';
import 'package:bake_house/Admin/Database.dart';
import 'package:bake_house/Admin/Models/MessageModel.dart';
import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:bake_house/Admin/Providers/OrderProvider.dart';
import 'package:bake_house/Provider/ReschedulePopProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/CartModel.dart';
import '../Providers/OrderstateProvider.dart';
import '../Providers/PopUpProvider.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    start();
  }

  void start() {
    context.read<OrderStateProvider>().ResetOrderStateList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "OrderPage",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Consumer<OrderStateProvider>(
                      builder: ((context, value, child) {
                        return Container(
                          height: 500,
                          width: 500,
                          child: ListView.builder(
                              itemCount: value.list.length,
                              itemBuilder: (context, index) {
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  int id = 0;
                                  for (int k = 0; k < value.list.length; k++) {
                                    if (value.list[index].status !=
                                            "canceled" &&
                                        value.list[index].status !=
                                            "finished") {
                                      id = k;
                                      break;
                                    }
                                  }
// Here you can write your code
                                  value.list[id].status != "canceled" &&
                                          value.list[id].status != "finished"
                                      ? context
                                          .read<OrderProvider>()
                                          .changeOrderId(value.list[0])
                                      : print("");
                                });

                                return value.list[index].status != "canceled" &&
                                        value.list[index].status != "finished"
                                    ? OrderCard(value.list[index])
                                    : Text("Loadinfg");
                              }),
                        );
                      }),
                    ),
                  ),
                 const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 1,
                    child: Consumer<OrderProvider>(
                      builder: ((context, value, child) {
                        return Container(
                            height: 500,
                            width: 200,
                            color: Colors.amber,
                            child: OrderDetailsBox(value.GetOrderModel));
                      }),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Consumer<ReschedulePopProvider>(
          builder: ((context, value, child) {
            return value.showPopUpValue == true
                ? ReschedulePopup()
                : Container();
          }),
        ),
      ],
    );
  }
}

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
import '../Providers/PopUpProvider.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
                    child: Container(
                      height: 500,
                      width: 500,
                      child: FutureBuilder(
                        future: AdminDatabase().GetOrders(),
                        builder:
                            ((context, AsyncSnapshot<List<OrderModel>> snap) {
                          if (snap.hasData) {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              int id = 0;
                              for (int k = 0; k < snap.data!.length; k++) {
                                if (snap.data![k].status != "canceled" &&
                                    snap.data![k].status != "finished") {
                                  id = k;
                                  break;
                                }
                              }
// Here you can write your code
                              snap.data![id].status != "canceled" &&
                                      snap.data![id].status != "finished"
                                  ? context
                                      .read<OrderProvider>()
                                      .changeOrderId(snap.data![0])
                                  : print("");
                            });

                            return ListView.builder(
                                itemCount: snap.data!.length,
                                itemBuilder: (context, index) {
                                  return snap.data![index].status !=
                                              "canceled" &&
                                          snap.data![index].status != "finished"
                                      ? OrderCard(snap.data![index])
                                      : Container();
                                });
                          } else
                            return Text("loading");
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
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

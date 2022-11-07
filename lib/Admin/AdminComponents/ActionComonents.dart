import 'package:bake_house/Admin/Database.dart';
import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:bake_house/Model/CartModel.dart';
import 'package:bake_house/Provider/ReschedulePopProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionComponents extends StatefulWidget {
  OrderModel model;
  ActionComponents(this.model);
  @override
  State<ActionComponents> createState() => _ActionComponentsState();
}

class _ActionComponentsState extends State<ActionComponents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              AdminDatabase().updateOrders("asdsa ", " asd", 0.toString(),
                  widget.model.orderId.toString());
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              color: Colors.green,
              child:
                  Text("Accept", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          GestureDetector(
            onTap: () {
              AdminDatabase().updateOrders(" afaf", "asfas ", 1.toString(),
                  widget.model.orderId.toString());
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              color: Colors.red,
              child: Text(
                "Reject Order",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<ReschedulePopProvider>().changeShowpopUp(true);
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              color: Color.fromARGB(255, 230, 173, 88),
              child: Text("Request for rescheduling of time",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          GestureDetector(
            onTap: () {
              AdminDatabase().updateOrders("asf ", "asff ", 3.toString(),
                  widget.model.orderId.toString());
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              color: Color.fromARGB(255, 230, 173, 88),
              child: Text("Done",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}

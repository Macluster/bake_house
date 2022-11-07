import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:bake_house/Admin/Providers/OrderProvider.dart';
import 'package:bake_house/Model/CartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatefulWidget {
  OrderModel model;
  OrderCard(this.model);
  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<OrderProvider>().changeOrderId(widget.model);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            Image.network(
              widget.model.cakeImage + "3.png",
              height: 70,
              width: 70,
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.cakeName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Weight:" + widget.model.weight.toString() + "Kg"),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Sugar Free: " +
                        (widget.model.sugarfree == 1 ? "Yes" : "No")),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Eggless: " +
                        (widget.model.eggless == 1 ? "Yes" : "No"))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

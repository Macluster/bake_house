import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:bake_house/Model/CartModel.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  OrderModel model = OrderModel(1, "", "", 1, 1, 1, 1, 1, 1, 1, 0, "", "", "","","");

  OrderModel get GetOrderModel => model;

  void changeOrderId(OrderModel model) {
    this.model = model;
    notifyListeners();
  }
}

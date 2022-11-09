

import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:flutter/cupertino.dart';

import '../Database.dart';

class OrderStateProvider extends ChangeNotifier
{

 List<OrderModel> mdoel=[];
 List<OrderModel> get list=>mdoel;


 ResetOrderStateList()async
 {

      this.mdoel=await AdminDatabase().GetOrders();

     notifyListeners();

 }





}
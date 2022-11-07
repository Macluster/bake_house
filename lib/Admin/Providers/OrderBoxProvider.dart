import 'package:flutter/cupertino.dart';

class OrderBoxProvider extends ChangeNotifier {
  int  orderBoxflag = 0;

  int get getOrderBoxFlag =>orderBoxflag;

  changeOrderBoxFlag(int value) {
    orderBoxflag = value;
    notifyListeners();
  }
}

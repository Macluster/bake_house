import 'package:flutter/cupertino.dart';

class ReschedulePopProvider extends ChangeNotifier {
  bool showPopUp = false;

  bool get showPopUpValue => showPopUp;

  changeShowpopUp(bool value) {
    showPopUp = value;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class ItemDetailsPageProvider extends ChangeNotifier {
  bool addReviewPopUpisVisible = false;

  bool get popUpVisible => addReviewPopUpisVisible;

  void changePopupVisibility(bool value) {
    addReviewPopUpisVisible = value;
    notifyListeners();
  }
}

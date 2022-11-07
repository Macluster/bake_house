import 'package:flutter/widgets.dart';

class PopUpProvider extends ChangeNotifier
{

  bool status=false;


  bool get GetStatus=>status;


   void  setStatus(bool status)
   {
      this.status=status;
      notifyListeners();
   }

}
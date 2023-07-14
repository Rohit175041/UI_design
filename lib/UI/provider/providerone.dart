import 'package:flutter/material.dart';

class Itembutton extends ChangeNotifier {
  bool light = true;
  bool ac = true;
  bool tv = true;
  bool fan = true;
  void lightbutton(bool value) {
    light = value;
    print("light");
    notifyListeners();
  }

  void acbutton(bool value) {
    print("ac");
    ac = value;
    notifyListeners();
  }

  void tvbutton(bool value) {
    print("tv");
    tv = value;
    notifyListeners();
  }

  void fanbutton(bool value) {
    print("fan");
    fan = value;
    notifyListeners();
  }

}

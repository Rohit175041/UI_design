import 'package:flutter/material.dart';

class Itembutton2 extends ChangeNotifier {
  bool light = true;
  bool ac = true;
  bool tv = true;
  bool fan = true;
  bool device = true;
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
    print("$value -> device connection: $tv");
    notifyListeners();
  }

  void fanbutton(bool value) {
    print("fan");
    fan = value;
    notifyListeners();
  }

  void deviceconnect(bool value) {
    device = value;
    print("$value -> device connection: $device");
    notifyListeners();
  }
}

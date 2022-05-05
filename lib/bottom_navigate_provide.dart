import 'package:flutter/widgets.dart';

class BottomNavigateProvide extends ChangeNotifier {
  int selectedIndex = 0;

  changeIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }
}

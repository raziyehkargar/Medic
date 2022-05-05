import 'dart:ffi';

import 'dart:math';

class AppData {
  // String firstName;
  // String place;
  // Map<int, String> weekDays = {
  //   0: "Sat",
  //   1: "Sun",
  //   2: "Mon",
  //   3: "Tus",
  //   4: "Wen",
  //   5: "Thr",
  //   6: "Fri"
  // };

  String get name => "AfreenKhan";

  String get place => 'Lucknow, India';

  String get imageUrl => "assets/img/profile/user.jpg";

  List<DataItem> get chartData => List.generate(
      7,
      (index) => DataItem(
          x: index,
          y1: Random().nextInt(1000).toDouble(),
          y2: Random().nextInt(1000).toDouble()));
}

class DataItem {
  int x;
  double y1;
  double y2;

  DataItem({required this.x, required this.y1, required this.y2});
}

// enum weekDays{
//   Sat,Sun,Mon,Tus,Wen,Thr,Fri
// }
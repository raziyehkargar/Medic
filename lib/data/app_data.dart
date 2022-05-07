import 'dart:math';

class AppData {
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

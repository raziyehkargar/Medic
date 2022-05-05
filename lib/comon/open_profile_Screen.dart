import 'package:flutter/cupertino.dart';
import 'package:medic/bottom_navigate_provide.dart';
import 'package:medic/main.dart';
import 'package:provider/provider.dart';

openProfileScreen(BuildContext context) {
  Provider.of<BottomNavigateProvide>(context, listen: false)
      .changeIndex(profileIndex);
}

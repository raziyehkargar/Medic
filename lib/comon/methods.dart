import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/bottom_navigate_provide.dart';
import 'package:medic/screens/main_screen.dart';
import 'package:provider/provider.dart';

openProfileScreen(BuildContext context) {
  Provider.of<BottomNavigateProvide>(context, listen: false)
      .changeIndex(profileIndex);
}

push(BuildContext context, var page) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => page,
    ),
  );
}

pushReplacement(BuildContext context, var page) {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (context) => page,
    ),
  );
}

showSnakbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

String? validateEmail(String value) {
  // Pattern pattern =
  //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //     r"{0,253}[a-zA-Z0-9])?)*$";

  // RegExp regex =  RegExp(pattern);
  // if (!regex.hasMatch(value) || value == null)
  //   return 'Enter a valid email address';

  if (!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
      .hasMatch(value)) {
    return 'Please enter a valid Email';
  } else {
    return null;
  }
}

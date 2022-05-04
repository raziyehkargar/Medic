import 'package:flutter/material.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/gen/assets.gen.dart';
import 'package:medic/screens/home.dart';
import 'package:medic/screens/profile.dart';
import 'package:medic/screens/sound.dart';
import 'package:medic/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: defaultStyle2.fontFamily,
        // This is the theme of your application.

        colorScheme: const ColorScheme.dark(
          primary: DarkThemeColor.primaryColor,
          onPrimary: DarkThemeColor.onPrimaryColor,
          secondary: DarkThemeColor.secondaryColor,
          onSecondary: DarkThemeColor.onSecondaryColor,
          surface: DarkThemeColor.surfaceColor,
          onSurface: DarkThemeColor.onSurfaceColor,
          background: DarkThemeColor.primaryColor,
          onBackground: DarkThemeColor.onPrimaryColor,
        ),
        // buttonTheme: ButtonThemeData(
        //     buttonColor: DarkThemeColor.secondaryColor,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(DarkThemeColor.secondaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))))),
        scaffoldBackgroundColor: DarkThemeColor.primaryColor,
        tabBarTheme: TabBarTheme(
            labelStyle: defaultStyle2.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelStyle: defaultStyle2.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(.1))),
        textTheme: TextTheme(
          headline3: defaultStyle1.copyWith(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline4: defaultStyle1.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline5: defaultStyle1.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          button: defaultStyle2.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: defaultStyle2.copyWith(
            fontSize: 38,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: defaultStyle2.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: defaultStyle2.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: defaultStyle2.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          caption: defaultStyle2.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottonNavigationBar(),
      body: IndexedStack(
        index: 2,
        children: const [
          HomeScreen(),
          SoundScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}

class _BottonNavigationBar extends StatelessWidget {
  const _BottonNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    // final width=28.78;
    // final heignt=30;
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      color: themeData.colorScheme.background,
      child: Row(
        children: [
          Expanded(
            child: Assets.img.icon.home.svg(
                width: 28.78,
                height: 30,
                color: themeData.colorScheme.onBackground),
          ),
          Expanded(
            child: Assets.img.icon.sound.svg(
                width: 26.93,
                height: 25,
                color: themeData.colorScheme.onBackground),
          ),
          Expanded(
            child: Assets.img.icon.vector.svg(
                width: 15.76,
                height: 20,
                color: themeData.colorScheme.onBackground),
          ),
        ],
      ),
    );
  }
}

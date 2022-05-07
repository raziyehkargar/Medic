import 'package:flutter/material.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/screens/meditation.dart';
import 'package:medic/screens/splash.dart';
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
        fontFamily: Constant.defaultStyle2.fontFamily,
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
          tertiary: DarkThemeColor.tertiary,
        ),
        textTheme: TextTheme(
          headline3: Constant.defaultStyle1.copyWith(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline4: Constant.defaultStyle1.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline5: Constant.defaultStyle1.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          button: Constant.defaultStyle2.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: Constant.defaultStyle2.copyWith(
            fontSize: 38,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: Constant.defaultStyle2.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: Constant.defaultStyle2.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: Constant.defaultStyle2.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          caption: Constant.defaultStyle2.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),

        // buttonTheme: ButtonThemeData(
        //     buttonColor: DarkThemeColor.secondaryColor,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(200, 60)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            backgroundColor:
                MaterialStateProperty.all(DarkThemeColor.secondaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        scaffoldBackgroundColor: DarkThemeColor.primaryColor,
        tabBarTheme: TabBarTheme(
            labelStyle: Constant.defaultStyle2
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelStyle: Constant.defaultStyle2.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(.1))),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
          labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 18,
              color: DarkThemeColor.primaryTextColor
                  .withOpacity(Constant.opacityColor)),
          errorStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: DarkThemeColor.errorTextColor),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: DarkThemeColor.errorTextColor)),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: DarkThemeColor.errorTextColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(Constant.opacityColor))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(Constant.opacityColor))),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: DarkThemeColor.secondaryColor,
          contentTextStyle: TextStyle(
            color: DarkThemeColor.onSecondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const MeditationScreen(),
      // home: const SplashScreen(),

      // ChangeNotifierProvider(
      //     create: (_) => BottomNavigateProvide(), child: const Main()),
    );
  }
}

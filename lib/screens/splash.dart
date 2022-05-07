import 'package:flutter/material.dart';
import 'package:medic/comon/methods.dart';
import 'package:medic/gen/assets.gen.dart';
import 'package:medic/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => pushReplacement(context, const OnboardingScreen()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Assets.img.background.onboardingbk, fit: BoxFit.cover)),
        child: Center(
          child: Assets.img.icon.logo.svg(
            width: 202,
            height: 213,
          ),
        ),
      ),
    );
  }
}

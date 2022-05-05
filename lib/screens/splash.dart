import 'package:flutter/material.dart';
import 'package:medic/gen/assets.gen.dart';
import 'package:medic/screens/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Onboarding(),
        ),
      ),
    );

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
            width: 191,
            height: 199,
          ),
        ),
      ),
    );
  }
}

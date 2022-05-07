import 'package:flutter/material.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/comon/methods.dart';
import 'package:medic/gen/assets.gen.dart';
import 'package:medic/screens/singin_singup.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Assets.img.background.onboardingbk,
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                Constant.defMargin,
                MediaQuery.of(context).size.height / 5,
                Constant.defMargin,
                2 * Constant.defMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Assets.img.icon.logo.svg(
                  width: 191,
                  height: 199,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'WELCOME',
                  style: themeData.textTheme.headline3!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Do meditation. Stay focused.\nLive a healthy life.',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Expanded(child: Container()),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      pushReplacement(context, const SingIn());
                    },
                    child: const Text('Login With Email'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t have an account? '),
                    InkWell(
                      onTap: () {
                        push(context, SingUp());
                      },
                      child: Text(
                        'Sign Up',
                        style: themeData.textTheme.bodyText2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

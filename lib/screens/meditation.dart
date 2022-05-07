import 'package:flutter/material.dart';
import 'package:medic/comon/appbar.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/gen/assets.gen.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    String timer = "00:00";
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppbar(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  Constant.defMargin, 16, Constant.defMargin, 0),
              child: Column(
                children: [
                  Text(
                    'Meditation',
                    style: themeData.textTheme.headline3,
                  ),
                  Text(
                    'Guided by a short introductory course,start trying meditation.',
                    style: themeData.textTheme.bodyText2!.copyWith(
                        color: themeData.textTheme.bodyText2!.color!
                            .withOpacity(Constant.opacityColor)),
                  ),
                  Assets.img.shape.meditating.image(width: 283, height: 217.45),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    timer,
                    style: themeData.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(onPressed: () {}, child: Text('start'))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medic/bottom_navigate_provide.dart';
import 'package:medic/comon/appbar.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/comon/open_profile_Screen.dart';
import 'package:medic/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                onTap: () {
                  // Provider.of<BottomNavigateProvide>(context, listen: false)
                  //     .changeIndex(profileIndex);
                  openProfileScreen(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(defMargin, 0, defMargin, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, Afreen!',
                      style: themeData.textTheme.headline4,
                    ),
                    Text(
                      'How are you feeling today ?',
                      style:
                          themeData.textTheme.bodyText2!.copyWith(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _ShapeItem(
                          themeData: themeData,
                          image: Assets.img.shape.shape1
                              .svg(width: 35, height: 35),
                          title: 'Calm',
                        ),
                        _ShapeItem(
                          themeData: themeData,
                          image: Assets.img.shape.shape2
                              .svg(width: 35, height: 35),
                          title: 'Relax',
                        ),
                        _ShapeItem(
                          themeData: themeData,
                          image: Assets.img.shape.shape3
                              .svg(width: 35, height: 35),
                          title: 'Focus',
                        ),
                        _ShapeItem(
                          themeData: themeData,
                          image: Assets.img.shape.shape4
                              .svg(width: 35, height: 35),
                          title: 'Anxious',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              _HomeCard(
                themeData: themeData,
                title: 'Meditation 101',
                subTitle: 'Techniques, Benefits, and a Beginner’s How-To',
                image: Assets.img.background.cardImage1
                    .image(width: 166, height: 111),
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              _HomeCard(
                themeData: themeData,
                title: 'Cardio Meditation',
                subTitle:
                    'Basics of Yoga for Beginners or Experienced Professionals',
                image: Assets.img.background.cardImage2
                    .image(width: 129, height: 129),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Image image;
  final Function() onTap;
  const _HomeCard({
    Key? key,
    required this.themeData,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: defMargin / 2, right: defMargin / 2),
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: themeData.textTheme.headline5!
                      .apply(color: themeData.colorScheme.primary),
                ),
                Text(
                  subTitle,
                  style: themeData.textTheme.subtitle2!.apply(
                    color: themeData.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            themeData.colorScheme.primary),
                        fixedSize:
                            MaterialStateProperty.all(const Size(138, 39))),
                    onPressed: onTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Watch now', style: themeData.textTheme.caption),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 13,
                        )
                      ],
                    ))
              ],
            ),
          ),
          Column(
            children: [
              image,
            ],
          ),
        ],
      ),
    );
  }
}

class _ShapeItem extends StatelessWidget {
  final SvgPicture image;
  final String title;
  const _ShapeItem({
    Key? key,
    required this.themeData,
    required this.image,
    required this.title,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 62,
          height: 65,
          decoration: BoxDecoration(
            color: themeData.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: image),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(title, style: themeData.textTheme.caption),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medic/comon/appbar.dart';
import 'package:medic/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Appbar
              CustomAppbar(
                isProfileScreen: true,
                onTap: () {},
              ),
              //Profile picture
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Assets.img.profile.user.image(width: 150, height: 150),
              ),
              Text(
                'Afreen Khan',
                style: themeData.textTheme.headline3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

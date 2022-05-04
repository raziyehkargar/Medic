import 'package:flutter/material.dart';
import 'package:medic/gen/assets.gen.dart';

class CustomAppbar extends StatelessWidget {
  final bool isProfileScreen;
  final Function() onTap;
  const CustomAppbar({
    Key? key,
    this.isProfileScreen = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.img.icon.menu.svg(width: 22, height: 18),
              Assets.img.icon.logo.svg(width: 43.41, height: 49),
              InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(18),
                child: !isProfileScreen
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Assets.img.profile.user
                            .image(width: 35, height: 35))
                    : Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'edit',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

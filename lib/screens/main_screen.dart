import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/bottom_navigate_provide.dart';
import 'package:medic/screens/home.dart';
import 'package:medic/screens/profile.dart';
import 'package:medic/screens/sound.dart';
import 'package:provider/provider.dart';

const int homeIndex = 0;
const int soundIndex = 1;
const int profileIndex = 2;

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => BottomNavigateProvide(), child: const Main());
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  //int selectedScreenIndex = homeIndex;

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _soundKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final Map map = {
    homeIndex: _homeKey,
    soundIndex: _soundKey,
    profileIndex: _profileKey
  };

  @override
  Widget build(BuildContext context) {
    Provider.of<BottomNavigateProvide>(context, listen: false)
        .changeIndex(homeIndex);
    return Consumer<BottomNavigateProvide>(
      builder: (context, bottomNavigationProvider, _) => Scaffold(
        bottomNavigationBar: _BottonNavigationBar(
          // selectedIndex: selectedScreenIndex,
          selectedIndex:
              Provider.of<BottomNavigateProvide>(context).selectedIndex,
          onTap: (index) {
            // setState(() {
            //   //selectedScreenIndex = index;

            // });
            bottomNavigationProvider.changeIndex(index);
          },
        ),
        body: IndexedStack(
          // index: selectedScreenIndex,
          index: Provider.of<BottomNavigateProvide>(context).selectedIndex,
          children: [
            Navigator(
                key: _homeKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const HomeScreen())),
            Navigator(
              key: _soundKey,
              onGenerateRoute: (setting) =>
                  MaterialPageRoute(builder: (context) => const SoundScreen()),
            ),
            Navigator(
              key: _profileKey,
              onGenerateRoute: (seting) => MaterialPageRoute(
                  builder: (context) => const ProfileScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottonNavigationBar extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _BottonNavigationBar(
      {Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BottomNavigationItem(
            themeData: themeData,
            imageName: "logo",
            width: 28.78,
            height: 30,
            isActive: selectedIndex == homeIndex,
            onTap: () {
              onTap(homeIndex);
            },
          ),
          _BottomNavigationItem(
            themeData: themeData,
            imageName: "sound",
            width: 26.93,
            height: 25,
            isActive: selectedIndex == soundIndex,
            onTap: () {
              onTap(soundIndex);
            },
          ),
          _BottomNavigationItem(
            themeData: themeData,
            imageName: "profile",
            width: 15.76,
            height: 20,
            isActive: selectedIndex == profileIndex,
            onTap: () {
              onTap(profileIndex);
            },
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final ThemeData themeData;
  final String imageName;
  final double width;
  final double height;
  final bool isActive;
  final Function() onTap;
  final double factor = 0.7;
  const _BottomNavigationItem({
    Key? key,
    required this.themeData,
    required this.imageName,
    required this.width,
    required this.height,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/img/icon/$imageName.svg",
              width: isActive ? width : width * factor,
              height: isActive ? height : height * factor,
              color: isActive
                  ? themeData.colorScheme.onBackground
                  : themeData.colorScheme.onBackground.withOpacity(.4),
            ),
          ],
        ),
      ),
    );
  }
}

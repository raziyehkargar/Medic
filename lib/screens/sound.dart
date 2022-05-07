import 'package:flutter/material.dart';
import 'package:medic/comon/appbar.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/comon/methods.dart';
import 'package:medic/gen/assets.gen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class SoundScreen extends StatelessWidget {
  const SoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: Constant.defaultPhysics,
          child: Column(
            children: [
              const CustomAppbar(),
              ClipRRect(
                  borderRadius: BorderRadius.circular(125),
                  child: Assets.img.background.forest
                      .image(width: 250, height: 250)),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Painting Forest',
                style: themeData.textTheme.headline3,
              ),
              Text(
                'By: Painting with Passion',
                style: themeData.textTheme.bodyText2!.copyWith(fontSize: 25),
              ),
              const _Player(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Player extends StatefulWidget {
  const _Player({Key? key}) : super(key: key);

  @override
  State<_Player> createState() => _PlayerState();
}

class _PlayerState extends State<_Player> {
  // AudioCache audioCache = AudioCache();
  // AudioPlayer advancedPlayer = AudioPlayer();
  // String? localFilePath;
  // String? localAudioCacheURI;

  // @override
  // void initState() {
  //   super.initState();

  //   // if (kIsWeb) {
  //   //   // Calls to Platform.isIOS fails on web
  //   //   return;
  //   // }
  //   if (Platform.isIOS) {
  //     audioCache.fixedPlayer?.notificationService.startHeadlessService();
  //   }
  // }

  // playLocal(String localPath) async {
  //   int result = await advancedPlayer.play(localPath, isLocal: true);
  //   if (result == 1) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
    // MultiProvider(
    //   providers: [
    //     StreamProvider<Duration>.value(
    //       value: advancedPlayer.onAudioPositionChanged,
    //       initialData: const Duration(),
    //     ),
    //   ],
    // );
  }
}

class Advanced extends StatefulWidget {
  final AudioPlayer advancedPlayer;

  const Advanced({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  _AdvancedState createState() => _AdvancedState();
}

class _AdvancedState extends State<Advanced> {
  bool? seekDone;

  @override
  void initState() {
    widget.advancedPlayer.onSeekComplete
        .listen((event) => setState(() => seekDone = true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final audioPosition = Provider.of<Duration>(context);
    return SingleChildScrollView(
      physics: Constant.defaultPhysics,
    );
  }
}

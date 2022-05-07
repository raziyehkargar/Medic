/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/music1.mp3
  String get music1 => 'assets/audio/music1.mp3';
}

class $AssetsImgGen {
  const $AssetsImgGen();

  $AssetsImgBackgroundGen get background => const $AssetsImgBackgroundGen();
  $AssetsImgIconGen get icon => const $AssetsImgIconGen();
  $AssetsImgProfileGen get profile => const $AssetsImgProfileGen();
  $AssetsImgShapeGen get shape => const $AssetsImgShapeGen();
}

class $AssetsImgBackgroundGen {
  const $AssetsImgBackgroundGen();

  /// File path: assets/img/background/cardImage1.png
  AssetGenImage get cardImage1 =>
      const AssetGenImage('assets/img/background/cardImage1.png');

  /// File path: assets/img/background/cardImage2.png
  AssetGenImage get cardImage2 =>
      const AssetGenImage('assets/img/background/cardImage2.png');

  /// File path: assets/img/background/desert.png
  AssetGenImage get desert =>
      const AssetGenImage('assets/img/background/desert.png');

  /// File path: assets/img/background/forest.png
  AssetGenImage get forest =>
      const AssetGenImage('assets/img/background/forest.png');

  /// File path: assets/img/background/hill.png
  AssetGenImage get hill =>
      const AssetGenImage('assets/img/background/hill.png');

  /// File path: assets/img/background/leaf.png
  AssetGenImage get leaf =>
      const AssetGenImage('assets/img/background/leaf.png');

  /// File path: assets/img/background/mountain.png
  AssetGenImage get mountain =>
      const AssetGenImage('assets/img/background/mountain.png');

  /// File path: assets/img/background/onboardingbk.png
  AssetGenImage get onboardingbk =>
      const AssetGenImage('assets/img/background/onboardingbk.png');
}

class $AssetsImgIconGen {
  const $AssetsImgIconGen();

  /// File path: assets/img/icon/home.svg
  SvgGenImage get home => const SvgGenImage('assets/img/icon/home.svg');

  /// File path: assets/img/icon/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/img/icon/logo.svg');

  /// File path: assets/img/icon/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/img/icon/menu.svg');

  /// File path: assets/img/icon/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/img/icon/profile.svg');

  /// File path: assets/img/icon/sound.svg
  SvgGenImage get sound => const SvgGenImage('assets/img/icon/sound.svg');
}

class $AssetsImgProfileGen {
  const $AssetsImgProfileGen();

  /// File path: assets/img/profile/user.jpg
  AssetGenImage get user => const AssetGenImage('assets/img/profile/user.jpg');
}

class $AssetsImgShapeGen {
  const $AssetsImgShapeGen();

  /// File path: assets/img/shape/shape1.svg
  SvgGenImage get shape1 => const SvgGenImage('assets/img/shape/shape1.svg');

  /// File path: assets/img/shape/shape2.svg
  SvgGenImage get shape2 => const SvgGenImage('assets/img/shape/shape2.svg');

  /// File path: assets/img/shape/shape3.svg
  SvgGenImage get shape3 => const SvgGenImage('assets/img/shape/shape3.svg');

  /// File path: assets/img/shape/shape4.svg
  SvgGenImage get shape4 => const SvgGenImage('assets/img/shape/shape4.svg');

  /// File path: assets/img/shape/shape5.png
  AssetGenImage get shape5 =>
      const AssetGenImage('assets/img/shape/shape5.png');
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsImgGen img = $AssetsImgGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}

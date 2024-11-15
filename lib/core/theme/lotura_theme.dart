import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';

class LoturaTheme {
  LoturaTheme._();

  static final ThemeData light = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      scrim: LoturaLightColor.transparent,
      primary: LoturaLightColor.main500, /// 기본색 - 제일 많이 사용하는 컬러
      onPrimary: LoturaLightColor.main900, /// 기본색 - 다른 색의 구성요소로 사용되는 컬러
      primaryContainer: LoturaLightColor.main50, /// 기본색 - 다른 색의 바탕이 되는 컬러
      primaryFixed: LoturaLightColor.main300, /// 기본색 - primaryContainer의 대체품
      secondary: LoturaLightColor.gray50, /// 보조색 - 제일 많이 사용하는 컬러
      onSecondary: LoturaLightColor.gray500, /// 보조색 - 다른 색의 구성요소로 사용되는 컬러
      error: LoturaLightColor.red20, /// 오류 구성요소에 사용할 색상
      onError: LoturaLightColor.red10, /// 오류 바탕에 사용할 색상
      tertiary: LoturaLightColor.green20, /// 제 3자 색상 - 구성요소에 사용할 색상
      onTertiary: LoturaLightColor.green10, /// 제 3자 색상 - 바탕에 사용할 색상
      inverseSurface: LoturaLightColor.black, /// 바탕과 대비되는 색
      surface: LoturaLightColor.background, /// 바탕색
      onSurface: LoturaLightColor.white, /// 바탕 위 구성요소에 사용할 색
      surfaceContainerHigh: LoturaLightColor.gray900, /// 페이지에서 강조되어야하는 구성요소에 사용되는 색상
      surfaceContainerHighest: LoturaLightColor.gray800, /// 페이지에서 더 강조되어야하는 구성요소에 사용되는 색상
      surfaceContainer: LoturaLightColor.gray700, /// 페이지, 위젯들을 부가설명하는 구성요소에 사용되는 색상
      surfaceContainerLow: LoturaLightColor.gray600, /// SurfaceContainer보다 덜 강조되어야하는 구성요소에 사용되는 색상
      surfaceContainerLowest: LoturaLightColor.gray100, /// 구성 요소중에 가장 덜 강조되어야하는 구성요소에 사용되는 색상
      surfaceDim: LoturaLightColor.gray200,
      surfaceTint: LoturaLightColor.gray300,
    ),
  );

  static final ThemeData dark = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      scrim: LoturaDarkColor.transparent,
      primary: LoturaDarkColor.main500, /// 기본색 - 제일 많이 사용하는 컬러
      onPrimary: LoturaDarkColor.main900, /// 기본색 - 다른 색의 구성요소로 사용되는 컬러
      primaryContainer: LoturaDarkColor.main50, /// 기본색 - 다른 색의 바탕이 되는 컬러
      primaryFixed: LoturaDarkColor.main300, /// 기본색 - primaryContainer의 대체품
      secondary: LoturaDarkColor.gray50, /// 보조색 - 제일 많이 사용하는 컬러
      onSecondary: LoturaDarkColor.gray500, /// 보조색 - 다른 색의 구성요소로 사용되는 컬러
      error: LoturaDarkColor.red20, /// 오류 구성요소에 사용할 색상
      onError: LoturaDarkColor.red10, /// 오류 바탕에 사용할 색상
      tertiary: LoturaDarkColor.green20, /// 제 3자 색상 - 구성요소에 사용할 색상
      onTertiary: LoturaDarkColor.green10, /// 제 3자 색상 - 바탕에 사용할 색상
      inverseSurface: LoturaDarkColor.black, /// 바탕과 대비되는 색
      surface: LoturaDarkColor.background, /// 바탕색
      onSurface: LoturaDarkColor.white, /// 바탕 위 구성요소에 사용할 색
      surfaceContainerHigh: LoturaDarkColor.gray900, /// 페이지에서 강조되어야하는 구성요소에 사용되는 색상
      surfaceContainerHighest: LoturaDarkColor.gray800, /// 페이지에서 더 강조되어야하는 구성요소에 사용되는 색상
      surfaceContainer: LoturaDarkColor.gray700, /// 페이지, 위젯들을 부가설명하는 구성요소에 사용되는 색상
      surfaceContainerLow: LoturaDarkColor.gray600, /// SurfaceContainer보다 덜 강조되어야하는 구성요소에 사용되는 색상
      surfaceContainerLowest: LoturaDarkColor.gray100, /// 구성 요소중에 가장 덜 강조되어야하는 구성요소에 사용되는 색상
      surfaceDim: LoturaDarkColor.gray200,
      surfaceTint: LoturaDarkColor.gray300,
    ),
  );
}

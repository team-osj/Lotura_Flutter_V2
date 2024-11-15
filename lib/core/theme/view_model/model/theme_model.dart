import 'package:flutter/material.dart';
import 'package:lotura_v2/core/theme/view_model/state/get_theme_option_state.dart';

class ThemeModel {
  final GetThemeOptionState state;
  final ThemeMode? mode;

  ThemeModel({
    required this.state,
    required this.mode,
  });

  ThemeModel copyWith({
    GetThemeOptionState? state,
    ThemeMode? mode,
  }) {
    return ThemeModel(
      state: state ?? this.state,
      mode: mode ?? this.mode,
    );
  }
}

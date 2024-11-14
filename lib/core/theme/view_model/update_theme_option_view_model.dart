import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/hive/theme_option.dart';
import 'package:lotura_v2/domain/use_case/theme/update_theme_option_use_case.dart';
import 'package:lotura_v2/core/theme/view_model/state/update_theme_option_state.dart';

class UpdateThemeOptionViewModel extends StateNotifier<UpdateThemeOptionState> {
  final UpdateThemeOptionUseCase _updateThemeOptionUseCase;

  UpdateThemeOptionViewModel({
    required UpdateThemeOptionUseCase updateThemeOptionUseCase,
  })  : _updateThemeOptionUseCase = updateThemeOptionUseCase,
        super(UpdateThemeOptionState.initial);

  Future<void> execute({
    required Brightness brightness,
  }) async {
    try {
      state = UpdateThemeOptionState.loading;

      final mode = switch(brightness) {
        Brightness.dark => ThemeOption.light,
        Brightness.light => ThemeOption.dark,
      };

      await _updateThemeOptionUseCase.execute(mode: mode);

      state = UpdateThemeOptionState.success;
    } catch (err) {
      state = UpdateThemeOptionState.failure;

      throw Exception(err.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/hive/theme_option.dart';
import 'package:lotura_v2/core/theme/view_model/model/theme_model.dart';
import 'package:lotura_v2/domain/use_case/theme/get_theme_option_use_case.dart';
import 'package:lotura_v2/core/theme/view_model/state/get_theme_option_state.dart';

class GetThemeOptionViewModel extends StateNotifier<ThemeModel> {
  final GetThemeOptionUseCase _getThemeOptionUseCase;

  GetThemeOptionViewModel({
    required GetThemeOptionUseCase getThemeOptionUseCase,
  })  : _getThemeOptionUseCase = getThemeOptionUseCase,
        super(
          ThemeModel(
            state: GetThemeOptionState.initial,
            mode: null,
          ),
        );

  Future<void> execute() async {
    try {
      state = state.copyWith(state: GetThemeOptionState.initial);

      final response = await _getThemeOptionUseCase.execute();

      switch (response) {
        case ThemeOption.light:
          state = state.copyWith(mode: ThemeMode.light);
        case ThemeOption.dark:
          state = state.copyWith(mode: ThemeMode.dark);
        default:
          state = state.copyWith(mode: ThemeMode.system);
      }

      state = state.copyWith(state: GetThemeOptionState.success);
    } catch (err) {
      state = state.copyWith(state: GetThemeOptionState.failure);

      throw Exception(err.toString());
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/window/provider/window_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/window/get_window_option_use_case.dart';

final getWindowOptionUseCaseProvider = Provider<GetWindowOptionUseCase>(
  (ref) => GetWindowOptionUseCase(
    windowRepository: ref.watch(windowRepositoryProvider),
  ),
);

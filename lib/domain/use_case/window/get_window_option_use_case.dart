import 'package:lotura_v2/core/hive/window_option.dart';
import 'package:lotura_v2/domain/repository/window/window_repository.dart';

class GetWindowOptionUseCase {
  final WindowRepository _windowRepository;

  GetWindowOptionUseCase({
    required WindowRepository windowRepository,
  }) : _windowRepository = windowRepository;

  Future<WindowOption?> execute() async => _windowRepository.getWindowOption();
}

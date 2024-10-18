import 'package:lotura_v2/core/hive/window_option.dart';
import 'package:lotura_v2/domain/repository/window/window_repository.dart';

class UpdateWindowOptionUseCase {
  final WindowRepository _windowRepository;

  UpdateWindowOptionUseCase({
    required WindowRepository windowRepository,
  }) : _windowRepository = windowRepository;

  Future<void> execute({required WindowOption option}) async =>
      _windowRepository.updateWindowOption(option: option);
}

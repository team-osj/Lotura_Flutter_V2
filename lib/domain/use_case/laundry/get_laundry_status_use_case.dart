import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:lotura_v2/domain/repository/laundry/laundry_repository.dart';

class GetLaundryStatusUseCase {
  final LaundryRepository _laundryRepository;

  GetLaundryStatusUseCase({
    required LaundryRepository laundryRepository,
  }) : _laundryRepository = laundryRepository;

  Stream<LaundryEntity> get laundryList => _laundryRepository.laundryList;

  void execute() {
    _laundryRepository.initWebSocket();
  }
}

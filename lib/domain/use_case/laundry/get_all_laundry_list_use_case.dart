import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:lotura_v2/domain/repository/laundry/laundry_repository.dart';

class GetAllLaundryListUseCase {
  final LaundryRepository _laundryRepository;

  GetAllLaundryListUseCase({
    required LaundryRepository laundryRepository,
  }) : _laundryRepository = laundryRepository;

  Future<List<LaundryEntity>> execute() =>
      _laundryRepository.getAllLaundryList();
}

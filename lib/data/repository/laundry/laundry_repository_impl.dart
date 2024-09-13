import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/data/data_source/laundry/local/local_laundry_data_source.dart';
import 'package:lotura_v2/domain/repository/laundry/laundry_repository.dart';

class LaundryRepositoryImpl implements LaundryRepository {
  final LocalLaundryDataSource _localLaundryDataSource;

  LaundryRepositoryImpl({
    required LocalLaundryDataSource localLaundryDataSource,
  }) : _localLaundryDataSource = localLaundryDataSource;

  @override
  Future<void> updateRoomOption({
    required String key,
    required LaundryRoomOption value,
  }) async =>
      _localLaundryDataSource.updateRoomOption(key: key, value: value);

  @override
  Future<LaundryRoomOption?> getRoomOption({
    required String key,
  }) async => _localLaundryDataSource.getRoomOption(key: key);
}

import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/data/data_source/laundry/local/local_laundry_data_source.dart';
import 'package:lotura_v2/data/data_source/laundry/remote/remote_laundry_data_source.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:lotura_v2/domain/repository/laundry/laundry_repository.dart';

class LaundryRepositoryImpl implements LaundryRepository {
  final LocalLaundryDataSource _localLaundryDataSource;
  final RemoteLaundryDataSource _remoteLaundryDataSource;

  LaundryRepositoryImpl({
    required LocalLaundryDataSource localLaundryDataSource,
    required RemoteLaundryDataSource remoteLaundryDataSource,
  })  : _localLaundryDataSource = localLaundryDataSource,
        _remoteLaundryDataSource = remoteLaundryDataSource;

  @override
  Stream<LaundryEntity> get laundryList =>
      _remoteLaundryDataSource.laundryList.asBroadcastStream();

  @override
  void initWebSocket() => _remoteLaundryDataSource.initWebSocket();

  @override
  Future<List<LaundryEntity>> getAllLaundryList() =>
      _remoteLaundryDataSource.getAllLaundryList();

  @override
  Future<void> updateRoomOption({
    required LaundryRoomOption value,
  }) async =>
      _localLaundryDataSource.updateRoomOption(value: value);

  @override
  Future<LaundryRoomOption?> getRoomOption() async =>
      _localLaundryDataSource.getRoomOption();
}

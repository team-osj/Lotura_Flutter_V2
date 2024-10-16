import 'package:lotura_v2/data/data_source/notice/local/local_notice_data_source.dart';
import 'package:lotura_v2/data/data_source/notice/remote/remote_notice_data_source.dart';
import 'package:lotura_v2/domain/entity/notice/notice_entity.dart';
import 'package:lotura_v2/domain/repository/notice/notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository {
  final LocalNoticeDataSource _localNoticeDataSource;
  final RemoteNoticeDataSource _remoteNoticeDataSource;

  NoticeRepositoryImpl({
    required LocalNoticeDataSource localNoticeDataSource,
    required RemoteNoticeDataSource remoteNoticeDataSource,
  })  : _localNoticeDataSource = localNoticeDataSource,
        _remoteNoticeDataSource = remoteNoticeDataSource;

  @override
  Future<List<NoticeEntity>> getNotice() async =>
      _remoteNoticeDataSource.getNotice();

  @override
  Future<List<int?>> getNoticeOption() async =>
      _localNoticeDataSource.getNoticeOption();

  @override
  Future<void> updateNoticeOption({required int id}) async =>
      _localNoticeDataSource.updateNoticeOption(id: id);
}

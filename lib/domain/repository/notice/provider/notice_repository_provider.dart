import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/notice/local/provider/local_notice_data_source_provider.dart';
import 'package:lotura_v2/data/data_source/notice/remote/provider/remote_notice_data_source_provider.dart';
import 'package:lotura_v2/data/repository/notice/notice_repository_impl.dart';
import 'package:lotura_v2/domain/repository/notice/notice_repository.dart';

final noticeRepositoryProvider = Provider<NoticeRepository>(
  (ref) => NoticeRepositoryImpl(
    localNoticeDataSource: ref.watch(localNoticeDataSourceProvider),
    remoteNoticeDataSource: ref.watch(remoteNoticeDataSourceProvider),
  ),
);

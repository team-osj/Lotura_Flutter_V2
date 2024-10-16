import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/notice/remote/remote_notice_data_source.dart';

final remoteNoticeDataSourceProvider = Provider<RemoteNoticeDataSource>(
  (ref) => RemoteNoticeDataSource(),
);

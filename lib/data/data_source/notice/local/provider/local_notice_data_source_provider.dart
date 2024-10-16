import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/notice/local/local_notice_data_source.dart';

final localNoticeDataSourceProvider = Provider<LocalNoticeDataSource>(
  (ref) => LocalNoticeDataSource(),
);

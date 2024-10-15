import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/laundry/remote/remote_laundry_data_source.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';

final remoteLaundryDataSourceProvider = Provider<RemoteLaundryDataSource>((ref) {
  final streamController = StreamController<LaundryEntity>.broadcast();
  return RemoteLaundryDataSource(streamController: streamController);
});

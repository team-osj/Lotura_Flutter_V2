import 'dart:async';
import 'dart:convert';

import 'package:lotura_v2/core/network/dio.dart';
import 'package:lotura_v2/core/network/secret.dart';
import 'package:lotura_v2/data/dto/laundry/response/laundry_response.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RemoteLaundryDataSource {
  final StreamController<LaundryEntity> _streamController;

  RemoteLaundryDataSource({
    required StreamController<LaundryEntity> streamController,
  }) : _streamController = streamController;

  Stream<LaundryEntity> get laundryList =>
      _streamController.stream.asBroadcastStream();

  /// 소켓 연결
  void initWebSocket() async {
    final channel = WebSocketChannel.connect(Uri.parse(webSocketUrl));
    await channel.ready;
    channel.stream.listen((data) {
      _streamController.sink.add(
          LaundryResponse.fromJson(jsonDecode(data) as Map<String, dynamic>)
              .toEntity());
    });
  }

  /// 세탁실 정보 요청
  Future<List<LaundryEntity>> getAllLaundryList() async {
    final response = await dio.get("/device_list_boy");

    if (response.statusCode != 200) {
      throw Exception(response.data);
    }

    return (response.data as List<dynamic>)
        .map((i) => LaundryResponse.fromJson(i).toEntity())
        .toList();
  }
}

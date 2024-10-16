import 'package:lotura_v2/core/network/dio.dart';
import 'package:lotura_v2/data/dto/notice/response/notice_response.dart';
import 'package:lotura_v2/domain/entity/notice/notice_entity.dart';

class RemoteNoticeDataSource {
  Future<List<NoticeEntity>> getNotice() async {
    try {
      final response = await dio.get("/notice");

      return (response.data as List<dynamic>).map((json)
      => NoticeResponse.fromJson(
              response.statusCode!,
              json as Map<String, dynamic>,
            ).toEntity(),
          ).toList();
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

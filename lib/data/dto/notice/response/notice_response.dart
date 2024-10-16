import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/notice/notice_entity.dart';

class NoticeResponse {
  final AsyncValue<int> statusCode;
  final int id;
  final String title;
  final String contents;
  final String date;

  NoticeResponse({
    required this.statusCode,
    required this.id,
    required this.title,
    required this.contents,
    required this.date,
  });

  factory NoticeResponse.fromJson(
    int statusCode,
    Map<String, dynamic> json,
  ) {
    return NoticeResponse(
      statusCode: AsyncData(statusCode),
      id: json['id'],
      title: json['title'],
      contents: json['contents'],
      date: json['date'],
    );
  }

  NoticeEntity toEntity() {
    return NoticeEntity(
      statusCode: statusCode,
      id: id,
      title: title,
      contents: contents,
      date: date,
    );
  }
}

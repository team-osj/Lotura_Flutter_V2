import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeEntity {
  final AsyncValue<int> statusCode;
  final int id;
  final String title;
  final String contents;
  final String date;

  const NoticeEntity({
    required this.statusCode,
    required this.id,
    required this.title,
    required this.contents,
    required this.date,
  });
}

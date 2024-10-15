import 'package:dio/dio.dart';
import 'package:lotura_v2/core/network/secret.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl
  )
);

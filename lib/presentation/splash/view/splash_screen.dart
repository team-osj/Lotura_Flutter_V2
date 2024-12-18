import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/laundry/provider/get_stream_laundry_view_model_provider.dart';
import 'package:lotura_v2/core/theme/view_model/provider/get_theme_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/get_notice_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/get_notice_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/get_laundry_room_option_view_model_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 테마 설정 불러오기
      ref.read(getThemeOptionViewModelProvider.notifier).execute();

      /// splash 화면에서 메인 세탁실 설정을 불러옴
      ref.read(getLaundryRoomOptionViewModelProvider.notifier).execute();

      /// 앱이 빌드될 떄 서버 소켓과 연결
      ref.read(getStreamLaundryViewModelProvider.notifier).getLaundryEvent();

      /// 모든 장치의 상태를 GET 요청함
      ref.read(getStreamLaundryViewModelProvider.notifier).getAllLaundryList();

      /// 읽은 공지사항 리스트를 불러옴
      ref.read(getNoticeOptionViewModelProvider.notifier).execute();

      /// 공지사항 전체 리스트를 GET 요청
      ref.read(getNoticeViewModelProvider.notifier).execute();
      Future.delayed(const Duration(milliseconds: 1100)).then((value) => context.go("/"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      child: Center(
        child: Image.asset(
          "$imageCoreAsset/lotura_${Theme.of(context).colorScheme.brightness.name}_splash_image.png",
          width: 280,
          height: 280,
        ),
      ),
    );
  }
}

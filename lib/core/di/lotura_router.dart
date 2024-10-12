import 'package:go_router/go_router.dart';
import 'package:lotura_v2/presentation/main/view/main_screen.dart';
import 'package:lotura_v2/presentation/notice/view/notice_detail_screen.dart';
import 'package:lotura_v2/presentation/notice/view/notice_main_screen.dart';
import 'package:lotura_v2/presentation/setting/view/setting_screen.dart';
import 'package:lotura_v2/presentation/splash/view/splash_screen.dart';

final GoRouter loturaRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const MainScreen();
      },
    ),
    GoRoute(
      path: "/splash",
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: "/notice",
      builder: (context, state) {
        return const NoticeMainScreen();
      },
    ),
    GoRoute(
      path: "/noticeDetail",
      builder: (context, state) {
        return const NoticeDetailScreen();
      },
    ),
    GoRoute(
      path: "/setting",
      builder: (context, state) {
        return const SettingScreen();
      },
    ),
  ],
);

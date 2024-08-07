import 'package:go_router/go_router.dart';
import 'package:lotura_v2/presentation/main/view/main_screen.dart';
import 'package:lotura_v2/presentation/splash/view/splash_screen.dart';

final GoRouter loturaRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) {
        return const MainScreen();
      },
    ),
  ],
);

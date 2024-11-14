import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lotura_v2/core/hive/theme_option.dart';
import 'package:lotura_v2/core/theme/lotura_theme.dart';
import 'package:lotura_v2/core/di/lotura_router.dart';
import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/core/theme/view_model/provider/get_theme_option_view_model_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  /// Hive Adapter 사용 등록
  Hive.registerAdapter(LaundryRoomOptionAdapter());
  Hive.registerAdapter(ThemeOptionAdapter());
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: loturaRouter,
      darkTheme: LoturaTheme.dark,
      theme: LoturaTheme.light,
      themeMode: ref.watch(getThemeOptionViewModelProvider).mode,
      debugShowCheckedModeBanner: false,
    );
  }
}

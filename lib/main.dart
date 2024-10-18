import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lotura_v2/core/di/lotura_router.dart';
import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/core/hive/window_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  /// Hive 어댑터 등록
  Hive.registerAdapter(LaundryRoomOptionAdapter());
  Hive.registerAdapter(WindowOptionAdapter());
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: loturaRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

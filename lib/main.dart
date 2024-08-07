import 'package:flutter/material.dart';
import 'package:lotura_v2/core/di/lotura_router.dart';

void main() {
  runApp(const MyApp());
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_scaffold.dart';
import 'package:lotura_v2/core/constants/lotura_asset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      context.go("/main");
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoturaScaffold(
      child: Center(
        child: SvgPicture.asset(
          "$coreAsset/o_icon.svg",
        ),
      ),
    );
  }
}

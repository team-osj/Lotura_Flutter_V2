import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/apply/view/apply_screen.dart';
import 'package:lotura_v2/presentation/laundry/view/laundry_screen.dart';
import 'package:lotura_v2/presentation/main/widget/main_app_bar.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/get_laundry_room_option_view_model_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final laundryRoomOption =
          ref.watch(getLaundryRoomOptionViewModelProvider).option;

      /// laundryRoomOption의 기본 값은 null이므로, null값을 option enum 타입으로 변경해줘야함.
      if (laundryRoomOption == null) {
        ref.read(getLaundryRoomOptionViewModelProvider.notifier).execute();
      }
    });

    controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      appBar: const MainAppBar(),
      child: TabBarView(
        controller: controller,
        children: const [
          ApplyScreen(),
          LaundryScreen(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/presentation/main/provider/view_option_state_provider.dart';
import 'package:lotura_v2/presentation/main/widget/view_option/main_view_option_button.dart';

class MainViewOptionSwitch extends ConsumerStatefulWidget {
  const MainViewOptionSwitch({super.key});

  @override
  ConsumerState<MainViewOptionSwitch> createState() =>
      _MainViewOptionSwitchState();
}

class _MainViewOptionSwitchState extends ConsumerState<MainViewOptionSwitch> {
  @override
  Widget build(BuildContext context) {
    /// 화면 옵션 확인
    final viewOption = ref.watch(viewOptionStateProvider);
    /// 화면 옵션 수정
    final changeViewOption = ref.read(viewOptionStateProvider.notifier);
    return Row(
      children: [
        Container(
          width: 170,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: LoturaColor.gray50,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Stack(
              children: [
                AnimatedAlign(
                  /// -1, 1로 왼쪽 오른쪽 구분해 배치
                  /// -1 : 왼쪽 , 1 : 오른쪽
                  alignment: Alignment(viewOption == 0 ? -1 : 1, 0),
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 79,
                    height: 30,
                    decoration: BoxDecoration(
                      color: LoturaColor.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    /// 이벤트 실행 시, 화면에 변화가 필요 없다면 이벤트가 실행되지 않도록 예외처리
                    if (viewOption == 1) {
                      changeViewOption.state = 0;
                    }
                  },
                  child: Align(
                    alignment: const Alignment(-1, 0),
                    child: MainViewOptionButton(
                      text: "내 세탁실",
                      isSwitched: viewOption == 0 ? true : false,
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    /// 이벤트 실행 시, 화면에 변화가 필요 없다면 이벤트가 실행되지 않도록 예외처리
                    if (viewOption == 0) {
                      changeViewOption.state = 1;
                    }
                  },
                  child: Align(
                    alignment: const Alignment(1, 0),
                    child: MainViewOptionButton(
                      text: "세탁실 현황",
                      isSwitched: viewOption == 1 ? true : false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

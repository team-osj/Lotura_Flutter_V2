import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/presentation/main/provider/view_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/main/widget/view_option/main_view_option_button.dart';

class MainViewOptionSwitch extends ConsumerStatefulWidget {
  const MainViewOptionSwitch({super.key});

  @override
  ConsumerState<MainViewOptionSwitch> createState() =>
      _MainViewOptionSwitchState();
}

class _MainViewOptionSwitchState extends ConsumerState<MainViewOptionSwitch> {
  static const double width = 192, height = 41, itemWidth = 88, itemHeight = 33;
  @override
  Widget build(BuildContext context) {
    /// 화면 옵션 확인
    final viewOption = ref.watch(viewOptionViewModelProvider);
    /// 화면 옵션 수정
    final changeViewOption = ref.read(viewOptionViewModelProvider.notifier);
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
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
                    width: itemWidth,
                    height: itemHeight,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                LoturaGesture(
                  behavior: HitTestBehavior.deferToChild,
                  event: () {
                    /// 이벤트 실행 시, 화면에 변화가 필요 없다면 이벤트가 실행되지 않도록 예외처리
                    if (viewOption != 0) {
                      changeViewOption.changeOption(index: 0);
                    }
                  },
                  child: Align(
                    alignment: const Alignment(-1, 0),
                    child: MainViewOptionButton(
                      width: itemWidth,
                      /// 사이드 부분을 터치하는 경우까지 고려해서 높이 지정
                      height: height,
                      text: "내 세탁실",
                      isSwitched: viewOption == 0 ? true : false,
                    ),
                  ),
                ),
                LoturaGesture(
                  behavior: HitTestBehavior.deferToChild,
                  event: () {
                    /// 이벤트 실행 시, 화면에 변화가 필요 없다면 이벤트가 실행되지 않도록 예외처리
                    if (viewOption == 0) {
                      changeViewOption.changeOption(index: 1);
                    }
                  },
                  child: Align(
                    alignment: const Alignment(1, 0),
                    child: MainViewOptionButton(
                      width: itemWidth,
                      /// 사이드 부분을 터치하는 경우까지 고려해서 높이 지정
                      height: height,
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

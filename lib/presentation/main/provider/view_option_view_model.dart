import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewOptionViewModel extends StateNotifier<int> {
  ViewOptionViewModel() : super(1) {
    controller.addListener(_onPageChanged);
  }

  final PageController controller = PageController(initialPage: 1);

  void changeOption({required int index}) {
    controller.jumpToPage(index);
    state = index;
  }

  void _onPageChanged() {
    final currentIndex = controller.page!.round();
    state = currentIndex;
  }
}

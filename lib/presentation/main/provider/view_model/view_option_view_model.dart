import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewOptionViewModel extends StateNotifier<int> {
  ViewOptionViewModel() : super(1) {
    controller.addListener(_onPageChanged);
  }

  final PageController controller = PageController(initialPage: 1);

  void changeOption({required int index}) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    ).then((_) {
      state = index;
    });
  }

  void _onPageChanged() {
    final index = controller.page!.round();
    state = index;
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewOptionStateProvider = StateProvider<int>((ref) => 0);

class ViewOptionController {
  final int pageIndex;

  ViewOptionController({required this.pageIndex});
}

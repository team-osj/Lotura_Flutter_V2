import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/presentation/main/provider/view_model/view_option_view_model.dart';

final viewOptionViewModelProvider =
    StateNotifierProvider.autoDispose<ViewOptionViewModel, int>((ref) => ViewOptionViewModel(),
);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/presentation/setting/provider/get_laundry_room_option_view_model_provider.dart';

final localLaundryRoomOptionProvider = StateProvider<String>((ref) => ref.watch(getLaundryRoomOptionViewModelProvider).option ?? "남자 학교측");

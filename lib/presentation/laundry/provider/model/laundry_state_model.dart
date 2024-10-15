import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';

class LaundryStateModel<T> {
  final T state;
  final List<LaundryEntity> values;

  LaundryStateModel({
    required this.state,
    required this.values,
  });

  LaundryStateModel<T> copyWith({
    T? state,
    List<LaundryEntity>? values,
  }) {
    return LaundryStateModel(
      state: state ?? this.state,
      values: values ?? this.values,
    );
  }
}

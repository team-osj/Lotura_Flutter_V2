class LaundryModel<T> {
  final List<T> values;

  LaundryModel({
    required this.values,
  });

  LaundryModel<T> copyWith({
    List<T>? values,
  }) {
    return LaundryModel(
      values: values ?? this.values,
    );
  }
}

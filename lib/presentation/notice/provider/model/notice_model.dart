class NoticeModel<T, D> {
  final T state;
  final D values;

  NoticeModel({
    required this.state,
    required this.values,
  });

  NoticeModel<T, D> copyWith({
    T? state,
    D? values,
  }) {
    return NoticeModel<T, D>(
      state: state ?? this.state,
      values: values ?? this.values,
    );
  }
}

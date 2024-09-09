class LaundryRoomOptionEntity<T> {
  final T state;
  final String? option;

  LaundryRoomOptionEntity({
    required this.state,
    required this.option,
  });

  LaundryRoomOptionEntity<T> copyWith({
    T? state,
    String? option,
  }) {
    return LaundryRoomOptionEntity<T>(
      state: state ?? this.state,
      option: option ?? this.option,
    );
  }
}

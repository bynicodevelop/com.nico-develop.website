class FieldRequiredException implements Exception {
  final String message;

  const FieldRequiredException(
    this.message,
  );

  @override
  String toString() {
    return message;
  }
}

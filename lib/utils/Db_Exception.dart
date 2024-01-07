class DbException implements Exception {
  int? code;
  String? message;
  DbException(this.code, this.message);
}

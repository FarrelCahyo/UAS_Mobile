class CurrencyException implements Exception {
  String message;

  CurrencyException([this.message = 'Ada sesuatu yang salah']) {
    message = 'Pengecualian mata uang $message';
  }

  @override
  String toString() {
    return message;
  }
}

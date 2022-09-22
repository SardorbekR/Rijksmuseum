class ServerException implements Exception {
  final int? statusCode;

  const ServerException([this.statusCode]);

  @override
  String toString() {
    return "${statusCode ?? ''}";
  }
}

class NetworkException implements Exception {
  final String errorMsg = "No Internet Connection"; //Can replace this with localization key

  const NetworkException();

  @override
  String toString() => errorMsg;
}

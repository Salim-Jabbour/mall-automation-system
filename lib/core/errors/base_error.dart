class Failure {
  Failure({required this.message, this.statusCode});
  String message;
  int? statusCode;
}

/// general failures
class ServerFailure implements Failure {
  @override
  String message = 'Unexpexted Error Occured';
  @override
  int? statusCode;
}

class NoInternetFailure implements Failure {
  @override
  String message = 'No Internet Connection';
  @override
  int? statusCode;
}

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailures extends Failure {
  ServerFailures(super.errMessage);

  factory ServerFailures.fromDioExaction(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailures('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailures('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailures('Bad certificate with ApiServer');

      case DioExceptionType.badResponse:
        if (dioException.response != null) {
          return ServerFailures.fromResponse(
              dioException.response!.statusCode!, dioException.response!.data);
        } else {
          return ServerFailures('Bad response from ApiServer');
        }

      case DioExceptionType.cancel:
        return ServerFailures('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailures('Connection error with ApiServer');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailures('No Internet Connection');
        }
        return ServerFailures('Unexpected Error,Please try again');
      default:
        return ServerFailures('Oops There was an Error, Please try again');
    }
  }

  factory ServerFailures.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailures('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailures('Internal Server error, Please try later');
    } else {
      return ServerFailures('Oops There was an Error, Please try again');
    }
  }
}

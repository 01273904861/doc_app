import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// to prevent take an object
  DioFactory._();
  static Dio? dio;
  static Duration timeOut = const Duration(seconds: 30);
  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
       addHeaders();
      addDioInterceptors();
    }
    return dio!;
  }

  static void addHeaders()async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL3JlZ2lzdGVyIiwiaWF0IjoxNzM2MTkxNDUyLCJleHAiOjE3MzYyNzc4NTIsIm5iZiI6MTczNjE5MTQ1MiwianRpIjoiYmpBRzF3clhZbTFrdmxPSCIsInN1YiI6IjMwMzYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.y1LSQvEPA9MH8IGGDiXttD9lsQCFYl5qreM_XvDW8xw',
    };
  }

  static void addDioInterceptors() {
    //?. If the object is null, the expression will return null without throwing an error.
    //If dio is null, the expression does nothing (no logging interceptor is added), and no exception is thrown.
    dio?.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }
}

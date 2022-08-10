
import 'package:eq_works_task/util/serialization/serialization_lib.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import 'http_classes.dart';
import 'i_http_service.dart';

/// an implementation of the http service using dio
class DioHttpService implements IHttpService {
  Dio _dioInstance = Dio();


  DioHttpService() {
    _addLoggerInterceptor(_dioInstance);
    _dioInstance.options.responseType = ResponseType.plain;
  }

  @override
  Future<HttpResponse?> sendRequest(HttpRequest<Serializable> request) async {
    Response dioResponse;
    //
    try {
      dioResponse = await _dioInstance.request(
        request.url,
        data: request.data?.toMap(),
        options: Options(method: describeEnum(request.method), headers: request.headers),
      );
      //
      return _fillResponse(dioResponse);
    } catch (err) {
      _throwError(err);
      return null;
    }
  }

  @override
  void setTimeout(int seconds) {
    _dioInstance.options.connectTimeout = seconds * 1000;
    _dioInstance.options.receiveTimeout = seconds * 1000;
    _dioInstance.options.sendTimeout = seconds * 1000;
  }

  void _addLoggerInterceptor(Dio dio) {
    // log interceptor
    dio.interceptors.add(InterceptorsWrapper(onRequest: (req, handler) {
      print('Api request (${req.method}) url: ${req.baseUrl + req.path}' + ' => ' +
          logData(req.data, req.queryParameters).toString());

      print('request headers =>' + req.headers.toString());
      handler.next(req);
    }, onResponse: (resp, handler) {
      print(
          'Api response (${resp.requestOptions.method}) url: ${resp.requestOptions.baseUrl}  ${resp.requestOptions
              .path} status: ${resp.statusCode} => ${resp.data}');
      print('response headers -> ${resp.headers}');
      handler.next(resp);
    }, onError: (error, handler) {
      print(error.type.toString() + error.message);
      if (error.error != null) print('original error => ${error.error}');
      handler.next(error);
    }));
  }

  Object? logData(Object? data, Object? queryParams) {
    if (queryParams != null && queryParams is Map && queryParams.isNotEmpty) {
      return queryParams;
    } else if (data is FormData) {
      return data.fields
          .map((e) => '${e.key} : ${e.value}')
          .toList()
          .join(' , ');
    } else
      return data;
  }

  HttpResponse? _fillResponse(Response? response) {
    if (response == null) return null;
    //
    return HttpResponse(
        statusCode: response.statusCode, statusMessage: response.statusMessage, data: response.data.toString());
  }


  void _throwError(Object error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          _throwTimeOut(error.error);
          break;
        case DioErrorType.response:
        default:
          _throwResponseError(error.response, error.error);
          break;
      }
    } else {
      _throwOtherError(error);
    }
  }

  void _throwResponseError(Response<dynamic>? response, dynamic error) {
    throw ApiResponseException(
        response?.statusCode ?? 0, response?.statusMessage ?? "")
      ..originalException = error;
  }

  void _throwTimeOut(Object error) {
    throw ApiTimeoutException()
      ..originalException = error;
  }

  void _throwOtherError(Object error) {
    throw error;
  }
}

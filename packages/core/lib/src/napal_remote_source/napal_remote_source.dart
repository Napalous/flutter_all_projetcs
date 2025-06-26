import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';


typedef OnShowLoader = void Function();
typedef OnDismissLoader = void Function();
typedef OnShowMessage = void Function(dynamic error);
typedef OnRefreshToken = void Function();

abstract class NapalRemoteSource {
  final OnShowLoader? onShowLoader;
  final OnDismissLoader? onDismissLoader;
  final OnShowMessage? onShowMessage;
  final OnShowMessage? onShowErrorMessage;
  final OnRefreshToken? onRefreshToken;

  NapalRemoteSource({this.onShowLoader, this.onShowMessage, this.onRefreshToken, this.onDismissLoader, this.onShowErrorMessage}) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _handleRequest,
        onError: _handleError,
        onResponse: _handleResponse,
      ),
    );
  }

  final Dio _dio = Dio();
  CancelToken _cancelToken = CancelToken();

  Future<void> _handleResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  Future<void> _handleRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print("========= API PATH ===========");
      print(options.path);
    }
    if (!YasEnvConfig.shared.publicApis.contains(options.path)) {
      final String accessToken = "(await yasLocalSource.getToken()) ?? """;
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  Future<void> _handleError(DioException error, ErrorInterceptorHandler handler) async {
    if (onShowErrorMessage != null ) {
      onShowErrorMessage!(error.response);
    }
    if (error.response?.statusCode == 401 && onRefreshToken !=null ) {
      onRefreshToken!();
    }
    handler.next(error);
  }

  Future<Either<dynamic, dynamic>> handlePostRequest({required String api, required Map<String, dynamic> data, bool showLoader = true}) async {
    try {
      if (showLoader && onShowLoader !=null ) {
        onShowLoader!();
      }
      final res = await _dio.post('${YasEnvConfig.shared.baseUrl}/$api', data: data, cancelToken: _cancelToken);
      if (showLoader && onDismissLoader !=null ) {
        onDismissLoader!();
      }
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response);
    }
  }

  Future<Either<dynamic, dynamic>> handlePutRequest({required String api, required Map<String, dynamic> data, bool showLoader = true}) async {
    try {
      if (showLoader && onShowLoader !=null ) {
        onShowLoader!();
      }
      final res = await _dio.put('${YasEnvConfig.shared.baseUrl}/$api', data: data, cancelToken: _cancelToken);
      if (showLoader && onDismissLoader !=null ) {
        onDismissLoader!();
      }
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response);
    }
  }

  Future<Either<dynamic, dynamic>> handleFormDataPostRequest({required String api, required FormData data, bool showLoader = true}) async {
    try {
      if (showLoader && onShowLoader !=null ) {
        onShowLoader!();
      }
      final res = await _dio.post('${YasEnvConfig.shared.baseUrl}/$api', data: data, cancelToken: _cancelToken);
      if (showLoader && onDismissLoader !=null ) {
        onDismissLoader!();
      }
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response);
    }
  }

  Future<Either<dynamic, dynamic>> handleGetRequest({required String api, params, data, showLoader = false}) async {
    try {
      if (showLoader && onShowLoader !=null ) {
        onShowLoader!();
      }
      var res = await _dio.get('${YasEnvConfig.shared.baseUrl}/$api', data: data, queryParameters: params, cancelToken: _cancelToken);
      if (showLoader && onDismissLoader !=null ) {
        onDismissLoader!();
      }
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response);
    }
  }

  void cancelAllRequests() {
    _cancelToken.cancel("Toutes les requêtes ont été annulées.");
    _cancelToken = CancelToken();
    if (onDismissLoader != null) {
      onDismissLoader!();
    }
  }
}

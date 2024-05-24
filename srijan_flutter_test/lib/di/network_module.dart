import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:srijan_flutter_test/data/network/rest/api_interceptor.dart';
import 'package:srijan_flutter_test/data/network/rest/api_service.dart';
import 'package:srijan_flutter_test/data/network/rest/network_properties.dart';
import 'package:srijan_flutter_test/data/source/quotes/quotes_data_sources.dart';
import 'package:srijan_flutter_test/data/source/quotes/remote/quotes_remote_datasource.dart';

final baseOptions = Provider<BaseOptions>((ref) => BaseOptions(
    baseUrl: NetworkProperties.baseUrl,
    connectTimeout: const Duration(seconds: 70),
    receiveTimeout: const Duration(seconds: 70),
    sendTimeout: const Duration(seconds: 70)));

final prettyDioLoggerProvider = Provider<PrettyDioLogger>(
  (ref) => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return print(log as String);
    },
  ),
);

final dioProvider = Provider<Dio>(
  (ref) {
    Dio dio = Dio(ref.read(baseOptions));
    dio.interceptors.add(
      ApiInterceptor(),
    );
    dio.interceptors.add(
      ref.read(prettyDioLoggerProvider),
    );

    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) =>
      ApiService(ref.read(dioProvider), baseUrl: NetworkProperties.baseUrl),
);

final quotesRemoteDSProvider = Provider<QuotesRemoteDS>(
  (ref) => QuotesRemoteDSImpl(
    ref.read(apiServiceProvider),
  ),
);
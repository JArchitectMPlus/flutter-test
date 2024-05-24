import 'package:dio/dio.dart';
import 'package:srijan_flutter_test/data/network/rest/api_service.dart';

class ApiInterceptor extends InterceptorsWrapper {
  late ApiService apiService;

  ApiInterceptor();
}

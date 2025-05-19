import 'package:app_nation_case/core/constants/api/api_constants.dart';
import 'package:app_nation_case/core/helper/helper_methods.dart';
import 'package:dio/dio.dart';

class NetworkService {
  final _baseUrl = ApiConstants.dogBreedsBaseUrl;
  late final Dio dio;

  NetworkService() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl))
      ..interceptors.add(InterceptorsWrapper(
        onError: (error, handler) {
          printIfDebug(
              "Error occured in network request. Details: ${error.message}");
        },
      ));
  }
}

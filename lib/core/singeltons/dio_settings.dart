import 'package:dio/dio.dart';
import 'package:test_app/assets/constants/app_constants.dart';


class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: Config.baseUrl,
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: Config.baseUrl,
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio {
    print('dio before => ${_dioBaseOptions.headers}');
    print('dio => ${dioBaseOptions.headers}');
    final Dio dio = Dio(dioBaseOptions);
    print('dio after => ${dio.options.headers}');
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      request: true,
      requestHeader: true,
    ));
    return dio;
  }
}

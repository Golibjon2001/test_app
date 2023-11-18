import 'package:dio/dio.dart';
import 'package:test_app/core/exceptions/exceptions.dart';

abstract class CategoriesRemoteDataSources {
  Future<List<dynamic>> getCategories();
}

class CategoriesRemoteDataSourcesImpl extends CategoriesRemoteDataSources {
  final Dio _dio;

  CategoriesRemoteDataSourcesImpl(this._dio);

  @override
  Future<List> getCategories() async {
    try {
      final response = await _dio.get("/products/categories");
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        print("Category${response.data}");
        return response.data;
      } else {
        if (response.data is Map) {
          throw ServerException(
                  statusCode: response.statusCode!,
                  errorMessage: (response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : "LocaleKeys.error_while_get_product")
              .toString();
        } else {
          throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
        }
      }
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:test_app/core/exceptions/exceptions.dart';
import 'package:test_app/features/home/data/models/product_model.dart';


abstract class ProductRemoteDataSources {
  Future<List<ProductModel>> getUsers();
}

class ProductRemoteDataSourcesImpl extends ProductRemoteDataSources {
  final Dio _dio;
  ProductRemoteDataSourcesImpl(this._dio);
  @override
  Future<List<ProductModel>> getUsers() async {
    try {
      final response = await _dio.get("/products");
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return ((response.data as List<dynamic>).map((e) => ProductModel.fromJson(e)).toList());
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
    }  on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:test_app/core/exceptions/exceptions.dart';
import 'package:test_app/features/administration/data/models/administration_model.dart';

abstract class AdministrationDataSources{
  Future<List<AdministrationModel>> getAdministration();
}
class AdministrationDataSourcesImpl extends AdministrationDataSources{
  final Dio _dio;
  AdministrationDataSourcesImpl(this._dio);
  @override
  Future<List<AdministrationModel>> getAdministration() async{
    try {
      final response = await _dio.get("/users");
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return ((response.data as List<dynamic>).map((e) => AdministrationModel.fromJson(e)).toList());
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
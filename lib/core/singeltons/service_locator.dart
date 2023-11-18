import 'package:get_it/get_it.dart';
import 'package:test_app/core/singeltons/dio_settings.dart';
import 'package:test_app/core/singeltons/storage.dart';
import 'package:test_app/features/administration/data/datasources/administration_datasources.dart';
import 'package:test_app/features/administration/data/repository_impl/administration_repository_impl.dart';
import 'package:test_app/features/categori/data/datasources/categorie_remote_datasources.dart';
import 'package:test_app/features/categori/data/repository_impl/catagorie_repository_impl.dart';
import 'package:test_app/features/home/data/datasources/product_remote_datasources.dart';
import 'package:test_app/features/home/data/repository_impl/product_repository_impl.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerFactory(() => DioSettings());

  serviceLocator.registerLazySingleton(() => ProductRemoteDataSourcesImpl(serviceLocator<DioSettings>().dio));
  serviceLocator.registerLazySingleton(() => ProductRepositoryImpl(serviceLocator<ProductRemoteDataSourcesImpl>()));

  serviceLocator.registerLazySingleton(() => CategoriesRemoteDataSourcesImpl(serviceLocator<DioSettings>().dio));
  serviceLocator.registerLazySingleton(() => CategoriesRepositoryImpl(serviceLocator<CategoriesRemoteDataSourcesImpl>()));

  serviceLocator.registerLazySingleton(() => AdministrationDataSourcesImpl(serviceLocator<DioSettings>().dio));
  serviceLocator.registerLazySingleton(() => AdministrationRepositoryImpl(serviceLocator<AdministrationDataSourcesImpl>()));
}

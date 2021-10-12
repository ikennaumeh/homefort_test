import 'package:get_it/get_it.dart';
import 'package:homefort_test/core/services/photo_service_impl.dart';
import 'photo_service.dart';

GetIt serviceLocator = GetIt.instance;

setupLocator(){
  serviceLocator.registerLazySingleton<PhotoService>(() => PhotoServiceImpl());
}
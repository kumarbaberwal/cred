import 'package:cred/core/network/dio_client.dart';
import 'package:cred/data/home/repositories/home_repository_impl.dart';
import 'package:cred/data/home/sources/data_api.dart';
import 'package:cred/domain/home/repositories/home_repository.dart';
import 'package:cred/domain/home/usecases/get_data_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void serviceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl());

  sl.registerSingleton<DataApi>(DataApiService());

  sl.registerSingleton<GetDataUseCase>(GetDataUseCase());
}

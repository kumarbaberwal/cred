import 'package:cred/core/constants/api_urls.dart';
import 'package:cred/core/network/dio_client.dart';
import 'package:cred/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DataApi {
  Future<Either> getData();
}

class DataApiService extends DataApi {
  @override
  Future<Either> getData() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.baseUrl);
      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}

import 'package:cred/common/helpers/mapper/data_mapper.dart';
import 'package:cred/data/home/models/data_model.dart';
import 'package:cred/data/home/sources/data_api.dart';
import 'package:cred/domain/home/repositories/home_repository.dart';
import 'package:cred/service_locator.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either> getData() async {
    var returnedData = await sl<DataApi>().getData();
    return returnedData.fold((error) {
      return Left(error.toString());
    }, (response) {
       // Extract `data` from the response
      var jsonData = response.data as Map<String, dynamic>;
      var returnedData = DataMapper.toEntity(DataModel.fromJson(jsonData));
      return Right(returnedData);
    });
  }
}

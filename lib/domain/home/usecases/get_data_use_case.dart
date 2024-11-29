import 'package:cred/core/usecase/use_case.dart';
import 'package:cred/domain/home/repositories/home_repository.dart';
import 'package:cred/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetDataUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<HomeRepository>().getData();
  }
}

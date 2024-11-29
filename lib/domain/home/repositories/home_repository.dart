import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either> getData();
}

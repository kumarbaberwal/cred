import 'package:cred/domain/home/usecases/get_data_use_case.dart';
import 'package:cred/presentation/home/cubit/home_state.dart';
import 'package:cred/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  void getData() async {
    var returnedData = await sl<GetDataUseCase>().call();
    returnedData.fold((error) {
      emit(HomeError(error: error));
    }, (data) {
      emit(HomeLoaded(dataEntity: data));
    });
  }
}

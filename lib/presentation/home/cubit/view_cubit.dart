import 'package:cred/presentation/home/cubit/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewCubit extends Cubit<ViewState>{
  ViewCubit() : super(FirstViewState());

  /// Transitions to `FirstViewState`
  void showFirstView() {
    emit(FirstViewState());
  }

  /// Transitions to `SecondViewState`
  void showSecondView() {
    emit(SecondViewState());
  }

  /// Transitions to `ThirdViewState`
  void showThirdView() {
    emit(ThirdViewState());
  }
}
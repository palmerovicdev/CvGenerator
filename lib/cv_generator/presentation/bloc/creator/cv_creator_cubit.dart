import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cv_creator_state.dart';

class CvCreatorCubit extends Cubit<CvCreatorState> {
  CvCreatorCubit() : super(CvCreatorInitial());

  void load() {
    emit(CvCreatorLoading());
  }
}
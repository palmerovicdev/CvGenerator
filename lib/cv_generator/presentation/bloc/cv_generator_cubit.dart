import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cv_generator_state.dart';

class CvGeneratorCubit extends Cubit<CvGeneratorState> {
  CvGeneratorCubit() : super(CvGeneratorInitial());
}
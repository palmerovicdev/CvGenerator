import 'package:bloc/bloc.dart';
import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'cv_creator_state.dart';

class CvCreatorCubit extends Cubit<CvCreatorState> {
  CvCreatorCubit() : super(CvCreatorInitial());

  void load() async{
    await serviceLocator.getConfigurationData().resumeTemplateData;
    emit(CvCreatorLoading());
  }
}
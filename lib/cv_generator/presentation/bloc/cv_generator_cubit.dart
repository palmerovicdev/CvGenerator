import 'package:bloc/bloc.dart';
import 'package:cv_generator/cv_generator/domain/entities/resume_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/service_locator/service_locator.dart';

part 'cv_generator_state.dart';

class CvGeneratorCubit extends Cubit<CvGeneratorState> {
  CvGeneratorCubit() : super(CvGeneratorLoaded()){
    fetchResume();
  }

  ResumeEntity? _resume;

  ResumeEntity? get resume => _resume;

  void fetchResume() async {
    emit(CvGeneratorLoading());
    try {
      _resume = await serviceLocator.getCvGeneratorDomainService().fetchResume();
      debugPrint(_resume.toString());
      emit(CvGeneratorLoaded());
    } catch (e) {
      emit(const CvGeneratorError('Failed to fetch resume'));
    }
  }
}
import 'package:bloc/bloc.dart';
import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:cv_generator/cv_generator/domain/entities/resume_entity.dart';
import 'package:cv_generator/cv_generator/domain/enums/section_enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'cv_creator_state.dart';

class CvCreatorCubit extends Cubit<CvCreatorState> {
  CvCreatorCubit() : super(CvCreatorInitial());
  ResumeEntity? resumeEntity;

  void load() async {
    emit(CvCreatorLoading());
    resumeEntity = await serviceLocator.getCvCreatorDomainService().fetchResume();
    debugPrint(resumeEntity.toString());
    emit(
      CvCreatorLoaded(
          appBarTitle: resumeEntity?.sections
                  .firstWhere(
                    (element) => element.type == SectionType.personal,
                  )
                  .subSections
                  .firstOrNull
                  .name ??
              'Create your CV'),
    );
  }
}
import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:cv_generator/cv_generator/domain/entities/resume_entity.dart';

abstract class CvCreatorService {
  Future<String> generateCv(Map<String, dynamic> data);

  Future<ResumeEntity?> fetchResume();

  Future<void> saveResume(ResumeEntity resume);
}

class CvGeneratorServiceImplMock implements CvCreatorService {

  @override
  Future<String> generateCv(Map<String, dynamic> data) async {
    return 'success';
  }

  @override
  Future<ResumeEntity?> fetchResume() async => ResumeEntity.fromJson(await serviceLocator.getConfigurationData().resumeTemplateData);

  @override
  Future<void> saveResume(ResumeEntity resume) async {}

}
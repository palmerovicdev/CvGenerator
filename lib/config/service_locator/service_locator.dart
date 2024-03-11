import 'package:cv_generator/cv_generator/presentation/bloc/creator/cv_creator_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../cv_generator/domain/use_cases/cv_creator_service.dart';
import '../configuration_data/configuration_data.dart';
import '../connection/connection_helper.dart';

final serviceLocator = ServiceLocator();

class ServiceLocator {
  final getIt = GetIt.instance;

  void initialize() {
    setupConfigurationData();
    setupConnectionHelper();
    setupDataRepositories();
    setupDataServices();
    setupDomainServices();
    setupCubits();
  }

  // ----------------------------Setups-----------------------------------------

  void setupDataRepositories() {}

  void setupDataServices() {}

  void setupDomainServices() {
    getIt.registerSingleton<CvCreatorService>(CvGeneratorServiceImplMock());
  }

  void setupConnectionHelper() async{
    var config = getConfigurationData();
    getIt.registerSingleton<ConnectionHelper>(
      ConnectionHelper(
          baseUrl: await config.connectionBaseUrl,
          contentType: await config.connectionContentType),
    );
  }

  void setupConfigurationData() {
    getIt.registerSingleton<ConfigurationData>(ConfigurationData());
  }

  void setupCubits() {
    getIt.registerSingleton<CvCreatorCubit>(CvCreatorCubit());
  }


  // ----------------------------Getters-----------------------------------------
  ConfigurationData getConfigurationData() {
    return getIt.get<ConfigurationData>();
  }

  ConnectionHelper getConnectionHelper() {
    return getIt.get<ConnectionHelper>();
  }

  CvCreatorCubit getCvCreatorCubit() {
    return getIt.get<CvCreatorCubit>();
  }
  
  CvCreatorService getCvCreatorDomainService() {
    return getIt.get<CvCreatorService>();
  }
}
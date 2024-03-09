import 'package:get_it/get_it.dart';

import '../../cv_generator/domain/use_cases/cv_generator_service.dart';
import '../../cv_generator/presentation/bloc/cv_generator_cubit.dart';
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
    getIt.registerSingleton<CvGeneratorService>(CvGeneratorServiceImplMock());
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
    getIt.registerSingleton<CvGeneratorCubit>(CvGeneratorCubit());
  }


  // ----------------------------Getters-----------------------------------------
  ConfigurationData getConfigurationData() {
    return getIt.get<ConfigurationData>();
  }

  ConnectionHelper getConnectionHelper() {
    return getIt.get<ConnectionHelper>();
  }

  CvGeneratorCubit getCvGeneratorCubit() {
    return getIt.get<CvGeneratorCubit>();
  }
  
  CvGeneratorService getCvGeneratorDomainService() {
    return getIt.get<CvGeneratorService>();
  }
}
import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/router/go_router.dart';

void main() async {
  initServices();
  runApp(const CvGeneratorApp());
}

void initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator.initialize();
}

class CvGeneratorApp extends StatelessWidget {
  const CvGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.getCvGeneratorCubit()),
      ],
      child: const _CvGeneratorApp(),
    );
  }
}

class _CvGeneratorApp extends StatelessWidget {
  const _CvGeneratorApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cv-Generator',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      routerConfig: router,
    );
  }
}
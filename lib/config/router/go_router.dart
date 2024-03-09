import 'package:cv_generator/config/router/routes.dart';
import 'package:cv_generator/cv_generator/presentation/pages/cv_generator_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.cvGeneratotPage.routePath,
  routes: [
    GoRoute(
      path: Routes.cvGeneratotPage.routePath,
      name: Routes.cvGeneratotPage.name,
      pageBuilder: (context, state) => const MaterialPage(child: CvGeneratorPage()),
    ),
  ],
);
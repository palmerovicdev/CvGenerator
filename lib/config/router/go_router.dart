import 'package:cv_generator/config/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../cv_generator/presentation/pages/cv_creator_page.dart';

final router = GoRouter(
  initialLocation: Routes.cvCreatorPage.routePath,
  routes: [
    GoRoute(
      path: Routes.cvCreatorPage.routePath,
      name: Routes.cvCreatorPage.name,
      pageBuilder: (context, state) => const MaterialPage(child: CvCreatorPage()),
    ),
  ],
);
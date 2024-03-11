import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/creator/cv_creator_cubit.dart';

class CvCreatorPage extends StatelessWidget {
  const CvCreatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvCreatorCubit, CvCreatorState>(
      builder: (context, state) {
        if (state is CvCreatorInitial) {
          serviceLocator.getCvCreatorCubit().load();
        }
        if (state is CvCreatorLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is CvCreatorError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create your CV'),
            ),
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        return const _CvCreatorPage();
      },
    );
  }
}

class _CvCreatorPage extends StatelessWidget {
  const _CvCreatorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvCreatorCubit, CvCreatorState>(
      builder: (context, state) {
        final loadedState = state as CvCreatorLoaded;

        return Scaffold(
          appBar: AppBar(
            title: Text(loadedState.appBarTitle),
          ),
        );
      },
    );
  }
}
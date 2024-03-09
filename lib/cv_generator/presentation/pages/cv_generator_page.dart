import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:cv_generator/cv_generator/presentation/bloc/cv_generator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvGeneratorPage extends StatelessWidget {
  const CvGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CvGeneratorPage();
  }
}

class _CvGeneratorPage extends StatelessWidget {
  const _CvGeneratorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CvGeneratorCubit, CvGeneratorState>(
        builder: (context, state) {
          if (state is CvGeneratorLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CvGeneratorError) {
            return Center(child: Text(state.message));
          }
          return Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: NavigationRail(
                  backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                  minWidth: 40.0,
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                    NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                  ],
                  selectedIndex: 0,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Name: ${serviceLocator.getCvGeneratorCubit().resume?.name}'),
                    Text('Role: ${serviceLocator.getCvGeneratorCubit().resume?.role}'),
                    Text('Location: ${serviceLocator.getCvGeneratorCubit().resume?.location}'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
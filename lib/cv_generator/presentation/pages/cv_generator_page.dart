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
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  NavigationRail(
                    backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                    minWidth: 40.0,
                    destinations: const [
                      NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                      NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                    ],
                    selectedIndex: 0,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
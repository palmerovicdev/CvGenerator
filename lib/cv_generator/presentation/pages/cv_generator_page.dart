import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:cv_generator/cv_generator/presentation/bloc/cv_generator_cubit.dart';
import 'package:cv_generator/cv_generator/presentation/widgets/custom_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../widgets/custom_subsection_widget.dart';

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: ListView(
                    children: [
                      const Gap(20.0),
                      Text(
                        '${serviceLocator.getCvGeneratorCubit().resume?.name}',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: 36.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        '${serviceLocator.getCvGeneratorCubit().resume?.role}',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Text(
                        '${serviceLocator.getCvGeneratorCubit().resume?.location}',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      const Gap(20.0),
                      if (serviceLocator.getCvGeneratorCubit().resume?.sections != null)
                        for (var section in serviceLocator.getCvGeneratorCubit().resume!.sections!)
                          CustomSectionWidget(
                            title: section.title,
                            type: section.type,
                            children: [
                              for (var subsection in section.subsections!)
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: CustomSubsectionWidget(
                                    title: subsection.title,
                                    subtitle: subsection.subtitle,
                                    datePeriod: subsection.datePeriod,
                                    description: subsection.description,
                                    sectionType: section.type,
                                  ),
                                ),
                            ],
                          ),
                      IconButton(
                        onPressed: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return const SizedBox(
                                height: 200.0,
                                child: Center(
                                  child: Text('Hello World'),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
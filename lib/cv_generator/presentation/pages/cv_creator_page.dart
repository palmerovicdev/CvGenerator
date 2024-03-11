import 'package:cv_generator/config/service_locator/service_locator.dart';
import 'package:cv_generator/cv_generator/domain/entities/sections/personal_section.dart';
import 'package:cv_generator/cv_generator/domain/entities/sections/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/creator/cv_creator_cubit.dart';
import '../widgets/personal_section_widget.dart';

class CvCreatorPage extends StatelessWidget {
  const CvCreatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvCreatorCubit, CvCreatorState>(
      builder: (context, state) {
        var cubit = serviceLocator.getCvCreatorCubit();
        if (state is CvCreatorInitial) {
          cubit.load();
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CvCreatorLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CvCreatorError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create your CV'),
            ),
            body: Center(
              child: Text(state.message),
            ),
          );
        }

        var sections = cubit.resumeEntity?.sections;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            title: Text(
              (state as CvCreatorLoaded).appBarTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),
            ),
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: SingleChildScrollView(
              child: _Sections(sections: sections),
            ),
          ),
        );
      },
    );
  }
}

class _Sections extends StatelessWidget {
  const _Sections({
    super.key,
    required this.sections,
  });

  final List<Section>? sections;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 500),
      expansionCallback: (int index, bool isExpanded) {},
      dividerColor: Colors.transparent,
      elevation: 1.0,
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return const ListTile(
              title: Text('Personal Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              onTap: null,
            );
          },
          body: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: PersonalSectionFormWidget(
              size: Size(MediaQuery.of(context).size.width * 0.5, 400),
              sectionTitle: 'Personal Information',
              nameController: TextEditingController(),
              lastNameController: TextEditingController(),
              titleController: TextEditingController(),
              contactFormWidgets: (sections?.firstOrNull?.subSections.firstOrNull as PersonalSubSection)
                  .contacts
                  .map((e) => PersonalSectionContactFormWidget(
                        type: e.type,
                        valueController: TextEditingController(),
                      ))
                  .toList(),
            ),
          ),
          isExpanded: true,
        ),
      ],
    );
  }
}
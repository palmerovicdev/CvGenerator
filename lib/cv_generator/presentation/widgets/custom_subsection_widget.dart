import 'package:cv_generator/theme/text_themes.dart';
import 'package:flutter/material.dart';

import '../../domain/enums/section_type.dart';

class CustomSubsectionWidget extends StatelessWidget {
  const CustomSubsectionWidget({super.key, this.title, this.subtitle, this.datePeriod, this.description, required this.sectionType});

  final String? title;
  final String? subtitle;
  final String? datePeriod;
  final String? description;
  final SectionType sectionType;

  @override
  Widget build(BuildContext context) {
    return sectionType == SectionType.list
        ? Row(
          children: [
            Text('• ', style: TextThemes.subsectionTitle.style),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: _buildSubsection(context),
            )),
          ],
        )
        : Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: _buildSubsection(context),
        );
  }

  Widget _buildSubsection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null && title!.isNotEmpty
              ? Text(
                  title ?? '',
                  style: TextThemes.subsectionTitle.style,
                  softWrap: true,
                )
              : const SizedBox(),
          subtitle != null && subtitle!.isNotEmpty
              ? Text(
                  subtitle ?? '',
                  style: TextThemes.subsectionSubtitle.style,
                  softWrap: true,
                )
              : const SizedBox(),
          datePeriod != null && datePeriod!.isNotEmpty
              ? Text(
                  datePeriod ?? '',
                  style: TextThemes.datePeriod.style,
                  softWrap: true,
                )
              : const SizedBox(),
          description != null && description!.isNotEmpty
              ? Text(
                  description ?? '',
                  style: TextThemes.description.style,
                  softWrap: true,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
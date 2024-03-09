import 'package:cv_generator/cv_generator/domain/entities/subsection_entity.dart';

class SectionEntity{
  final String title;
  final List<SubsectionEntity>? subsections;

  SectionEntity({
    required this.title,
    this.subsections,
  });
}
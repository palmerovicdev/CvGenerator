import 'package:cv_generator/cv_generator/domain/entities/section_entity.dart';

class ResumeEntity{
  final String name;
  final String role;
  final String? location;
  final List<SectionEntity>? sections;

  ResumeEntity({
    required this.name,
    required this.role,
    this.location,
    this.sections,
  });
}
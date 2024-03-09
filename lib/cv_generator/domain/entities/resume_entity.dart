import 'package:cv_generator/cv_generator/domain/entities/section_entity.dart';

class ResumeEntity {
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

  factory ResumeEntity.fromJson(Map<String, dynamic> json) {
    var sections = json['sections'] ?? [];
    List<SectionEntity> sectionsList = sections.isNotEmpty
        ? List<SectionEntity>.from(sections.map((x) => SectionEntity.fromJson(x)))
        : [];
    return ResumeEntity(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      location: json['location'] ?? '',
      sections: sectionsList,
    );
  }

  @override
  String toString() {
    return '{name: $name, role: $role, location: $location, sections: $sections}';
  }
}
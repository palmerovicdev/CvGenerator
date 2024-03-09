import 'package:cv_generator/cv_generator/domain/entities/subsection_entity.dart';
import 'package:cv_generator/cv_generator/domain/enums/section_type.dart';

class SectionEntity {
  final String title;
  final SectionType type;
  final List<SubsectionEntity>? subsections;

  SectionEntity({
    required this.title,
    this.subsections,
    this.type = SectionType.list,
  });

  factory SectionEntity.fromJson(Map<String, dynamic> json) {
    var subsections = json['subsections'] ?? [];
    List<SubsectionEntity>? subsectionsList = subsections.isNotEmpty
        ? List<SubsectionEntity>.from(subsections.map((x) => SubsectionEntity.fromJson(x)))
        : null;
    return SectionEntity(
      title: json['title'] ?? '',
      type: json['type'] == 'wrap' ? SectionType.wrap : SectionType.list,
      subsections: subsectionsList ?? [],
    );
  }
}
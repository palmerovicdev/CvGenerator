import 'package:cv_generator/cv_generator/domain/entities/sections/section.dart';

import '../../enums/section_enums.dart';

class QualifiedListSection extends Section<QualifiedListSubSection> {
  QualifiedListSection({required super.type, required super.name, required super.screenLocation, required super.subSections});

  static Section<QualifiedListSubSection> fromJson(Map<String, dynamic> json) {
    return QualifiedListSection(
      type: SectionType.fromString(json['type']),
      name: json['name'],
      screenLocation: SectionScreenLocation.fromString(json['screen-location']),
      subSections: (json['subsections'] as List).map((subsection) => QualifiedListSubSection.fromJson(subsection)).toList(),
    );
  }

  //toString
  @override
  String toString() {
    return '{type: $type, name: $name, screenLocation: $screenLocation, subSections: $subSections}';
  }
}

class QualifiedListSubSection {
  final String text;
  final String level;

  QualifiedListSubSection({
    required this.text,
    required this.level,
  });

  factory QualifiedListSubSection.fromJson(Map<String, dynamic> json) {
    return QualifiedListSubSection(text: json['text'], level: json['level']);
  }

  //toString
  @override
  String toString() {
    return '{text: $text, level: $level}';
  }
}
import 'package:cv_generator/cv_generator/domain/entities/sections/complete_data_list_section.dart';
import 'package:cv_generator/cv_generator/domain/entities/sections/personal_section.dart';
import 'package:cv_generator/cv_generator/domain/entities/sections/qualified_list_section.dart';
import 'package:cv_generator/cv_generator/domain/entities/sections/section.dart';
import 'package:cv_generator/cv_generator/domain/entities/sections/simple_data_list_section.dart';
import 'package:cv_generator/cv_generator/domain/entities/sections/text_section.dart';
import 'package:cv_generator/cv_generator/domain/enums/section_enums.dart';

class ResumeEntity {
  List<Section> sections;

  ResumeEntity({required this.sections});

  factory ResumeEntity.fromJson(Map<String, dynamic> json) {
    return ResumeEntity(
        sections: (json['sections'] as List).map((section) {
      switch (SectionType.fromString(section['type'])) {
        case SectionType.personal:
          return PersonalSection.fromJson(section);
        case SectionType.text:
          return TextSection.fromJson(section);
        case SectionType.qualifiedList:
          return QualifiedListSection.fromJson(section);
        case SectionType.simpleDataList:
          return SimpleDataListSection.fromJson(section);
        case SectionType.completeDataList:
          return CompleteDataListSection.fromJson(section);
      }
    }).toList());
  }

  // toString
  @override
  String toString() {
    return '{sections: $sections}';
  }
}
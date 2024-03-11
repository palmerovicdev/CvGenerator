import 'package:cv_generator/cv_generator/domain/entities/sections/section.dart';

import '../../enums/section_enums.dart';

class TextSection extends Section<TextSubSection> {
  TextSection({required super.type, required super.name, required super.screenLocation, required super.subSections});

  static Section<TextSubSection> fromJson(Map<String, dynamic> json) {
    return TextSection(
      type: SectionType.fromString(json['type']),
      name: json['name'],
      screenLocation: SectionScreenLocation.fromString(json['screen-location']),
      subSections: (json['subsections'] as List).map((subsection) => TextSubSection.fromJson(subsection)).toList(),
    );
  }

}

class TextSubSection {
  final String text;

  TextSubSection({required this.text});

  factory TextSubSection.fromJson(Map<String, dynamic> json){
    return TextSubSection(text: json['text']);
  }
}
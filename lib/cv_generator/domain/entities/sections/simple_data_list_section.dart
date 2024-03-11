import 'package:cv_generator/cv_generator/domain/entities/sections/section.dart';

import '../../enums/section_enums.dart';

class SimpleDataListSection extends Section<SimpleDataListSubSection> {
  SimpleDataListSection({required super.type, required super.name, required super.screenLocation, required super.subSections});

  static Section<SimpleDataListSubSection> fromJson(Map<String, dynamic> json) {
    return SimpleDataListSection(
      type: SectionType.fromString(json['type']),
      name: json['name'],
      screenLocation: SectionScreenLocation.fromString(json['screen-location']),
      subSections: (json['subsections'] as List).map((subsection) => SimpleDataListSubSection.fromJson(subsection)).toList(),
    );
  }

  //toString
  @override
  String toString() {
    return '{type: $type, name: $name, screenLocation: $screenLocation, subSections: $subSections}';
  }
}

class SimpleDataListSubSection {
  final String title;
  final String startDate;
  final String endDate;
  final String description;
  final String url;

  SimpleDataListSubSection({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.url,
  });

  factory SimpleDataListSubSection.fromJson(Map<String, dynamic> json) {
    return SimpleDataListSubSection(
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
      url: json['url'],
    );
  }

  //toString
  @override
  String toString() {
    return '{title: $title, startDate: $startDate, endDate: $endDate, description: $description, url: $url}';
  }
}
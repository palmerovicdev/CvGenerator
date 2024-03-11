import 'package:cv_generator/cv_generator/domain/entities/sections/section.dart';

import '../../enums/section_enums.dart';

class CompleteDataListSection extends Section<CompleteDataListSubSection> {
  CompleteDataListSection({required super.type, required super.name, required super.screenLocation, required super.subSections});

  static Section<CompleteDataListSubSection> fromJson(Map<String, dynamic> json) {
    return CompleteDataListSection(
      type: SectionType.fromString(json['type']),
      name: json['name'],
      screenLocation: SectionScreenLocation.fromString(json['screen-location']),
      subSections: (json['subsections'] as List).map((subsection) => CompleteDataListSubSection.fromJson(subsection)).toList(),
    );
  }

  //toString
  @override
  String toString() {
    return '{type: $type, name: $name, screenLocation: $screenLocation, subSections: $subSections}';
  }
}

class CompleteDataListSubSection {
  final String title;
  final String headline;
  final String location;
  final String startDate;
  final String endDate;
  final String description;
  final String url;

  CompleteDataListSubSection({
    required this.title,
    required this.headline,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.url,
  });

  factory CompleteDataListSubSection.fromJson(Map<String, dynamic> json) {
    return CompleteDataListSubSection(
      title: json['title'] ?? '',
      headline: json['headline'] ?? '',
      location: json['location'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
    );
  }

  //toString
  @override
  String toString() {
    return '{title: $title, headline: $headline, location: $location, startDate: $startDate, endDate: $endDate, description: $description, url: $url}';
  }
}
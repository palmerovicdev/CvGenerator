import 'package:cv_generator/cv_generator/domain/entities/sections/section.dart';
import 'package:cv_generator/cv_generator/domain/enums/section_enums.dart';

class PersonalSection extends Section<PersonalSubSection>{
  PersonalSection({
    required super.type,
    required super.name,
    required super.screenLocation,
    required super.subSections,
  });

  static Section<PersonalSubSection> fromJson(Map<String, dynamic> json) {
    return PersonalSection(
      type: SectionType.fromString(json['type']),
      name: json['name'],
      screenLocation: SectionScreenLocation.fromString(json['screen-location']),
      subSections: (json['subsections'] as List).map((subsection) => PersonalSubSection.fromJson(subsection)).toList(),
    );
  }
}

class PersonalSubSection {
  final String name;
  final String lastName;
  final String title;
  final List<PersonalContact> contacts;

  PersonalSubSection({
    required this.name,
    required this.lastName,
    required this.title,
    required this.contacts,
  });

  factory PersonalSubSection.fromJson(Map<String, dynamic> json){
    return PersonalSubSection(
        name: json['name'],
        lastName: json['lastname'],
        title: json['title'],
        contacts: (json['contacts'] as List).map((contact) => PersonalContact.fromJson(contact)).toList(),
    );
  }
}

class PersonalContact {
  final String type;
  final String value;

  PersonalContact({
    required this.type,
    required this.value,
  });

  factory PersonalContact.fromJson(Map<String, dynamic> json){
    return PersonalContact(type: json['type'], value: json['value'],);
  }
}
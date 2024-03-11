import '../../enums/section_enums.dart' show SectionScreenLocation, SectionType;

class Section<T> {
  final SectionType type;
  final String name;
  final SectionScreenLocation screenLocation;
  final List<T> subSections;

  Section({
    required this.type,
    required this.name,
    required this.screenLocation,
    required this.subSections,
  });

  //toString
  @override
  String toString() {
    return '{type: $type, name: $name, screenLocation: $screenLocation, subSections: $subSections}';
  }
}
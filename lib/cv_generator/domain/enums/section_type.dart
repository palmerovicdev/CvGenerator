enum SectionType{
  list, wrap, text;

  static SectionType fromString(String type) {
    return SectionType.values.firstWhere((enumType) => enumType.name == type);
  }
}
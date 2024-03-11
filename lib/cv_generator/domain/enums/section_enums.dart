enum SectionType {
  personal,
  text,
  qualifiedList,
  simpleDataList,
  completeDataList;

  static SectionType fromString(String type) => SectionType.values.firstWhere((typeEnum) => typeEnum.name == type);
}

enum SectionScreenLocation {
  top,
  left,
  right,
  bottom;

  static SectionScreenLocation fromString(String location) =>
      SectionScreenLocation.values.firstWhere((locationEnum) => locationEnum.name == location);
}
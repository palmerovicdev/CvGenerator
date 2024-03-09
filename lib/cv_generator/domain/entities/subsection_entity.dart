class SubsectionEntity {
  final String? title;
  final String? subtitle;
  final String? datePeriod;
  final String? description;

  SubsectionEntity({
    this.title,
    this.subtitle,
    this.datePeriod,
    this.description,
  });

  factory SubsectionEntity.fromJson(Map<String, dynamic> json) {
    return SubsectionEntity(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      datePeriod: json['datePeriod'] ?? '',
      description: json['description'] ?? '',
    );
  }

  @override
  String toString() {
    return '{title: $title, subtitle: $subtitle, datePeriod: $datePeriod, description: $description}';
  }
}
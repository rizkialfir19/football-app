import 'package:football_app/common/common.dart';

class Area extends BaseModel {
  final int? id;
  final String? name;
  final String? countryCode;
  final String? ensignUrl;

  Area({
    this.id,
    this.name,
    this.countryCode,
    this.ensignUrl,
  }) : super({
          "id": id,
          "name": name,
          "countryCode": countryCode,
          "ensignUrl": ensignUrl,
        });

  factory Area.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Area(
      id: json['id'],
      name: json['name'],
      countryCode: json['countryCode'],
      ensignUrl: json['ensignUrl'],
    );
  }

  @override
  copyWith({
    int? id,
    String? name,
    String? countryCode,
    String? ensignUrl,
  }) {
    return Area(
      id: id ?? this.id,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      ensignUrl: ensignUrl ?? this.ensignUrl,
    );
  }
}

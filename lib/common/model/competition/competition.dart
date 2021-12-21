import 'package:football_app/common/common.dart';

class Competition extends BaseModel {
  final int? id;
  final Area? area;
  final String? name;
  final String? code;
  final String? emblemUrl;

  Competition({this.id, this.area, this.name, this.code, this.emblemUrl})
      : super({
          "id": id,
          "area": area,
          "name": name,
          "code": code,
          "emblemUrl": emblemUrl,
        });

  factory Competition.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Competition(
      id: json['id'],
      area: Area.fromJson(json['area']),
      name: json['name'],
      code: json['code'],
      emblemUrl: json['emblemUrl'],
    );
  }

  @override
  copyWith({
    int? id,
    Area? area,
    String? name,
    String? code,
    String? emblemUrl,
  }) {
    return Competition(
      id: id ?? this.id,
      area: area ?? this.area,
      name: name ?? this.name,
      code: code ?? this.code,
      emblemUrl: emblemUrl ?? this.emblemUrl,
    );
  }
}

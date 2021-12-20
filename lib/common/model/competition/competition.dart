import 'package:football_app/common/common.dart';

class Competition extends BaseModel {
  final int? id;
  final Area? area;
  final String? name;
  final String? code;

  Competition({
    this.id,
    this.area,
    this.name,
    this.code,
  }) : super({
          "id": id,
          "area": area,
          "name": name,
          "code": code,
        });

  factory Competition.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Competition(
      id: json['id'],
      area: json['area'],
      name: json['name'],
      code: json['code'],
    );
  }

  @override
  copyWith({
    int? id,
    Area? area,
    String? name,
    String? code,
  }) {
    return Competition(
      id: id ?? this.id,
      area: area ?? this.area,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }
}

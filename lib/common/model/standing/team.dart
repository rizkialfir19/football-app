import 'package:football_app/common/common.dart';

class Team extends BaseModel {
  final int? id;
  final String? name;
  final String? crestUrl;

  Team({
    this.id,
    this.name,
    this.crestUrl,
  }) : super({
          "id": id,
          "name": name,
          "crestUrl": crestUrl,
        });

  factory Team.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Team(
      id: json['id'],
      name: json['name'],
      crestUrl: json['crestUrl'],
    );
  }

  @override
  copyWith({
    int? id,
    String? name,
    String? crestUrl,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      crestUrl: crestUrl ?? this.crestUrl,
    );
  }
}

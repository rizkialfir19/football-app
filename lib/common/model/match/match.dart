import 'package:football_app/common/common.dart';

class Match extends BaseModel {
  final String? utcDate;
  final Score? score;

  Match({
    this.utcDate,
    this.score,
  }) : super({
          "utcDate": utcDate,
          "score": score,
        });

  factory Match.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Match(
      utcDate: json['utcDate'],
      score: Score.fromJson(json['score']),
    );
  }

  @override
  copyWith({
    String? utcDate,
    Score? score,
  }) {
    return Match(
      utcDate: utcDate ?? this.utcDate,
      score: score ?? this.score,
    );
  }
}

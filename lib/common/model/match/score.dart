import 'package:football_app/common/common.dart';

class Score extends BaseModel {
  final String? winner;
  final int? fullTimeHomeTeam;
  final int? fullTimeAwayTeam;

  Score({
    this.winner,
    this.fullTimeHomeTeam,
    this.fullTimeAwayTeam,
  }) : super({
          "winner": winner,
          "homeTeam": fullTimeHomeTeam,
          "awayTeam": fullTimeAwayTeam,
        });

  factory Score.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Score(
      winner: json['winner'],
      fullTimeHomeTeam: json['fullTime']['homeTeam'],
      fullTimeAwayTeam: json['fullTime']['awayTeam'],
    );
  }

  @override
  copyWith({
    String? winner,
    int? fullTimeHomeTeam,
    int? fullTimeAwayTeam,
  }) {
    return Score(
      winner: winner ?? this.winner,
      fullTimeAwayTeam: fullTimeAwayTeam ?? this.fullTimeAwayTeam,
      fullTimeHomeTeam: fullTimeHomeTeam ?? this.fullTimeHomeTeam,
    );
  }
}

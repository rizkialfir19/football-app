import 'package:football_app/common/common.dart';

class Score extends BaseModel {
  final String? winner;
  final String? fullTimeHomeTeam;
  final String? fullTimeAwayTeam;
  final String? awayTeamName;
  final String? homeTeamName;

  Score({
    this.winner,
    this.fullTimeHomeTeam,
    this.fullTimeAwayTeam,
    this.awayTeamName,
    this.homeTeamName,
  }) : super({
          "winner": winner,
          "homeTeam": fullTimeHomeTeam,
          "awayTeam": fullTimeAwayTeam,
          "homeTeamName": homeTeamName,
          "awayTeamName": awayTeamName,
        });

  factory Score.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Score(
      winner: json['winner'],
      fullTimeHomeTeam: json['fullTime']['homeTeam'],
      fullTimeAwayTeam: json['fullTime']['awayTeam'],
      homeTeamName: json['homeTeam']['name'],
      awayTeamName: json['awayTeam']['name'],
    );
  }

  @override
  copyWith({
    String? winner,
    String? fullTimeHomeTeam,
    String? fullTimeAwayTeam,
    String? awayTeamName,
    String? homeTeamName,
  }) {
    return Score(
      winner: winner ?? this.winner,
      fullTimeAwayTeam: fullTimeAwayTeam ?? this.fullTimeAwayTeam,
      fullTimeHomeTeam: fullTimeHomeTeam ?? this.fullTimeHomeTeam,
      awayTeamName: awayTeamName ?? this.awayTeamName,
      homeTeamName: homeTeamName ?? this.homeTeamName,
    );
  }
}

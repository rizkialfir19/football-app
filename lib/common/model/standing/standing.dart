import 'package:football_app/common/common.dart';

class Standing extends BaseModel {
  final int? position;
  final Team? team;
  final int? playedGames;
  final int? won;
  final int? draw;
  final int? lost;
  final int? points;
  final int? goalsFor;
  final int? goalsAgainst;
  final int? goalsDifference;

  Standing({
    this.position,
    this.team,
    this.playedGames,
    this.won,
    this.draw,
    this.lost,
    this.points,
    this.goalsFor,
    this.goalsAgainst,
    this.goalsDifference,
  }) : super({
          "position": position,
          "team": team,
          "playedGames": playedGames,
          "won": won,
          "draw": draw,
          "lost": lost,
          "points": points,
          "goalsFor": goalsFor,
          "goalsAgainst": goalsAgainst,
          "goalsDifference": goalsDifference,
        });

  factory Standing.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Standing(
      position: json['position'],
      team: Team.fromJson(json['team']),
      playedGames: json['playedGames'],
      won: json['won'],
      draw: json['draw'],
      lost: json['lost'],
      points: json['points'],
      goalsFor: json['goalsFor'],
      goalsAgainst: json['goalsAgainst'],
      goalsDifference: json['goalsDifference'],
    );
  }

  @override
  copyWith({
    int? position,
    Team? team,
    int? playedGames,
    int? won,
    int? draw,
    int? lost,
    int? points,
    int? goalsFor,
    int? goalsAgainst,
    int? goalsDifference,
  }) {
    return Standing(
      position: position ?? this.position,
      team: team ?? this.team,
      playedGames: playedGames ?? this.playedGames,
      won: won ?? this.won,
      draw: draw ?? this.draw,
      lost: lost ?? this.lost,
      points: points ?? this.points,
      goalsFor: goalsFor ?? this.goalsFor,
      goalsAgainst: goalsAgainst ?? this.goalsAgainst,
      goalsDifference: goalsDifference ?? this.goalsDifference,
    );
  }
}

import 'package:football_app/common/common.dart';

class Match extends BaseModel {
  final String? utcDate;
  final String? status;
  final Score? score;
  final String? awayTeamName;
  final String? homeTeamName;
  final bool? isShowDate;

  Match({
    this.utcDate,
    this.status,
    this.score,
    this.awayTeamName,
    this.homeTeamName,
    this.isShowDate = true,
  }) : super({
          "utcDate": utcDate,
          "status": status,
          "score": score,
          "homeTeamName": homeTeamName,
          "awayTeamName": awayTeamName,
          "isShowDate": isShowDate,
        });

  factory Match.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return Match(
      utcDate: json['utcDate'],
      status: json['status'],
      score: Score.fromJson(json['score']),
      homeTeamName: json['homeTeam']['name'],
      awayTeamName: json['awayTeam']['name'],
    );
  }

  @override
  copyWith({
    String? utcDate,
    String? status,
    Score? score,
    String? awayTeamName,
    String? homeTeamName,
    bool? isShowDate,
  }) {
    return Match(
      utcDate: utcDate ?? this.utcDate,
      status: status ?? this.status,
      score: score ?? this.score,
      awayTeamName: awayTeamName ?? this.awayTeamName,
      homeTeamName: homeTeamName ?? this.homeTeamName,
      isShowDate: isShowDate ?? this.isShowDate,
    );
  }
}

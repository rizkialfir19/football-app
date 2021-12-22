import 'package:dio/dio.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';
import 'package:intl/intl.dart';

part 'match_repository.dart';

abstract class BaseMatchRepository {
  Future<List<Match>> getCompetitionMatch({
    required String competitionId,
  });
}

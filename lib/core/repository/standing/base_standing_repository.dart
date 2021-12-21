import 'package:dio/dio.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';

part 'standing_repository.dart';

abstract class BaseStandingRepository {
  Future<List<Standing>> getCompetitionStanding({
    required String competitionId,
  });
}

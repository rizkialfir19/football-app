import 'package:dio/dio.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';

part 'competition_repository.dart';

abstract class BaseCompetitionRepository {
  Future<List<Competition>> getAllCompetition({
    required String areas,
  });
}

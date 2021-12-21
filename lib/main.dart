import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football_app/app.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';
import 'package:football_app/core/repository/competition/base_competition_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Clients instantiation
  final BaseApiClient _apiClient = DioClient.instance;

  /// Change Base Url Here
  final String _baseUrl = EnvConfig.BASE_PROD_URL;

  // Repositories instantiation
  final BaseCompetitionRepository _competitionRepository =
      CompetitionRepository(
    baseUrl: _baseUrl,
    apiClient: _apiClient,
  );

  final BaseStandingRepository _standingRepository = StandingRepository(
    baseUrl: _baseUrl,
    apiClient: _apiClient,
  );

  final BaseMatchRepository _matchRepository = MatchRepository(
    baseUrl: _baseUrl,
    apiClient: _apiClient,
  );

  // Disable Landscape Mode
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );

  runZonedGuarded(
    () => runApp(
      App(
        //Client
        apiClient: _apiClient,
        //Repository
        competitionRepository: _competitionRepository,
        standingRepository: _standingRepository,
        matchRepository: _matchRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

part of 'base_standing_repository.dart';

class StandingRepository extends BaseStandingRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  StandingRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<Standing>> getCompetitionStanding({
    required String competitionId,
  }) async {
    List<Standing> _results = [];

    Response fetchData = await apiClient.get(
      baseUrl + Url.competitionRepository + "/$competitionId/standings",
      headers: {
        "X-auth-token": EnvConfig.API_TOKEN,
      },
    );

    if (fetchData.data != null) {
      List _rawData = fetchData.data['standings'];
      for (Map singleData in _rawData) {
        _results.add(
          Standing.fromJson(
            Map<String, dynamic>.from(
              singleData,
            ),
          ),
        );
      }
    }

    return _results;
  }
}

part of 'base_competition_repository.dart';

class CompetitionRepository extends BaseCompetitionRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  CompetitionRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<Competition>> getAllCompetition({
    required String areas,
  }) async {
    List<Competition> _results = [];

    Response fetchData = await apiClient.get(
      baseUrl + Url.competitionRepository + "?areas=$areas&plan=TIER_ONE",
      headers: {
        "X-auth-token": EnvConfig.API_TOKEN,
      },
    );

    if (fetchData.data != null) {
      List _rawData = fetchData.data['competitions'];
      for (Map singleData in _rawData) {
        _results.add(
          Competition.fromJson(
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

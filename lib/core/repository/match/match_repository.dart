part of 'base_match_repository.dart';

class MatchRepository extends BaseMatchRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  MatchRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<Match>> getCompetitionMatch({
    required String competitionId,
  }) async {
    List<Match> _results = [];

    DateTime now = DateTime.now();
    DateTime end = now.add(const Duration(days: 14));

    String formattedDateFrom = DateFormat('yyyy-MM-dd').format(now);
    String formattedDateTo = DateFormat('yyyy-MM-dd').format(end);

    Response fetchData = await apiClient.get(
      baseUrl + Url.competitionRepository + "/$competitionId/matches",
      headers: {
        "X-auth-token": EnvConfig.API_TOKEN,
      },
      queryParams: {
        "dateFrom": formattedDateFrom,
        "dateTo": formattedDateTo,
      },
    );

    if (fetchData.data != null) {
      List _rawData = fetchData.data['matches'];
      for (Map singleData in _rawData) {
        _results.add(
          Match.fromJson(
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

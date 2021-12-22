import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';

class MatchCubit extends Cubit<BaseState> {
  final BaseMatchRepository matchRepository;

  MatchCubit({
    required this.matchRepository,
  }) : super(InitializedState());

  /// Get matches based on Competition ID
  void getMatch({
    required String competitionId,
  }) async {
    emit(LoadingState());

    List<Match> _results = [];

    /// Get data from repository
    try {
      _results = await matchRepository.getCompetitionMatch(
          competitionId: competitionId);

      if (_results.isEmpty) {
        emit(EmptyState());
        return;
      }
    } catch (e, s) {
      debugPrint("===> Error $e");
      debugPrint("===> Error $s");
      emit(
        ErrorState(
          error: '$this - Get Match Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
      return;
    }

    /// All validate pass
    emit(
      LoadedState(
        data: _results,
        timestamp: DateTime.now(),
      ),
    );
  }
}

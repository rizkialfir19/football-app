import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';

class CompetitionCubit extends Cubit<BaseState> {
  final BaseCompetitionRepository competitionRepository;

  CompetitionCubit({
    required this.competitionRepository,
  }) : super(InitializedState());

  /// Get competition result
  void getCompetition({
    required String areas,
  }) async {
    emit(LoadingState());

    List<Competition> _results = [];

    /// Get data from repository
    try {
      _results = await competitionRepository.getAllCompetition(areas: areas);

      if (_results.isEmpty) {
        emit(EmptyState());
        return;
      }
    } catch (e, s) {
      debugPrint("===> Error $e");
      debugPrint("===> Error $s");
      emit(
        ErrorState(
          error: '$this - Get Competition Data] - Error : $e',
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

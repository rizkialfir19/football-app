import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';

class StandingCubit extends Cubit<BaseState> {
  final BaseStandingRepository standingRepository;

  StandingCubit({
  required   this.standingRepository,
  }):super(InitializedState());

  /// Get standing data based on competition ID
  void getStanding({required String competitionId,}) async {
    emit(LoadingState());

    List<Standing> _results = [];

    /// Get data from repository
    try {
      _results = await standingRepository.getCompetitionStanding(competitionId: competitionId);

      if (_results.isEmpty) {
        emit(EmptyState());
        return;
      }
    } catch (e,s) {
      debugPrint("===> Error $e");
      debugPrint("===> Error $s");
      emit(
        ErrorState(
          error: '$this - Get Standing Data] - Error : $e',
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/bloc/bloc.dart';
import 'package:football_app/core/core.dart';
import 'package:football_app/ui/ui.dart';

class MatchScreen extends StatelessWidget {
  final Competition? data;

  const MatchScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchCubit(
        matchRepository: context.read<BaseMatchRepository>(),
      )..getMatch(competitionId: data?.id.toString() ?? "0"),
      child: MatchView(
        competition: data,
      ),
    );
  }
}

class MatchView extends StatelessWidget {
  final Competition? competition;

  const MatchView({
    Key? key,
    this.competition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            competition?.name ?? "-",
            style: FontHelper.custom(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        _sectionContent(context),
      ],
    );
  }

  Widget _sectionContent(BuildContext context) {
    return BlocBuilder<MatchCubit, BaseState>(builder: (context, state) {
      List<Match>? _resultsData;

      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Palette.secondary,
          ),
        );
      }

      if (state is EmptyState) {
        return const EmptyOrErrorData(
          category: StateCategory.empty,
        );
      }

      if (state is ErrorState) {
        return EmptyOrErrorData(
          category: StateCategory.error,
          action: () async => context.read<MatchCubit>()
            ..getMatch(
              competitionId: competition?.id.toString() ?? "0",
            ),
        );
      }

      if (state is LoadedState) {
        _resultsData = state.data;
      }

      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(),
      );
    });
  }
}

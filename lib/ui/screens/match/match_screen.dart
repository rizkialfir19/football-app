import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/bloc/bloc.dart';
import 'package:football_app/core/core.dart';
import 'package:football_app/ui/ui.dart';
import 'package:intl/intl.dart';

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
    return BlocBuilder<MatchCubit, BaseState>(
      builder: (context, state) {
        List<Match>? _resultsData;
        List<String> groupDate = [];

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

          // _resultsData?.forEach((element) {
          //   DateTime? tempElementDate;
          //   String? formattedDate;
          //
          //   // if (element.utcDate != null) {
          //   //   tempElementDate = DateTime.parse(element.utcDate!);
          //   //   formattedDate = DateFormat('yyyy-MM-dd').format(tempElementDate);
          //   //
          //   //   if (groupDate.contains(formattedDate)) {
          //   //     element = element.copyWith(
          //   //       isShowDate: false,
          //   //     );
          //   //   } else {
          //   //     groupDate.add(formattedDate);
          //   //     element = element.copyWith(
          //   //       isShowDate: true,
          //   //     );
          //   //   }
          //   // }
          // });
        }

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _resultsData?.length,
            itemBuilder: (context, index) {
              Match? singleData = _resultsData?[index];
              DateTime? tempDate;
              String? formattedDate;

              if (singleData?.utcDate != null) {
                tempDate = DateTime.parse(singleData!.utcDate!);
              }

              if (singleData?.utcDate != null) {
                tempDate = DateTime.parse(singleData!.utcDate!);
                formattedDate = DateFormat('yyyy-MM-dd').format(tempDate);

                if (groupDate.contains(formattedDate)) {
                  singleData = singleData.copyWith(
                    isShowDate: false,
                  );
                } else {
                  groupDate.add(formattedDate);
                  singleData = singleData.copyWith(
                    isShowDate: true,
                  );
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (singleData?.isShowDate != null &&
                      singleData!.isShowDate!) ...[
                    Text(
                      formattedDate ?? "-",
                      style: FontHelper.h6Regular(
                        color: Palette.greyLighten1,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                  ContainerMatch(
                    matchData: singleData,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

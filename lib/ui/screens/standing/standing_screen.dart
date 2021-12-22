import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/bloc/bloc.dart';
import 'package:football_app/core/core.dart';
import 'package:football_app/ui/ui.dart';

class StandingScreen extends StatelessWidget {
  final Competition? data;

  const StandingScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StandingCubit(
        standingRepository: context.read<BaseStandingRepository>(),
      )..getStanding(competitionId: data?.id.toString() ?? "0"),
      child: StandingView(
        competition: data,
      ),
    );
  }
}

class StandingView extends StatelessWidget {
  final Competition? competition;

  const StandingView({
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
    return BlocBuilder<StandingCubit, BaseState>(
      builder: (context, state) {
        List<Standing>? _resultsData;

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
            action: () async => context.read<StandingCubit>()
              ..getStanding(
                competitionId: competition?.id.toString() ?? "0",
              ),
          );
        }

        if (state is LoadedState) {
          _resultsData = state.data;
        }

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _resultsData?.length,
            itemBuilder: (context, index) {
              Standing? singleData = _resultsData?[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  children: [
                    if (index == 0) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Pt",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "P",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "W",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "D",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "L",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "GF",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "GA",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                    ContainerStanding(
                      index: index,
                      singleData: singleData,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

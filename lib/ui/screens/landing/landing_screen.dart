import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';
import 'package:football_app/ui/ui.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompetitionCubit(
        competitionRepository: context.read<BaseCompetitionRepository>(),
      )..getCompetition(areas: ""),
      child: const LandingView(),
    );
  }
}

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => context.read<CompetitionCubit>()
          ..getCompetition(
            areas: "",
          ),
        child: ListView(
          children: [
            _sectionHeader(),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Competition in this Areas",
                    style: FontHelper.custom(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Palette.secondary,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _sectionContent(context),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader() {
    return Container(
      height: 100.0,
      width: double.maxFinite,
      color: Palette.white,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          Images.iconFootball,
          height: 200.0,
          width: 200.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _sectionContent(BuildContext context) {
    return BlocBuilder<CompetitionCubit, BaseState>(
      builder: (context, state) {
        List<Competition>? _resultsData;

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
            action: () async => context.read<CompetitionCubit>()
              ..getCompetition(
                areas: "",
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
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 15.0,
            // ),
            itemCount: _resultsData?.length,
            itemBuilder: (context, index) {
              Competition? singleData = _resultsData?[index];

              return ContainerCompetition(
                data: singleData,
                action: () async {
                  context.read<TabCubit>().changeTab(tab: DetailTab.standing);
                  Navigator.pushNamed(
                    context,
                    RouteName.detailScreen,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

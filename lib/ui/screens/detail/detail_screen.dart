import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';
import 'package:football_app/ui/ui.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  Competition? argsData;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments is Competition) {
      argsData = ModalRoute.of(context)!.settings.arguments as Competition;
    }

    return BlocBuilder<TabCubit, DetailTab>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Palette.white,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Palette.backgroundDark,
            title: const Text("Detail Competition"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Palette.backgroundDark,
            selectedItemColor: Palette.primary,
            unselectedItemColor: Palette.grey,
            selectedLabelStyle: FontHelper.h9Regular(
              color: Palette.primary,
            ),
            unselectedLabelStyle: FontHelper.h9Regular(
              color: Palette.grey,
            ),
            showUnselectedLabels: true,
            onTap: (index) => context.read<TabCubit>().changeTab(
                  tab: DetailTab.values[index],
                ),
            currentIndex: DetailTab.values.indexOf(state),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.timeline,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.timeline,
                      color: Palette.primary,
                    ),
                  ),
                ),
                label: 'Standings',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.watch_later_outlined,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.watch_later_rounded,
                      color: Palette.primary,
                    ),
                  ),
                ),
                label: 'Matches',
              ),
            ],
          ),
          body: _buildContent(
            state,
            argsData: argsData,
          ),
        );
      },
    );
  }

  Widget _buildContent(
    DetailTab state, {
    Competition? argsData,
  }) {
    if (state == DetailTab.standing) {
      return SafeArea(
        child: StandingScreen(
          data: argsData,
        ),
      );
    }
    if (state == DetailTab.match) {
      return SafeArea(
        child: MatchScreen(
          data: argsData,
        ),
      );
    }

    return Container();
  }
}
